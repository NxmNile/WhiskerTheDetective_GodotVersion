extends Node

var scene_name = "World1"
var language = "en"
var cluses = [false,false,false,false,false,false,false,false]
var clue_num : int
func check_clues():
	clue_num = 0
	for i in range(cluses.size()):
		if cluses[i] == true:
			clue_num+=1
			
