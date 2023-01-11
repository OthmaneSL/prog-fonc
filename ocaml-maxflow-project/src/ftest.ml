open Gfile
open Tools
open FonctionFF

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)

  (*test de construire res*************************************)
  (*let graph = from_file infile in
  let graph = gmap graph int_of_string in 
  let graph = int_to_flot graph in 
  let graph = construire_res graph in 
  let graph = gmap graph string_of_int in
  let () = export outfile graph in
  ()*)
(************************************************************)

(*********   test de flot update ****************************)
  (*let graph = from_file infile in
  let graph = gmap graph int_of_string in 
  let graph = int_to_flot graph in 
  let graph = flot_update [(0,1)] 2 in 
  let graph = flot_to_string graph in 
  let () = export outfile graph in
  ()*)
  (**********************************************************)

(***********    test de trouver chemin *********************)
  (*let graph = from_file infile in
  let graph = gmap graph int_of_string in 
  let l = trouver_chemin graph 0 5 in 
  let l = transformationliste l in 
  let l= Option.get l in 
  let ()= List.iter (fun (a,b) -> Printf.printf "(%i, %i); " a b ) l in
  let () = write_file outfile graph in
  ()*)
(************************************************************) 
 
(****************    test de run ***************************)


  (*let graph = from_file infile in
  let graph = gmap graph int_of_string in 
  let graph = run graph _source _sink in 
  let graph = flot_to_string graph in 
  let () = export outfile graph in
  ()*)

(***********************************************************)
  