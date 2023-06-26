open List
open Lib.IR
open Lib.Pretty_printing_katamaran

(******************************************************************************)
(* Intermediate Representation Example 1 *)

let fun_is_empty = Stm_match_list {
  s        = Stm_exp (Exp_var "l");
  alt_nil  = Stm_val (Val_bool true);
  xh       = "h";
  xt       = "t";
  alt_cons = Stm_val (Val_bool false)
}

(*
let fun_empty = Stm_exp (Exp_val (Val_list []))
*)

let testFunDefList = [
  { name = "is_empty";
    funType = {
      arg_types = [ ("l", List Int) ];
      ret_type = Bool
    };
    funBody = fun_is_empty
  };
  
  (*
  { name = "empty";
    funType = {
      arg_types = [ ("tt", Unit)];
      ret_type = List Int
    };
    funBody = fun_empty
  };
  *)

  { name = "very_long_naaaaaaaaaaaaaaaaame";
    funType = {
      arg_types = [ ("l", List Int); ("b", Bool); ("n", Int) ];
      ret_type = List (List (List Bool))
    };
    funBody = Stm_val (
      Val_list [
        Val_list [
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true]
        ];
        Val_list [
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true]
        ];
        Val_list [
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true];
          Val_list [Val_bool true; Val_bool true; Val_bool true]
        ]
      ]
    )
  }
  
]


let ir_1 = { 
  program_name = "Lists";
  funDefList = testFunDefList
}

(******************************************************************************)
(* Main *)

let () = pretty_print 60 Out_channel.stdout (fromIR_pp ir_1)