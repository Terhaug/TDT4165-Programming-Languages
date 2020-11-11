/* Thoughts:
Needs to return a function that can calculate AX^2 + BX +C
= (A*X*X) + (B*X) + C
*/

fun {Quadratic A B C}
   fun{$ X}
      (A*X*X) + (B*X) + C
   end
end
