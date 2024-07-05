extends Node

var scene_name = "Menu"
var language = "jp"
var cluses = [false,false,false,false,false,false,false,false]
var clue_num = 0
func check_clues():
	for i in range(cluses.size()):
		if cluses[i] == true:
			clue_num+=1
			
