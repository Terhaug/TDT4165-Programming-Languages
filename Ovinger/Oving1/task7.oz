functor
import
   Application(exit:Exit)
   System
define
   \insert List.oz
   %7a)
   {System.show{Length [1 2 3]}}
   %7b)
   {System.show{Take [9 8 7 6 5 34 35 36 27 26 25] 8}}
   %7c)
   {System.show{Drop [9 8 7 6 5 34 35 36 27 26 25] 8}}
   %7d)
   {System.show{Append [1 2] [3 4]}}
   %7e)
   {System.show{Member [1 2 3] 2}}
   %7f)
   {System.show{Position [9 8 7 6 5 34 35 36 27 26 25} 34}}

   {Exit 0}
end
