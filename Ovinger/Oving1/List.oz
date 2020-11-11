%Task 7a)
proc {Length L}
   I
in
   {List.length L ?I}
   {System.showInfo I}
end

  L = [1 2 3 4]
in
   {Length L}
   {Exit 0}
end

%Task 7b)
   fun {Take List Count}
      if Count >= {Length List} then
	 List
      elseif Count == 0 then
	 nil
      else
	 case List of Head | Tail then
	    Head | {Take Tail Count-1}
	 end
      end
   end

   List1 = [10 9 8 7 33 32 31 23 22 21]
   {System.show {Take List1 1}}
   {Exit 0}
end

%Task 7c)
fun {Drop List Count}
      if Count >0 then
	 case List of nil then nil
	 [] _|Xr then {Drop Xr Count-1}
	 end
      else
	 Count=0 List
      end
   end
   

   List1 = [10 9 8 7 33 32 31 23 22 21]
   {System.show {Drop List1 1}}
   {Exit 0}
end

%Task 7d)
   fun {Append L1 L2}
      if L1 == nil then L2
      else L1.1 | {Append L1.2 L2}
      end
   end
in
   {System.show {Append [1 2] [3 4]}}
   {Exit 0}
end

%Task 7e
   fun {Member List Element}
      case Element of nil then false
      [] X|Xr then List=X orelse {Member List Xr}
      end
   end
end

%Task 7f)
fun {Position List Element}
      case List of Head | Tail then
	 if Head == Element then
	    0
	 else
	    1 + {Position Tail Element}
	 end
      else
	 {System.showInfo 'Error'}
      end
   end
   