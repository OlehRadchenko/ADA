with Mars_Typy; use Mars_Typy;

package Silosy_Pkg is

   task Silosy_Bazy is
      entry Przyjmij(L : Ladunek);
      entry Sprawdz_Stan(Kopia : out Stan_Silosow; Suma : out Integer);
      entry Zakoncz;
   end Silosy_Bazy;

end Silosy_Pkg;
