% Generates a stream of Odd nums in a given interval 
fun {GenerateOdd N E}
    if N =< E then
        if (N mod 2) \= 0 then
            N|{GenerateOdd N+1 E}
        else
            {GenerateOdd N+1 E}
        end
    else
       nil
    end
end

% Multiplicates all elements in the list L:
fun {Product L}
   case L of Head | Tail then
      Head * {Product Tail}
   else
      1
   end
end

%Task 4:
%ReWriting generateOdd-function from task 1 using lazy annotation:

fun lazy {GenerateOddLazy N E}
    if N =< E then
        if (N mod 2) \= 0 then
            N|{GenerateOdd N+1 E}
        else
            {GenerateOdd N+1 E}
        end
    else
       nil
    end
end

%Task 5:
%a
fun lazy {HammerFactory}
   %Create working hammer in 90%of cases, 10% of other cases:
   {Delay 1000} %Tip from piazza
   if {RandomInt 1 100} < 90 then
      working|{HammerFactory}
   else
      defect|{HammerFactory}
   end
end

%b
fun {HammerConsumer HammerStream N}
   if N > 0 then
      case HammerStream of working | Tail then
	 1 + {HammerConsumer Tail N-1}
      [] defect | Tail then
	 {HammerConsumer Tail N-1}
      end
   else
      0
   end
end

%c)
/*
Unable to get this code to work. I will give abit of theory in the pdf.delivery regarding this task....
   
fun {BoundedBuffer HammerStream N}
   Last = thread {List.drop HammerStream N} end
   fun lazy {Next HammerStream Last}
      case HammerStream of Head | Tail then
	 Head | {Next Tail Last}
      end
   end
end
*/

   
	 

%Function from assignment(Helper-function)
fun {RandomInt Min Max}
   X = {OS.rand}
   MinOS
   MaxOS
in
   {OS.randLimits ?MinOS ?MaxOS}
   Min + X*(Max - Min) div (MaxOS - MinOS)
end


   
