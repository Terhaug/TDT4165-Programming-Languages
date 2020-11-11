functor
import
   Application(exit:Exit)
   System
define
   local
      Pi Area Diameter Circumference
      
      proc{Circle R}
	 Pi = 355.0/113.0
	 Area = R * R * Pi
	 Diameter = R * 2.0
	 Circumference = Pi * Diameter
	 {System.showInfo Area}
	 {System.showInfo Diameter}
	 {System.showInfo Circumference}
      end
   in
      {Circle 2.0}
      {Exit 0}
   end
end