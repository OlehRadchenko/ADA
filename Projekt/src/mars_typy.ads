package Mars_Typy is

   -- Rodzaje surowcow wystepujace w kolonii marsjanskiej
   type Surowiec is (Tytan, Uran, Lod, Jakis_Marsjanski_Kamien);

   -- Struktura pojedynczego ladunku / kontenera przywozonego przez promy
   type Ladunek is record
      Id     : Integer;
      Rodzaj : Surowiec;
      Ilosc  : Integer;
   end record;

   -- Tablica indeksowana surowcami przechowujaca aktualne zapasy
   type Stan_Silosow is array (Surowiec) of Integer;

   -- Maksymalna laczna pojemnosc magazynu bazy
   Limit_Magazynu : constant Integer := 200;

   -- Funkcja pomocnicza zamieniajaca wylosowana liczbe 1..4 na surowiec
   function Konwertuj_Na_Surowiec(Kod : Integer) return Surowiec;

end Mars_Typy;
