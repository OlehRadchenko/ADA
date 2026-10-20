with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
   type Surowiec is (Tytan, Uran, Lod, Jakis_Marsjanski_Kamien);
   S : Surowiec := Tytan;
   S2 : Surowiec := Jakis_Marsjanski_Kamien;
   type Ladunek is record
      Id: Integer;
      Rodzaj: Surowiec;
      Ilosc: Integer;
   end record;
   L1 : Ladunek := (Id => 1, Rodzaj => Uran, Ilosc => 20);
   L2 : Ladunek;
   type StanSilosow is array (Surowiec) of Integer;

   task Silosy_Bazy is
      entry Przyjmij(Co: Surowiec; Ile: Integer);
      entry Sprawdz_Stan(Co: Surowiec; Ile_Jest: out Integer);
      entry Zakoncz;
   end Silosy_Bazy;
   task body Silosy_Bazy is
      Stan: StanSilosow := (others => 0);
      Laczna_Waga : Integer := 0;
   begin
      loop
         select
            when Laczna_Waga < 100 =>
               accept Przyjmij(Co:Surowiec; Ile: Integer) do
                  Stan(Co) := Stan(Co) + Ile;
                  Laczna_Waga := Laczna_Waga + Ile;
                  Put_Line("[SILOSY] Przyjeto " & Integer'Image(Ile) & " kg surowca: " & Surowiec'Image(Co));
               end Przyjmij;
         or
            accept Sprawdz_Stan(Co: Surowiec; Ile_Jest: out Integer) do
               Ile_Jest := Stan(Co);
            end Sprawdz_Stan;
         or
            accept Zakoncz;
            exit;
         end select;
      end loop;
      for S in Surowiec loop
         Put_Line("Silos z " & Surowiec'Image(S) & " ma " & Integer'Image(Stan(S)) & " kg.");
      end loop;
   end Silosy_Bazy;

   task type Lazik_Type(Id: Integer; Pojemnosc: Integer; Bateria: Integer);
   task body Lazik_Type is
      Ile_Surowcu : Integer;
      Aktualna_Bateria : Integer := Bateria;
   begin
      Put_Line("[Lazik " & Integer'Image(Id) & "] zostal uruchomiony.");
      for I in 1 .. 3 loop
         Put_Line("[Lazik " & Integer'Image(Id) & "] patroluje getto marsjanskie XD");
         if Pojemnosc <= 20 then
            Aktualna_Bateria := Aktualna_Bateria - 5;
         else
            Aktualna_Bateria := Aktualna_Bateria - 10;
         end if;
         Put_Line("[Lazik " & Integer'Image(Id) & "] Stan baterii:" & Integer'Image(Aktualna_Bateria) & "%");
         delay 1.0;
      end loop;
      if Id = 1 then
         Ile_Surowcu := 119;
      elsif Id = 2 then
         Ile_Surowcu := 140;
      end if;
      select
         Silosy_Bazy.Przyjmij(Uran, Ile_Surowcu);
         Put_Line("[Lazik " & Integer'Image(Id) & "] Rozladowany, wracam do bazy!");
      or
         delay 2.0;
         Put_Line("[Lazik " & Integer'Image(Id) & "] nie moze dluzej czekac, jedzie dalej po resursy!");
      end select;

   end Lazik_Type;
   Lazik1 : Lazik_Type(1, 20, 100);
   Lazik2 : Lazik_Type(2, 30, 80);
   Zapas_Uranu : Integer := 0;


begin
   Put_Line("=== KONTROLA LOTOW: Start misji na Marsie ===");
   L2.Id := 2;
   L2.Rodzaj := Lod;
   L2.Ilosc := 3;
   Put_Line("=== KONTROLA LOTOW: Procedura glowna oczekuje na powrot jednostek ===");
   delay 5.0;
   Silosy_Bazy.Sprawdz_Stan(Uran, Zapas_Uranu);
   Put_Line("[KONTROLA LOTOW] Sprawdzono stan Uranu w bazie: " & Integer'Image(Zapas_Uranu) & " kg.");
   Silosy_Bazy.Zakoncz;
end Main;
