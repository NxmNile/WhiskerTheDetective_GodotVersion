extends Node

var scene_name = "PoliceStation2"
var language = "en"
var cluses = [false,false,false,false,false,false,false,false]
var npc = [false,false,false,false]
var npc_num : int
var clue_num : int
func check_clues():
	clue_num = 0
	for i in range(cluses.size()):
		if cluses[i] == true:
			clue_num+=1
			
func check_interrogate():
	npc_num = 0
	for i  in range(npc.size()):
		if npc[i]==true:
			npc_num+=1
