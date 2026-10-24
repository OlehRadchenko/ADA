with Silosy_Pkg; use Silosy_Pkg;
with Ada.Text_IO; use Ada.Text_IO;
with Mars_Typy; use Mars_Typy;

package body monitor_pkg is

   task body Wyswietlacz is
      Dane_stanow : Tablica_stanow := (others => Wolny);
      
      Stan_magazynu : Stan_Silosow;
      Suma : Integer;
      Licznik_dostaw : Integer := 0;
      Czy_byla_zmiana : Boolean := True;
      Czas_Renderowania : constant Duration := 2.0; --co ile sie wyswietla komunikat
      
   begin
      loop
         select
            accept Podaj_stan(ID_lazika : Integer; Stan : Stan_lazika) do   --- zapisywanie stanow poszczegolnych lazikow
               Dane_stanow(ID_lazika) := Stan;
               Czy_byla_zmiana := True;
               
               if Stan = Jedzie_do_silosow then 
                  Licznik_dostaw := Licznik_dostaw +1;
               end if;
               
            end Podaj_stan;
            
         or
              
            accept Zakoncz;
            exit;
            
         or
              ---Wypisanie stanu co [Czas_Renderowania] sek
            delay Czas_Renderowania;
            if Czy_byla_zmiana then
               
            Czy_byla_zmiana := False;
            Put_Line("");
            Put_Line("---[Centrum Monitoringu]---");
            Put_Line("");
            
            for I in 1 .. 3 loop  -- wypisanie stanow poszczegolnych lazikow
               Put_Line("Lazik " & Integer'Image(I) & " : " & Stan_lazika'Image(Dane_stanow(I)) );
               
            end loop;
            
            Put_Line("");
            Put_Line("Ilosc dostarczen do silosu : " & Integer'Image(Licznik_dostaw) );
            Put_Line("");

            
            Silosy_Bazy.Sprawdz_Stan(Stan_magazynu, Suma);

   Put_Line("");
   Put_Line("--------- Stan Silosow ---------");
   Put_Line(" Tytan                  : " & Integer'Image(Stan_magazynu(Tytan)) & " kg");
   Put_Line(" Uran                   : " & Integer'Image(Stan_magazynu(Uran)) & " kg");
   Put_Line(" Lod                    : " & Integer'Image(Stan_magazynu(Lod)) & " kg");
   Put_Line(" Bezuzyteczny kamien    :  Nie marnujemy na niego miejsca w silosie!");
   Put_Line(" Lacznie zmagazynowano  : " & Integer'Image(Suma) & " / " &
            Integer'Image(Limit_Magazynu) & " kg");
   Put_Line("-----------------------------------------");
   Put_Line("");
               
               end if;     
         end select;
      end loop;
   end Wyswietlacz;
end monitor_pkg;
