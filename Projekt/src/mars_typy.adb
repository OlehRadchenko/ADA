package body Mars_Typy is

   function Konwertuj_Na_Surowiec(Kod : Integer) return Surowiec is
   begin
      case Kod is
         when 1 => return Tytan;
         when 2 => return Uran;
         when 3 => return Lod;
         when others => return Jakis_Marsjanski_Kamien;
      end case;
   end Konwertuj_Na_Surowiec;

end Mars_Typy;
