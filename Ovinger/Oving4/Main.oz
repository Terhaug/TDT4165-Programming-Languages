functor
import
   Application(exit:Exit)
   System
   OS
   %Browse(browse:Browse)

define
   \insert StreamAndThread.oz
   {System.showInfo "--------------Task1------------------"}
   {System.printInfo "Should print:[-3 -1 1 3 5 9]\n"}
   {System.show {GenerateOdd ~3 10}}
   {System.printInfo "Should print:[3] \n"}
   {System.show {GenerateOdd 3 3}}
   {System.printInfo "Should print: nil \n"}
   {System.show {GenerateOdd 2 2}}

   {System.showInfo""}
   {System.showInfo "--------------Task2------------------"}
   {System.printInfo "{Product [1 2 3 4]}, should print 24 \n"}
   {System.show {Product [1 2 3 4]}}

   
   {System.showInfo""}
   {System.showInfo "--------------Task3------------------"}
   %1 thread to generate a stream of numbers
   %Another thread for computation (mulitplication
   local OddNums in
      thread OddNums = {GenerateOdd 0 1000} end
      {System.printInfo "Multiplication of stream of odds:\n"}
      thread {System.show {Product OddNums}} end
   end
   
/*
   {System.showInfo""}
   {System.showInfo "--------------Task4------------------"}

   local LazyOdds in
      thread LazyOdds = {GenerateOddLazy 0 1000} end
      {System.printInfo "Multiplication of stream of odds:\n"}
      thread {System.show {Product LazyOdds}} end
   end
*/
   
   {System.showInfo""}
   {System.showInfo "--------------Task5 a------------------"}
   {System.showInfo "Hammers produced after 4 second delay (Either working or defect): \n"}
   local HammerTime B in
      HammerTime = {HammerFactory}
      B = HammerTime.2.2.2.1
      {System.show HammerTime}
   end

   {System.showInfo""}
   {System.showInfo "--------------Task5 b------------------"}
   {System.showInfo "After 10s; finds amount of working hammers of the stream produced: \n"}

   local HammerTime Consumer in
      HammerTime = {HammerFactory}
      Consumer = {HammerConsumer HammerTime 10}
      {System.show Consumer}
   end
   {Exit 0}
end
