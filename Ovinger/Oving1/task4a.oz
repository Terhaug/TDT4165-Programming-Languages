functor
import
   Application(exit:Exit)
   System
define
   fun {Max X Y}
      if X > Y then
	 X
      else
	 Y
      end
   end
   {System.showInfo {Max 10 89}}
   {Exit 0}
end
   