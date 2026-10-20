with Ada.Text_IO; use Ada.Text_IO;
with Mars_Typy;   use Mars_Typy;
with Silosy_Pkg;  use Silosy_Pkg;
with Dok_Pkg;     use Dok_Pkg;
with Laziki_Pkg;  use Laziki_Pkg;

procedure Main is

   -- Laziki
   Lazik_1 : Lazik_Type(1);
   Lazik_2 : Lazik_Type(2);

   -- Promy kosmiczne z dostawami
   Prom_1 : Prom_Type(101);
   Prom_2 : Prom_Type(102);
   Prom_3 : Prom_Type(103);
   Prom_4 : Prom_Type(104);

   Stan_Koncowy : Stan_Silosow;
   Laczna_Suma  : Integer;

begin
   Put_Line("==================================================================");
   Put_Line("       ARES BASE LOGISTICS - SYMULACJA 3 MODULOW BAZOWYCH        ");
   Put_Line("==================================================================");

   delay 12.0;

   Put_Line("");
   Put_Line("=== KONTROLA MISJI: ROZPOCZYNAMY PROCEDURY ZAMYKANIA BAZY ===");

   -- Zatrzymanie robotow transportowych:
   Lazik_1.Zakoncz;
   Lazik_2.Zakoncz;

   -- Zatrzymanie stanowiska rozladunkowego:
   Dok_Rozladunkowy.Zakoncz;

   -- Odpytanie magazynu o stan koncowy przed zamknieciem:
   Silosy_Bazy.Sprawdz_Stan(Stan_Koncowy, Laczna_Suma);

   Put_Line("");
   Put_Line("---------------- [ RAPORT KONCOWY SILOSOW BAZY ] ----------------");
   Put_Line(" Tytan                  : " & Integer'Image(Stan_Koncowy(Tytan)) & " kg");
   Put_Line(" Uran                   : " & Integer'Image(Stan_Koncowy(Uran)) & " kg");
   Put_Line(" Lod                    : " & Integer'Image(Stan_Koncowy(Lod)) & " kg");
   Put_Line(" Bezuzyteczny kamien    : " & Integer'Image(Stan_Koncowy(Jakis_Marsjanski_Kamien)) & " kg");
   Put_Line(" Laczna zmagazynowana   : " & Integer'Image(Laczna_Suma) & " / " &
            Integer'Image(Limit_Magazynu) & " kg");
   Put_Line("-----------------------------------------------------------------");
   Put_Line("");

   -- Zamkniecie silosow bazy:
   Silosy_Bazy.Zakoncz;

   Put_Line("=== KONTROLA MISJI: BAZA BEZPIECZNIE ZABEZPIECZONA NA NOC ===");

end Main;
