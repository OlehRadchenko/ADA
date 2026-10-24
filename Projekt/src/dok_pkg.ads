with Mars_Typy; use Mars_Typy;

package Dok_Pkg is

   task Dok_Rozladunkowy is
      -- Przyjecie zgloszenia od promu kosmicznego
      entry Zglos_Dostawe(L : Ladunek);

      -- Przekazanie wyladowanej partii lazikowi transportowemu
      entry Pobierz_Dla_Lazika(L : out Ladunek);

      -- Zakonczenie pracy doku
      entry Zakoncz;
   end Dok_Rozladunkowy;

   task type Prom_Type(Id : Integer);

end Dok_Pkg;
