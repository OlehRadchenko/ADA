with Ada.Text_IO; use Ada.Text_IO;
with Mars_Typy;   use Mars_Typy;
with Dok_Pkg;     use Dok_Pkg;
with Silosy_Pkg;  use Silosy_Pkg;

package body Laziki_Pkg is

   task body Lazik_Type is
      Aktualny_Ladunek : Ladunek;
      Koniec_Pracy     : Boolean := False;
   begin
      Put_Line("[LAZIK " & Integer'Image(Id) & "] Gotowy do pracy, oczekuje na zadania transportowe.");

      while not Koniec_Pracy loop
         -- Sprawdzenie czy zarzadzono zakonczenie pracy
         select
            accept Zakoncz;
            Koniec_Pracy := True;
         else
            null;
         end select;

         if not Koniec_Pracy then
            -- Oczekiwanie na przydzial ladunku z Doku
            select
               Dok_Rozladunkowy.Pobierz_Dla_Lazika(Aktualny_Ladunek);

               -- Rozpoznanie surowca i reakcja na bezuzyteczny kamien
               if Aktualny_Ladunek.Rodzaj = Jakis_Marsjanski_Kamien then
                  Put_Line("[LAZIK " & Integer'Image(Id) &
                           "] Odebral ladunek #" & Integer'Image(Aktualny_Ladunek.Id) &
                           ": Znowu bezuzyteczny marsjanski kamien! Wyrzucam za sluze na pustynie...");
                  delay 0.8;
               else
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Odebral " &
                           Integer'Image(Aktualny_Ladunek.Ilosc) & " kg surowca " &
                           Surowiec'Image(Aktualny_Ladunek.Rodzaj) & ". Rozpoczynam przejazd do Silosow...");

                  delay 1.2;

                  -- Przekazanie surowcu na magazyn
                  Silosy_Bazy.Przyjmij(Aktualny_Ladunek);
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Rozladowany pomyslnie. Ponownie oczekuje na prace.");
               end if;
            or
               delay 1.0; -- Brak wolnego towaru w doku, sprawdzamy ponownie
            end select;
         end if;
      end loop;

      Put_Line("[LAZIK " & Integer'Image(Id) & "] Zjechal do hangaru. Misja zakonczona.");
   end Lazik_Type;

end Laziki_Pkg;
