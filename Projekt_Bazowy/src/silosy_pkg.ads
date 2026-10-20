with Mars_Typy; use Mars_Typy;

package Silosy_Pkg is

   task Silosy_Bazy is
      -- Przyjecie surowcow
      entry Przyjmij(L : Ladunek);

      -- Sprawdzenie stanu
      entry Sprawdz_Stan(Kopia : out Stan_Silosow; Suma : out Integer);

      entry Zakoncz;
   end Silosy_Bazy;

end Silosy_Pkg;
