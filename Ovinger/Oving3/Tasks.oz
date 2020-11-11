%Task 1. Creating a procedure to calculate Quadratic Equations:
proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
   D = B*B-4.0*A*C in
   if (D >= 0.0) then
      RealSol = true
      X1 = (~B + {Float.sqrt D}) / (2.0*A)
      X2 = (~B - {Float.sqrt D}) / (2.0*A)
   else
      RealSol = false
      X1 = nil
      X2 = nil
   end
end

%Task 2: Creating function to sum elements. Similar to length:
fun {Sum List}
   case List of Head | Tail then
      Head + {Sum Tail}
   else
      0
   end
end

%Task 3. Creating generalized function for Length and sum with folding:
fun{RightFold List Op U}             % Definition of the function
   case List of Head|Tail then       %Case of when the List is not empty. First element = Head, rest of the elements = Tail.
      {Op Head {RightFold Tail Op U}}/* The Op function takes two parameters.
                                        The List is traversed recursively, and Head is popped with every recursive call.
                                        If and when the list is empty, the Op function is called on the entire list from right to left starting from element U.

					In the case of our Sum-function. The Head is applied to the calculated sum at each step.
					In the case of our Length-function. The Head is ignored, and the value 1 is added at each step */										
 else                                 %If the list is empty
      U                               % The rightmost value
   end
end

%Using fold to find length:
fun{FoldLength List}
   {RightFold List fun {$ _ Y} 1 + Y end 0}
end
%Using fold to find Sum:
fun{FoldSum List}
   {RightFold List fun {$ X Y} X + Y end 0}
end

%Task 6. Need to implement recursive sum-fuction as mine was not:

fun {RecSum List}
   fun {Iterate List Sum}
      case List of Head|Tail then
	 {Iterate Tail Head + Sum}
      else
	 Sum
      end
   end
in
   {Iterate List 0}
end


