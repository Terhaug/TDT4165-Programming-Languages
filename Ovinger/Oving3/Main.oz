functor
import
   Application(exit:Exit)
   System
define
   \insert Tasks.oz
   \insert Task4.oz
   %\insert Task5.oz

   {System.showInfo "\n -------------------Task 1----------------------"}
   local
      RS1 X11 X21 RS2 X12 X22
   in
      {System.printInfo "A = 2, B = 1 and C = -1:\n"}
      {QuadraticEquation 2.0 1.0 ~1.0 RS1 X11 X21}
      {System.printInfo "real solution?: "}{System.show RS1}
      {System.printInfo "X1: "}{System.show X11}
      {System.printInfo "X2: "}{System.show X21}

      {System.showInfo "---------------"}
      {System.printInfo "A = 2, B = 1 and C = 2:\n"}
      {QuadraticEquation 2.0 1.0 2.0 RS2 X12 X22}
      {System.printInfo "real solution?: "}{System.show RS2}
      {System.printInfo "X1: "}{System.show X12}
      {System.printInfo "X2: "}{System.show X22}
   end
   {System.showInfo"*********************************************"}
   {System.showInfo"\n -----------------Task 2-----------------------"}
   {System.printInfo "Sum[1 2 3 4 5 6 7 8 9 10]: should be 55:\n"}
   {System.show {Sum[1 2 3 4 5 6 7 8 9 10]}}

   {System.showInfo"*********************************************"}
   {System.showInfo"\n -----------------Task 3-----------------------"}
   {System.printInfo "FoldLength[1 2 3 4 5 6 7 8 9 10]: should be 10:\n"}
   {System.show {FoldLength [1 2 3 4 5 6 7 8 9 10]}}
   {System.showInfo"----------------"}
   {System.printInfo "FoldSum[1 2 3 4 5 6 7 8 9 10]: should be 55\n"}
   {System.show {FoldSum [1 2 3 4 5 6 7 8 9 10]}}

   {System.showInfo"*********************************************"}
   {System.showInfo"\n -----------------Task 4-----------------------"}
   {System.printInfo "{{Quadratic 3 2 1} 2} should output 17:\n"}
   {System.show {{Quadratic 3 2 1} 2}}

   {System.showInfo"*********************************************"}
   {System.showInfo"\n -----------------Task 5-----------------------"}
   {System.printInfo"{LazyNumberGenerator 0}.1 should return 0:\n"}
   %{System.show {LazyNumberGenerator 0}.1}

   {System.showInfo"*********************************************"}
   {System.showInfo"\n -----------------Task 6-----------------------"}
   {System.printInfo "RecSum [1 2 3 4 5 6 7 8 9 10]: should be 55\n"}
   {System.show {RecSum [1 2 3 4 5 6 7 8 9 10]}}
   
   {Exit 0}
end
