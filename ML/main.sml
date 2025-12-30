datatype token = TokNum of int | TokPlus | TokMinus | TokMul | TokDiv | TokLPar | TokRPar

fun tokenize [] = []
  | tokenize (c::cs) =
    if Char.isSpace c then tokenize cs  
    else if Char.isDigit c then
        let 
            (* Сбор последовательности цифр в одно число *)
            fun readInt (acc, []) = (acc, [])
              | readInt (acc, x::xs) =
                if Char.isDigit x then readInt (acc ^ str x, xs)
                else (acc, x::xs)
            val (numStr, rest) = readInt (str c, cs)
        in
            TokNum (valOf (Int.fromString numStr)) :: tokenize rest
        end
    else
        
        case c of
             #"+" => TokPlus  :: tokenize cs
           | #"-" => TokMinus :: tokenize cs
           | #"*" => TokMul   :: tokenize cs
           | #"/" => TokDiv   :: tokenize cs
           | #"(" => TokLPar  :: tokenize cs
           | #")" => TokRPar  :: tokenize cs
           | _ => raise Fail ("Unknown character: " ^ str c)

fun run input = tokenize (String.explode input)

val testInput = "(12 + 5) * 3";
val result = run testInput;
(*use "main.sml";*)