{
  open Absyn
}

let keywords = ["let", "in", "end"]

rule tokenize = parse
  | [' ' '\t' '\n']  -> tokenize
  | "let"            -> LET
  | "in"             -> IN
  | "end"            -> END
  | ['a'-'z' 'A'-'Z' '_']+ -> IDENT (text)
  | ['0'-'9']+       -> NUM (int_of_string text)
  | '+'              -> PLUS
  | '*'              -> STAR
  | _                -> failwith "Unknown character"
