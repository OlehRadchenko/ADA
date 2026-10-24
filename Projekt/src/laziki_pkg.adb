with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random; -- Biblioteka do losowania awarii
with Mars_Typy;   use Mars_Typy;
with Dok_Pkg;     use Dok_Pkg;
with Silosy_Pkg;  use Silosy_Pkg;
with monitor_pkg; use monitor_pkg;

package body Laziki_Pkg is

   task Ladowarka is
      entry Podlacz_Baterie(Id : Integer);
   end Ladowarka;

   task body Ladowarka is
      Czas_ladowania : constant Duration := 3.0;

   begin
      loop
         select
            -- Akceptuje tylko jednego lazika na raz. Inne czekaja w kolejce
            accept Podlacz_Baterie(Id : Integer) do
               Put_Line("[LADOWARKA] Podlaczono LAZIK " & Integer'Image(Id) & ". Rozpoczynam ladowanie...");
               delay Czas_ladowania; -- Symulacja czasu ladowania
            end Podlacz_Baterie;

            Put_Line("[LADOWARKA] Proces zakonczony. Stanowisko wolne.");
         or
            terminate; -- ladowarka wylaczy sie sama, gdy skonczy sie program
         end select;
      end loop;
   end Ladowarka;

   task body Lazik_Type is
      Aktualny_Ladunek : Ladunek;
      Koniec_Pracy     : Boolean := False;

      Stan : Stan_lazika;

      -- Zmienne dla baterii
      Poziom_Baterii   : Integer := 100;
      Kosz_Transportu  : constant Integer := 45; -- Ile % baterii zjada jeden kurs
      Prog_Ladowania   : constant Integer := 40; -- Kiedy szukac ladowarki

      -- Zmienne dla awarii
      subtype Szansa is Integer range 1 .. 100;
      package Losowanie_Awarii is new Ada.Numerics.Discrete_Random(Szansa);
      Generator        : Losowanie_Awarii.Generator;
      Wylosowana_Liczba: Integer;
      Szansa_na_zniszczenie : Integer := 15;

      -- czasy delay
      Czas_naprawy : constant Duration := 1.5;
      Czas_wywozu_gruzu : constant Duration := 0.8;
      Czas_skladowania_towaru : constant Duration := 1.2;


   begin
      Losowanie_Awarii.Reset(Generator); -- Inicjalizacja ziarna losowosci dla tego lazika

      Put_Line("[LAZIK " & Integer'Image(Id) & "] Gotowy do pracy. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
      Stan := Wolny;

      while not Koniec_Pracy loop

         -- SPRAWDZENIE BATERII PRZED KURSEM
         if Poziom_Baterii <= Prog_Ladowania then
            Put_Line("[LAZIK " & Integer'Image(Id) & "] UWAGA: Niski poziom baterii (" & Integer'Image(Poziom_Baterii) & " %). Jade do ladowarki.");
            Stan := Ladowany;
            Wyswietlacz.Podaj_stan(Id, Stan);
            Ladowarka.Podlacz_Baterie(Id); -- Jesli ladowarka jest zajeta, lazik tu zaczeka
            Poziom_Baterii := 100;
            Put_Line("[LAZIK " & Integer'Image(Id) & "] Wracam do pracy. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
            Stan := Wolny;
            Wyswietlacz.Podaj_stan(Id, Stan);
         end if;

         -- STANDARDOWA LOGIKA TRANSPORTU
         select
            accept Zakoncz;
            Koniec_Pracy := True;
         else
            null;
         end select;

         if not Koniec_Pracy then
            select
               Dok_Rozladunkowy.Pobierz_Dla_Lazika(Aktualny_Ladunek);

               -- LOSOWANIE AWARII
               Wylosowana_Liczba := Losowanie_Awarii.Random(Generator);
               if Wylosowana_Liczba <= Szansa_na_zniszczenie then
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] KRYTYCZNY BLAD SYSTEMU ZAWIESZENIA! Wzywam serwis...");
                  Stan := Naprawiany;
                  Wyswietlacz.Podaj_stan(Id, Stan);
                  delay Czas_naprawy; -- Zmniejszony symulowany czas naprawy
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Usterka usunieta. Wznawiam dzialanie.");
                  Stan := Wolny;
                  Wyswietlacz.Podaj_stan(Id, Stan);
               end if;

               if Aktualny_Ladunek.Rodzaj = Jakis_Marsjanski_Kamien then
                  Stan := Wyrzuca_Kamien;
                  Wyswietlacz.Podaj_stan(Id, Stan);
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Ladunek #" & Integer'Image(Aktualny_Ladunek.Id) &
                           ": Znowu marsjanski gruz. Wyrzucam za sluze...");
                  delay Czas_wywozu_gruzu;
                  Poziom_Baterii := Poziom_Baterii - (Kosz_Transportu / 2); -- Krotki kurs zjada mniej pradu
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
                  Stan := Wolny;
                  Wyswietlacz.Podaj_stan(Id, Stan);
               else
                  Stan := Jedzie_do_silosow;
                  Wyswietlacz.Podaj_stan(Id, Stan);
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Odebral " & Integer'Image(Aktualny_Ladunek.Ilosc) &
                           " kg surowca " & Surowiec'Image(Aktualny_Ladunek.Rodzaj) & ". Przejazd do Silosow...");
                  delay Czas_skladowania_towaru;

                  Silosy_Bazy.Przyjmij(Aktualny_Ladunek);
                  Poziom_Baterii := Poziom_Baterii - Kosz_Transportu; -- Zuzycie energii po pelnym kursie
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Towar dostarczony. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
                  Stan := Wolny;
                  Wyswietlacz.Podaj_stan(Id, Stan);
               end if;
            or
               delay 1.0;
            end select;
         end if;
      end loop;

      Put_Line("[LAZIK " & Integer'Image(Id) & "] Zjechal do hangaru. Misja zakonczona.");
   end Lazik_Type;

end Laziki_Pkg;
