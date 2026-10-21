with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random; -- Biblioteka do losowania awarii
with Mars_Typy;   use Mars_Typy;
with Dok_Pkg;     use Dok_Pkg;
with Silosy_Pkg;  use Silosy_Pkg;

package body Laziki_Pkg is

   task Ladowarka is
      entry Podlacz_Baterie(Id : Integer);
   end Ladowarka;

   task body Ladowarka is
   begin
      loop
         select
            -- Akceptuje tylko jednego łazika na raz. Inne automatycznie czekają w kolejce.
            accept Podlacz_Baterie(Id : Integer) do
               Put_Line("[LADOWARKA] Podlaczono LAZIK " & Integer'Image(Id) & ". Rozpoczynam ladowanie...");
               delay 3.0; -- Symulacja czasu ładowania
            end Podlacz_Baterie;

            Put_Line("[LADOWARKA] Proces zakonczony. Stanowisko wolne.");
         or
            terminate; -- Ładowarka wyłączy się sama, gdy skończy się program (main)
         end select;
      end loop;
   end Ladowarka;

   task body Lazik_Type is
      Aktualny_Ladunek : Ladunek;
      Koniec_Pracy     : Boolean := False;

      -- Zmienne dla Modułu E (Bateria)
      Poziom_Baterii   : Integer := 100;
      Kosz_Transportu  : constant Integer := 45; -- Ile % baterii zjada jeden kurs
      Prog_Ladowania   : constant Integer := 40; -- Kiedy szukać ładowarki

      -- Zmienne dla Modułu D (Awarie)
      subtype Szansa is Integer range 1 .. 100;
      package Losowanie_Awarii is new Ada.Numerics.Discrete_Random(Szansa);
      Generator        : Losowanie_Awarii.Generator;
      Wylosowana_Liczba: Integer;
   begin
      Losowanie_Awarii.Reset(Generator); -- Inicjalizacja ziarna losowości dla tego łazika

      Put_Line("[LAZIK " & Integer'Image(Id) & "] Gotowy do pracy. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");

      while not Koniec_Pracy loop

         -- SPRAWDZENIE BATERII PRZED KURSEM (Moduł E)
         if Poziom_Baterii <= Prog_Ladowania then
            Put_Line("[LAZIK " & Integer'Image(Id) & "] UWAGA: Niski poziom baterii (" & Integer'Image(Poziom_Baterii) & " %). Jade do ladowarki.");
            Ladowarka.Podlacz_Baterie(Id); -- Jeśli ładowarka jest zajęta, łazik tu zaczeka
            Poziom_Baterii := 100;
            Put_Line("[LAZIK " & Integer'Image(Id) & "] Wracam do pracy. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
         end if;

         -- STANDARDOWA LOGIKA TRANSPORTU
         select
            accept Zakoncz;
            Koniec_Pracy := True;
         else
            null;
         end select;

         if not Koniec_Pracy then
            select
               Dok_Rozladunkowy.Pobierz_Dla_Lazika(Aktualny_Ladunek);

               -- LOSOWANIE AWARII (Moduł D)
               Wylosowana_Liczba := Losowanie_Awarii.Random(Generator);
               if Wylosowana_Liczba <= 15 then
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] KRYTYCZNY BLAD SYSTEMU ZAWIESZENIA! Wzywam serwis...");
                  delay 1.5; -- Zmniejszony symulowany czas naprawy
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Usterka usunieta. Wznawiam dzialanie.");
               end if;

               if Aktualny_Ladunek.Rodzaj = Jakis_Marsjanski_Kamien then
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Ladunek #" & Integer'Image(Aktualny_Ladunek.Id) &
                           ": Znowu marsjanski gruz. Wyrzucam za sluze...");
                  delay 0.8;
                  Poziom_Baterii := Poziom_Baterii - (Kosz_Transportu / 2); -- Krótki kurs zjada mniej prądu
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
               else
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Odebral " & Integer'Image(Aktualny_Ladunek.Ilosc) &
                           " kg surowca " & Surowiec'Image(Aktualny_Ladunek.Rodzaj) & ". Przejazd do Silosow...");
                  delay 1.2;

                  Silosy_Bazy.Przyjmij(Aktualny_Ladunek);
                  Poziom_Baterii := Poziom_Baterii - Kosz_Transportu; -- Zużycie energii po pełnym kursie
                  Put_Line("[LAZIK " & Integer'Image(Id) & "] Towar dostarczony. Stan baterii: " & Integer'Image(Poziom_Baterii) & " %.");
               end if;
            or
               delay 1.0;
            end select;
         end if;
      end loop;

      Put_Line("[LAZIK " & Integer'Image(Id) & "] Zjechal do hangaru. Misja zakonczona.");
   end Lazik_Type;

end Laziki_Pkg;
