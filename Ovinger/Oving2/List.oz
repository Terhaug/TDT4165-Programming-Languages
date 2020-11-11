%Length:
fun {Length List}
   case List of Head | Tail then
      1 + {Length Tail}
   else
      0
   end
end

%Take:
fun {Take List Count}
   if Count >= {Length List} then List
   elseif Count == 0 then
      nil
   else
      case List of Head | Tail then
	 Head | {Take Tail Count-1}
      end
   end
end

%Drop
fun {Drop List Count}
   if Count >0 then
      case List of nil then nil
      [] _|Xr then {Drop Xr Count-1}
      end
   else
      Count=0 List
   end
end

%Append
fun {Append L1 L2}
   if L1 == nil then L2
   else L1.1 | {Append L1.2 L2}
   end
end

%Member
fun {Member List Element}
   case List of Head | Tail then
      if Head == Element then
         true
      else
         {Member Tail Element}
      end
   else
      false
   end
end

%Position
fun {Position List Element}
   case List of Head | Tail then
      if Head == Element then
	 0
      else
	 1 + {Position Tail Element}
      end
   end
end
