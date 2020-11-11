functor
import
   Application(exit:Exit)
   System
define
   proc {Max X Y Z}
      if X >= Y then
	 Z = X
      else
	 Z = Y
      end
   end
   X = {Max 10 89}
   {System.showInfo X}
   {Exit 0}
end
   