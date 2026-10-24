package monitor_pkg is
   
   type Stan_lazika is (Wolny, Ladowany, Naprawiany, Jedzie_do_silosow, Wyrzuca_Kamien);
   
   type Tablica_stanow is array (1 .. 3) of Stan_lazika; -- bo 3 laziki mamy

   task Wyswietlacz is
      
      entry Podaj_stan(ID_lazika : Integer; Stan : Stan_lazika);
      entry Zakoncz;
      
   end Wyswietlacz;
  

end monitor_pkg;
