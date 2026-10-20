with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

package body Dok_Pkg is

   -- Generatory losowe dla promow
   subtype Zakres_Ilosci is Integer range 10 .. 40;
   package Losowa_Ilosc is new Ada.Numerics.Discrete_Random(Zakres_Ilosci);

   subtype Zakres_Surowca is Integer range 1 .. 4;
   package Losowy_Surowiec is new Ada.Numerics.Discrete_Random(Zakres_Surowca);

   subtype Zakres_Czasu is Integer range 1 .. 4;
   package Losowy_Czas is new Ada.Numerics.Discrete_Random(Zakres_Czasu);

   ----------------------------------------------------------------------------
   -- IMPLEMENTACJA STANOWISKA ROZLADUNKOWEGO (DOKU)
   ----------------------------------------------------------------------------
   task body Dok_Rozladunkowy is
      Dok_Zajety    : Boolean := False;
      Bufor_Ladunku : Ladunek;
      Dziala        : Boolean := True;
   begin
      while Dziala loop
         select
            -- Dok przyjmuje prom tylko gdy bufor ladowiska jest wolny
            when not Dok_Zajety =>
               accept Zglos_Dostawe(L : Ladunek) do
                  Bufor_Ladunku := L;
                  Dok_Zajety    := True;
                  Put_Line("[DOK] Prom #" & Integer'Image(L.Id) & " wyladowal z partia: " &
                           Integer'Image(L.Ilosc) & " kg " & Surowiec'Image(L.Rodzaj));
               end Zglos_Dostawe;

               delay 0.5;
               Put_Line("[DOK] Rozladunek promu #" & Integer'Image(Bufor_Ladunku.Id) &
                        " zakonczony. Towar czeka na lazik transportowy.");
         or
            -- Lazik moze odebrac towar tylko gdy partia czeka na ladowisku
            when Dok_Zajety =>
               accept Pobierz_Dla_Lazika(L : out Ladunek) do
                  L          := Bufor_Ladunku;
                  Dok_Zajety := False;
                  Put_Line("[DOK] Kontener przekazany lazikowi. Ladowisko jest wolne.");
               end Pobierz_Dla_Lazika;
         or
            accept Zakoncz;
            Dziala := False;
         end select;
      end loop;

      Put_Line("[DOK] Stanowisko rozladunkowe zostalo wylaczone.");
   end Dok_Rozladunkowy;

   ----------------------------------------------------------------------------
   -- IMPLEMENTACJA PROMU KOSMICZNEGO
   ----------------------------------------------------------------------------
   task body Prom_Type is
      Gen_I        : Losowa_Ilosc.Generator;
      Gen_S        : Losowy_Surowiec.Generator;
      Gen_T        : Losowy_Czas.Generator;
      Moj_Ladunek  : Ladunek;
      Czas_Dolotu  : Duration;
   begin
      -- Losowy czas pojawienia sie promu
      Losowy_Czas.Reset(Gen_T);
      Czas_Dolotu := Duration(Losowy_Czas.Random(Gen_T));
      delay Czas_Dolotu;

      -- Losowanie surowca i ilosci
      Losowa_Ilosc.Reset(Gen_I);
      Losowy_Surowiec.Reset(Gen_S);

      Moj_Ladunek.Id     := Id;
      Moj_Ladunek.Rodzaj := Konwertuj_Na_Surowiec(Losowy_Surowiec.Random(Gen_S));
      Moj_Ladunek.Ilosc  := Losowa_Ilosc.Random(Gen_I);

      Put_Line("[PROM P" & Integer'Image(Id) & "] Zbliza sie do doku z ladunkiem: " &
               Integer'Image(Moj_Ladunek.Ilosc) & " kg " & Surowiec'Image(Moj_Ladunek.Rodzaj));

      select
         Dok_Rozladunkowy.Zglos_Dostawe(Moj_Ladunek);
         Put_Line("[PROM P" & Integer'Image(Id) & "] Zadokowano pomyslnie. Rozladunek w toku.");
      or
         delay 0.5; -- DOK ZAJETY!
         Put_Line("[PROM P" & Integer'Image(Id) & "] [REZYGNACJA] Dok zajety! Konczy sie paliwo na orbicie, wracam na Ziemie!");
      end select;
   end Prom_Type;

end Dok_Pkg;
