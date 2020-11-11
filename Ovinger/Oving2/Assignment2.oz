functor
import
   Application(exit: Exit)
   System
define
   \insert List.oz
   %ASSIGNMENT 2 TASK 1
   %Lenght:
   {System.showInfo "-------------TASK 1-------------------"}
   {System.showInfo "Length:"}
   {System.show {Length [1 2 3]}}
   %Take:
   {System.showInfo "Length:"}
   {System.show {Take [1 2 3] 2}}
   %Drop:
   {System.showInfo "Length:"}
   {System.show {Drop [1 2 3] 2}}
   %Append:
   {System.showInfo "Length:"}
   {System.show {Append [1 2] [3 4]}}
   %Member:
   {System.showInfo "Length:"}
   {System.show {Member [1 2 3 4] 4}}
   %Position:
   {System.showInfo "Length:"}
   {System.show {Position [12 3 4 85 95 2] 95}}

   %ASSIGNMENT 2 TASK 2:
   %2a. Lex:
   {System.showInfo ""}
   {System.showInfo "----------------Task 2------------------------------"}

   fun {Lex Input}
      {String.tokens Input & }
   end
   {System.showInfo "Task 2a, input: '1 2 + 3 *'"}
   {System.show {Lex "1 2 + 3 *"}}
   {System.showInfo ""}

   %2b. Tokenize:
   fun {Tokenize Lexemes}
      case Lexemes of Head | Tail then
	 case Head of "+" then
	    operator(type:plus)|{Tokenize Tail}
	 [] "-" then
	    operator(type:minus)|{Tokenize Tail}
	 [] "*" then
	    operator(type:multiply)|{Tokenize Tail}
	 [] "/" then
	    operator(type:divide)|{Tokenize Tail}
	 [] "p" then
	    command(print)|{Tokenize Tail}
	 [] "d" then
	    command(duplicate)|{Tokenize Tail}
	 [] "f" then
	    command(flip)|{Tokenize Tail}
	 [] "^" then
	    command(inverse)|{Tokenize Tail}
	 else
	    try
	       number({String.toInt Head})|{Tokenize Tail}
	    catch _then raise "invalid lexeme '"#Head#"'"end
	    end
	 end
      else
	 nil
      end
   end
   {System.showInfo "Task 2b, input: '1' '2' '+' '3' '*':"}
   {System.show {Tokenize ["1" "2" "+" "3" "*"]}}
   {System.showInfo ""}

   %2c,d,e,f,g Interpret:
   %Inspired by code given in lectures:
   fun {Interpret  Tokens}
      fun {Iterate Stack Tokens}
	 case Tokens of nil then
	    {List.reverse Stack}
	 [] number(Number) | Tokens then
	    {Iterate Number | Stack Tokens}
	 [] operator(type: Operation) | Tokens then
	    if Operation == minus then
	       Num1 | Num2 | Rest = Stack
	    in
	       {Iterate {Number.'-' Num1 Num2} | Rest Tokens}

	    elseif Operation == plus then
		  Num1 | Num2 | Rest = Stack
	    in
	       {Iterate {Number.'+' Num1 Num2} | Rest Tokens}

	    elseif Operation == multiply then
	       Num1 | Num2 | Rest = Stack
	    in
	       {Iterate {Number.'*' Num1 Num2} | Rest Tokens}

	    elseif Operation == divide then
	       Num1 | Num2 | Rest = Stack
	    in
	       {Iterate {Float.'/' {Int.toFloat Num1}{Int.toFloat Num2}} | Rest Tokens}
	    end
	    
	 [] command(Command) | Tokens then
	    if Command == print then
	       {System.show {List.reverse Stack}}
	       {Iterate Stack Tokens}

	    elseif Command == duplicate then
	       {Iterate Stack.1|Stack Tokens}
	       
	       %Flipping to a negative number if positive, and vice versa
	    elseif Command == flip then
	       case Stack of Head | Tail then
		  {Iterate ~Head|Tail Tokens}
	       end
	    elseif Command == inverse then
	       case Stack of Head | Tail then
		  {Iterate {Float.'/' 1.0 {Int.toFloat Head}}|Tail Tokens}
	       end
	    end
	 end
      end
   in
      try
	 {Iterate nil Tokens}
      catch _ then
	 raise "stack empty"
	 end
      end
   end
		  
   
   
   {System.showInfo "Task 2c Should output [1 5]:"} 
   {System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}}
   {System.showInfo ""}
   
   {System.showInfo "Task 2d should output [1 2 3] and then [1 5]:"}
   {System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
   {System.showInfo ""}
   
   {System.showInfo "Task 2e should output stopstack twice [1 5 5]:"}
   {System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
   {System.showInfo ""}
   
   {System.showInfo "Task 2f should output flipped topstack [1 -5]:"}
   {System.show {Interpret {Tokenize {Lex "1 2 3 + f"}}}}
   {System.showInfo ""}
   
   {System.showInfo "Task 2g should output invers of topstack [1 0.2] :"}
   {System.show {Interpret {Tokenize {Lex "1 2 3 + ^"}}}}

   {System.showInfo""}
   {System.showInfo "-----------TASK 3--------------------"}

  % \insert Infix.oz
	 
   {Exit 0}
end
