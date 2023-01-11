open Graph 
open Tools 

type chemin= (id*id)list

type flot={
  actuel:int;
  capacite:int;
} 

type 'a reseau_flot = {
  gr: 'a graph;
  source : id;(*id ou int *)
  puit : id;
} 

(* Permet de transformer un graph int en graph de flot *)
let int_to_flot gr = gmap gr (fun c-> {actuel=0; capacite=c})

(* Permet de transformer un graph flot en graph string *)
let flot_to_string gr = gmap gr (fun f -> (string_of_int f.actuel)^"/"^(string_of_int f.capacite))

(*Fonction qui permet d'ajouter sur un graphe residuel seulement les arcs dont le label est different de 0*)
let add_arc_res gr origine dest = function  
  |0->gr 
  |nb-> new_arc gr origine dest nb 

(*fonction pour construire un graph residuel*)

let construire_res gr = 
  let graph_res_vide = clone_nodes gr in 
  e_fold gr (fun gra o d flot -> 
      let fdroite = flot.capacite - flot.actuel in 
      let fgauche = flot.actuel in 
      let nv_graph = add_arc_res gra o d fdroite in 
      add_arc_res nv_graph d o fgauche) graph_res_vide

(*fonction pour trouver la plus petite capacité du chemin*)

let cap_min gr chemin = List.fold_left (fun min_cap (o ,d) ->
    match (find_arc gr o d) with
    |None->raise Not_found 
    |Some x -> min x min_cap) 10000 chemin

(*augmentation des capacité au maximum sur le graph flot*)

let flot_update gr chemin nb = List.fold_left (fun graph (o,d) -> 
    match (find_arc graph o d) with
    | None -> (match find_arc graph d o with
        | None -> raise Not_found
        | Some f -> new_arc graph d o {actuel = f.actuel - nb; capacite = f.capacite})
    | Some f -> new_arc graph o d {actuel = f.actuel+nb; capacite = f.capacite })
    gr chemin

(*fonction permettant de transformer une liste d'element simple en liste de tuple pour afficher le chemin sous forme d'arcs*)

let transformationliste liste = 
  let rec loop liste acu = 
    match liste with 
    |None->None
    |Some[]->Some (List.rev acu)
    |Some [a]-> Some (List.rev acu) 
    |Some (a::b::rest)-> loop (Some (b::rest)) ((a,b)::acu)
  in loop liste []

(*fonction pour trouver un chemin dans le graph residuel *)

let trouver_chemin gr orig dest = 
  (*   renvoie chemin de orig à dest   ou None si pas de chemmin*)
  let rec loop gr orig visited = 
    if (orig =dest ) then (Some [orig]) else
    if (List.mem orig visited ) then None else 
      (*let rec loop acu graph o d flot = *)
      (*(Printf.printf "loop %d\n" orig ;*)
      match (List.find_map (fun (suiv,flot)-> loop gr suiv (orig::visited)) (out_arcs gr orig)) with 
      (*(Printf.printf "  -> %d\n" d ;*)
      |None -> None
      |Some chemindepuisd -> Some (orig::chemindepuisd)
  in loop gr orig [] 

(*fonction fulkerson *)

let run gr orig dest= 
  let graph_flot = (int_to_flot gr) in
  let rec loop flot = 
    let graph_res = construire_res flot in 
    let chemin = transformationliste(trouver_chemin graph_res orig dest ) in 
    match chemin with  
    |None -> flot 
    |Some _ -> 
      let augmenter = cap_min graph_res (Option.get chemin) in 
      let nv_graph = flot_update flot (Option.get chemin) augmenter in
      loop nv_graph
  in loop graph_flot


