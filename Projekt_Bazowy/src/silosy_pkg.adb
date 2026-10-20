with Ada.Text_IO; use Ada.Text_IO;

package body Silosy_Pkg is

   task body Silosy_Bazy is
      -- Stan wewnetrzny magazynu
      Stan        : Stan_Silosow := (others => 0);
      Laczna_Masa : Integer := 0;
      Dziala      : Boolean := True;
   begin
      while Dziala loop
         select
            -- Otwieramy sluze tylko gdy jest jeszcze wolne miejsce w bazie
            when Laczna_Masa < Limit_Magazynu =>
               accept Przyjmij(L : Ladunek) do
                  Stan(L.Rodzaj) := Stan(L.Rodzaj) + L.Ilosc;
                  Laczna_Masa    := Laczna_Masa + L.Ilosc;
                  Put_Line("[SILOSY] Zmagazynowano " & Integer'Image(L.Ilosc) &
                           " kg surowca " & Surowiec'Image(L.Rodzaj) &
                           " (Lacznie w silosach: " & Integer'Image(Laczna_Masa) & "/" &
                           Integer'Image(Limit_Magazynu) & " kg)");
               end Przyjmij;
         or
            -- Wypluwa aktualny stan silosow
            accept Sprawdz_Stan(Kopia : out Stan_Silosow; Suma : out Integer) do
               Kopia := Stan;
               Suma  := Laczna_Masa;
            end Sprawdz_Stan;
         or
            -- Zakonczenie dzialania
            accept Zakoncz;
            Dziala := False;
         end select;
      end loop;

      Put_Line("[SILOSY] Silosy bazy zostaly bezpiecznie zabezpieczone i zamkniete.");
   end Silosy_Bazy;

end Silosy_Pkg;
