# interactions_bank.gd
extends Node3D
class_name ActionsBank

var interaction_add_number  : String = "interaction_"
var list_add_number : String = "list_"

# InteractionsBank.type_of_interactions_0
const type_of_interactions_0 = [
	"change_scene", "add_scene", "change_text", "call_function", "unload_container", "write" , "shift_keyboard" , "number_letter"  , "return_string" , "undo_char" , "load_file" ,"dunno_yet"
]

const call_function = [
	"initialize_container", "write", "move_around", "show_window", "rotate", "connect", "add_thing", "remove_thing"
]



# InteractionsBank.interactions_list_0
const singular_interactions = {
	0: [
		["interaction_0|singular_records_container|thing_1"], # header
		["scene_0"], # where
		["thing_2"], # what trigger
		["change_scene"], # type of action
		["scene_1"] # specifics
	],
	1: [
		["interaction_0|singular_records_container|thing_1"],
		["scene_1"],
		["thing_2"],
		["change_scene"],
		["scene_0"]
	] # add comma ,
}



# InteractionsBank.interactions_list_0
const interactions_list_0 = {
	0: [
		["interaction_0|akashic_records|thing_7"],
		["scene_0|scene_2"],
		["thing_0|thing_1"],
		["change_scene"],
		["scene_1"]
	],
	1: [
		["interaction_1|akashic_records|thing_7"],
		["scene_1"],
		["thing_0"],
		["change_scene"],
		["scene_0"]
	] # add comma ,
}

# InteractionsBank.interactions_list_0
const interactions_list_1 = {
	0: [   # MAIN MENU -> THINGS - 1 things menu - scene_3
		["interaction_2|akashic_records|thing_7"], # on which datapoint and scene we are on
		["scene_2"],
		["thing_12"],
		["change_scene|fake_now"],
		["scene_3|testing"] # 12 things                 # to what scene we travel :)
	],     # Things stuff
	1: [   # THINGS -> MAIN MENU - 0 main menu - scene_2
		["interaction_3|akashic_records|thing_7"],
		["scene_3"],
		["thing_17"],
		["change_scene|unload_container"],
		["scene_2|things_creation_container"] # 17 exit/back
	], 
	2: [   # MAIN MENU -> SCENES - 2 scenes menu - scene_4
		["interaction_4|akashic_records|thing_7"],
		["scene_2"],
		["thing_13"],
		["change_scene"],
		["scene_4"] # 13 scenes
	],     # Scenes Stuff
	3: [   # SCENES -> MAIN MENU - 0 main menu - scene_2
		["interaction_5|akashic_records|thing_7"],
		["scene_4"],
		["thing_17"],
		["change_scene"],
		["scene_2"] # 17 exit/back
	], 
	4: [   # MAIN MENU -> INTERACTIONS - 3 interactions menu - scene_5
		["interaction_6|akashic_records|thing_7"],
		["scene_2"],
		["thing_14"],
		["change_scene"],
		["scene_5"] # 14 interactions
	],     # interactions stuff
	5: [   # INTERACTIONS -> MAIN MENU - 0 main menu - scene_2
		["interaction_7|akashic_records|thing_7"],
		["scene_5"],
		["thing_17"],
		["change_scene"],
		["scene_2"] # 17 exit/back
	], # add comma ,
	6: [   # MAIN MENU -> INSTRUCTIONS - 4 instructions menu - scene_6
		["interaction_8|akashic_records|thing_7"],
		["scene_2"],
		["thing_15"],
		["change_scene"],
		["scene_6"] # 15 instructions
	],     # instructions stuff
	7: [   # INSTRUCTIONS -> MAIN MENU - 0 main menu - scene_2
		["interaction_9|akashic_records|thing_7"],
		["scene_6"],
		["thing_17"],
		["change_scene"],
		["scene_2"] # 17 exit/back
	], # add comma ,
	8: [   # MAIN MENU -> SETTINGS - 5 settings menu - scene_7
		["interaction_10|akashic_records|thing_7"],
		["scene_2"],
		["thing_16"],
		["change_scene"],
		["scene_7"] # 16 settings
	],     
	
	# settings stuff
	9: [   # SETTINGS -> MAIN MENU - 0 main menu - scene_2
		["interaction_11|akashic_records|thing_7"],
		["scene_7"],
		["thing_17"],
		["change_scene|unload_container|unload_container|unload_container|unload_container|unload_container"],
		["scene_2|settings_container|keyboard_container|keyboard_left_container|keyboard_right_container|singular_lines_container"] # 17 exit/back
	],
	10: [   # SETTINGS -> adding new "scene" with clickable stuff to change settings :) 
		["interaction_12|akashic_records|thing_7"], # |load_file
		["scene_7"],
		["thing_12"],
		["add_scene|load_file"],
		["settings|settings_containerøsettings.txt"] # 17 exit/back # |settings.txtøsingular_lines
	],
	# things creation stuff
	11: [   # Things -> adding new "scene" with creation tools and devices and periphelia and manifestations 
		["interaction_148|akashic_records|thing_7"],
		["scene_3"],
		["thing_12"],
		["add_scene"],
		["things_creation"] # 17 exit/back
	],#,
	12: [   # Things -> adding new "scene" with creation tools and devices and periphelia and manifestations 
		["interaction_149|akashic_records|thing_7"],
		["scene_3"],
		["thing_17"],
		["change_scene|unload_container"],
		["scene_2|things_creation"] # 17 exit/back
	]
}

# InteractionsBank.interactions_list_0
const interactions_list_2 = {
	0: [
		["interaction_13|settings_container|thing_19"], # ["interaction_12|akashic_records|thing_7|scene_7|scenes_frames_7|add_scene"],
		["scene_0"],
		["thing_21"],
		["add_scene"],
		["keyboard"] # ["akashic_records|thing_12|settings"] # 17 exit/back
	],
	1: [
		["interaction_14|settings_container|thing_19"],
		["scene_0"],
		["thing_22"],
		["add_scene"],
		["singular_lines"]
	] # add comma ,
}

# InteractionsBank.interactions_list_0
const interactions_list_3 = {
	0: [
		["interaction_15|keyboard_container|thing_24"],
		["scene_0"],
		["thing_29"],
		["add_scene|add_scene"],
		["keyboard_left|keyboard_right"]
	],
	1: [
		["interaction_16|keyboard_container|thing_24"],
		["scene_0"],
		["thing_25"],
		["dunno_yet"],
		["node_path"]
	] # add comma ,
}



#  keyboard left hehe
#InteractionsBank.interactions_list_0
const interactions_list_4 = {
	0: [
		["interaction_17|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_36"],
		["write"],
		["q"]
	],
	1: [
		["interaction_18|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_37"],
		["write"],
		["w"]
	], # add comma ,
	2: [
		["interaction_19|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_38"],
		["write"],
		["e"]
	], # add comma ,
	3: [
		["interaction_20|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_39"],
		["write"],
		["r"]
	], # add comma ,
	4: [
		["interaction_21|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_40"],
		["write"],
		["t"]
	], # add comma ,
	5: [
		["interaction_22|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_41"],
		["write"],
		["a"]
	], # add comma ,
	6: [
		["interaction_23|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_42"],
		["write"],
		["s"]
	], # add comma ,
	7: [
		["interaction_24|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_43"],
		["write"],
		["d"]
	], # add comma ,
	8: [
		["interaction_25|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_44"],
		["write"],
		["f"]
	], # add comma ,
	9: [ # small letters
		["interaction_26|keyboard_left_container|thing_34"], # "shift_keyboard" , "number_letter"
		["scene_0"],
		["thing_45"],
		["shift_keyboard"],
		["1"] # scene 1
	], # add comma ,
	10: [# big letters
		["interaction_27|keyboard_left_container|thing_34"], # "shift_keyboard" , "number_letter"
		["scene_1"],
		["thing_45"],
		["shift_keyboard"],
		["0"] # scene 1
	], # add comma ,
	11: [ # numbers 1
		["interaction_28|keyboard_left_container|thing_34"], # "shift_keyboard" , "number_letter"
		["scene_2"],
		["thing_45"],
		["shift_keyboard"],
		["3"] # scene 1
	], # add comma ,
	12: [ # numbers 2
		["interaction_29|keyboard_left_container|thing_34"], # "shift_keyboard" , "number_letter"
		["scene_3"],
		["thing_45"],
		["shift_keyboard"],
		["2"] # scene 1
	], # add comma ,
	13: [
		["interaction_30|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_46"],
		["write"],
		["z"]
	], # add comma ,
	14: [
		["interaction_31|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_47"],
		["write"],
		["x"]
	], # add comma ,
	15: [
		["interaction_32|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_48"],
		["write"],
		["c"]
	], # add comma ,
	16: [
		["interaction_33|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_49"],
		["write"],
		["v"]
	], # add comma ,
	17: [# num button, small letters, goes to scene 2, which is numbers 1
		["interaction_34|keyboard_left_container|thing_34"], #"number_letter"
		["scene_0"],
		["thing_50"],
		["number_letter"],
		["2"]
	], # add comma ,
	18: [ # numb but big letters, goes to numbers 2
		["interaction_35|keyboard_left_container|thing_34"], #"number_letter"
		["scene_1"],
		["thing_50"],
		["number_letter"],
		["3"]
	], # add comma ,
	19: [ # numb but, numbers 1, goes to 0 , small letters
		["interaction_36|keyboard_left_container|thing_34"], #"number_letter"
		["scene_2"],
		["thing_50"],
		["number_letter"],
		["2"]
	], # add comma ,
	20: [ # numb but, numbers 2, goes to 2? numbers 1 again?!
		["interaction_37|keyboard_left_container|thing_34"], #"number_letter"
		["scene_3"],
		["thing_50"],
		["number_letter"],
		["1"]
	], # add comma ,
	21: [
		["interaction_38|keyboard_left_container|thing_34"],
		["scene_0"],
		["thing_51"],
		["write"],
		[" "]
	], # add comma ,
	22: [
		["interaction_39|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_36"],
		["write"],
		["Q"]
	],
	23: [
		["interaction_40|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_37"],
		["write"],
		["=W"]
	], # add comma ,
	24: [
		["interaction_41|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_38"],
		["write"],
		["=E"]
	], # add comma ,
	25: [
		["interaction_42|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_39"],
		["write"],
		["R"]
	], # add comma ,
	26: [
		["interaction_43|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_40"],
		["write"],
		["T"]
	], # add comma ,
	27: [
		["interaction_44|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_41"],
		["write"],
		["A"]
	], # add comma ,
	28: [
		["interaction_45|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_42"],
		["write"],
		["S"]
	], # add comma ,
	29: [
		["interaction_46|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_43"],
		["write"],
		["D"]
	], # add comma ,
	30: [
		["interaction_47|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_44"],
		["write"],
		["F"]
	], # add comma ,
	31: [
		["interaction_48|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_46"],
		["write"],
		["Z"]
	], # add comma ,
	32: [
		["interaction_49|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_47"],
		["write"],
		["X"]
	], # add comma ,
	33: [
		["interaction_50|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_48"],
		["write"],
		["C"]
	], # add comma ,
	34: [
		["interaction_51|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_49"],
		["write"],
		["V"]
	], # add comma ,
	35: [
		["interaction_52|keyboard_left_container|thing_34"],
		["scene_1"],
		["thing_51"],
		["write"],
		[" "]
	], # add comma ,
	36: [
		["interaction_53|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_36"],
		["write"],
		["1"]
	],
	37: [
		["interaction_54|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_37"],
		["write"],
		["2"]
	], # add comma ,
	38: [
		["interaction_55|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_38"],
		["write"],
		["3"]
	], # add comma ,
	39: [
		["interaction_56|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_39"],
		["write"],
		["4"]
	], # add comma ,
	40: [
		["interaction_57|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_40"],
		["write"],
		["5"]
	], # add comma ,
	41: [
		["interaction_58|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_41"],
		["write"],
		["-"]
	], # add comma ,
	42: [
		["interaction_59|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_42"],
		["write"],
		["/"]
	], # add comma ,
	43: [
		["interaction_60|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_43"],
		["write"],
		[":"]
	], # add comma ,
	44: [
		["interaction_61|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_44"],
		["write"],
		["("]
	], # add comma ,
	45: [
		["interaction_62|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_46"],
		["write"],
		["."]
	], # add comma ,
	46: [
		["interaction_63|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_47"],
		["write"],
		["、"]
	], # add comma ,
	47: [
		["interaction_64|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_48"],
		["write"],
		["?"]
	], # add comma ,
	48: [
		["interaction_65|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_49"],
		["write"],
		["!"]
	], # add comma ,
	49: [
		["interaction_66|keyboard_left_container|thing_34"],
		["scene_2"],
		["thing_51"],
		["write"],
		[" "]
	], # add comma ,
	50: [
		["interaction_67|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_36"],
		["write"],
		["["]
	],
	51: [
		["interaction_68|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_37"],
		["write"],
		["]"]
	], # add comma ,
	52: [
		["interaction_69|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_38"],
		["write"],
		["{"]
	], # add comma ,
	53: [
		["interaction_70|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_39"],
		["write"],
		["}"]
	], # add comma ,
	54: [
		["interaction_71|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_40"],
		["write"],
		["#"]
	], # add comma ,
	55: [
		["interaction_72|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_41"],
		["write"],
		["_"]
	], # add comma ,
	56: [
		["interaction_73|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_42"],
		["write"],
		["ø"]
	], # add comma ,
	57: [
		["interaction_74|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_43"],
		["write"],
		["┃"]
	], # add comma ,
	58: [
		["interaction_75|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_44"],
		["write"],
		["<"]
	], # add comma ,
	59: [
		["interaction_76|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_46"],
		["write"],
		["."]
	], # add comma ,
	60: [
		["interaction_77|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_47"],
		["write"],
		["、"]
	], # add comma ,
	61: [
		["interaction_78|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_48"],
		["write"],
		["?"]
	], # add comma ,
	62: [
		["interaction_79|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_49"],
		["write"],
		["!"]
	], # add comma ,
	63: [
		["interaction_80|keyboard_left_container|thing_34"],
		["scene_3"],
		["thing_51"],
		["write"],
		[" "]
	] # add comma ,
}



#  keyboard left hehe
#InteractionsBank.interactions_list_0
const interactions_list_5 = {
	0: [
		["interaction_81|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_55"],
		["write"],
		["p"]
	],
	1: [
		["interaction_82|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_56"],
		["write"],
		["o"]
	], # add comma ,
	2: [
		["interaction_83|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_57"],
		["write"],
		["i"]
	], # add comma ,
	3: [
		["interaction_84|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_58"],
		["write"],
		["u"]
	], # add comma ,
	4: [
		["interaction_85|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_59"],
		["write"],
		["y"]
	], # add comma ,
	5: [
		["interaction_86|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_60"],
		["write"],
		["l"]
	], # add comma ,
	6: [
		["interaction_87|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_61"],
		["write"],
		["k"]
	], # add comma ,
	7: [
		["interaction_88|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_62"],
		["write"],
		["j"]
	], # add comma ,
	8: [
		["interaction_89|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_63"],
		["write"],
		["h"]
	], # add comma ,
	9: [
		["interaction_90|keyboard_right_container|thing_53"], # "shift_keyboard" , "number_letter" return_string undo_char
		["scene_0"],
		["thing_64"],
		["undo_char"],
		["undo"] # scene 1
	], # add comma ,
	10: [
		["interaction_91|keyboard_right_container|thing_53"], # "shift_keyboard" , "number_letter"
		["scene_1"],
		["thing_64"],
		["undo_char"],
		["undo"] # scene 1
	], # add comma ,
	11: [
		["interaction_92|keyboard_right_container|thing_53"], # "shift_keyboard" , "number_letter"
		["scene_2"],
		["thing_64"],
		["undo_char"],
		["undo"] # scene 1
	], # add comma ,
	12: [
		["interaction_93|keyboard_right_container|thing_53"], # "shift_keyboard" , "number_letter"
		["scene_3"],
		["thing_64"],
		["undo_char"],
		["undo"] # scene 1
	], # add comma ,
	13: [
		["interaction_94|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_65"],
		["write"],
		["m"]
	], # add comma ,
	14: [
		["interaction_95|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_66"],
		["write"],
		["n"]
	], # add comma ,
	15: [
		["interaction_96|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_67"],
		["write"],
		["b"]
	], # add comma ,
	16: [
		["interaction_97|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_68"],
		["write"],
		["g"]
	], # add comma ,
	17: [
		["interaction_98|keyboard_right_container|thing_53"], # return
		["scene_0"],
		["thing_69"],
		["return_string"],
		["return"]
	], # add comma ,
	18: [
		["interaction_99|keyboard_right_container|thing_53"], #"number_letter"
		["scene_1"],
		["thing_69"],
		["return_string"],
		["return"]
	], # add comma ,
	19: [
		["interaction_100|keyboard_right_container|thing_53"], #"number_letter"
		["scene_2"],
		["thing_69"],
		["return_string"],
		["return"]
	], # add comma ,
	20: [
		["interaction_101|keyboard_right_container|thing_53"], #"number_letter"
		["scene_3"],
		["thing_69"],
		["return_string"],
		["return"]
	], # add comma ,
	21: [
		["interaction_102|keyboard_right_container|thing_53"],
		["scene_0"],
		["thing_70"],
		["write"],
		[" "]
	], # add comma ,
	22: [
		["interaction_103|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_55"],
		["write"],
		["P"]
	],
	23: [
		["interaction_104|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_56"],
		["write"],
		["O"]
	], # add comma ,
	24: [
		["interaction_105|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_57"],
		["write"],
		["I"]
	], # add comma ,
	25: [
		["interaction_106|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_58"],
		["write"],
		["U"]
	], # add comma ,
	26: [
		["interaction_107|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_59"],
		["write"],
		["Y"]
	], # add comma ,
	27: [
		["interaction_108|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_60"],
		["write"],
		["L"]
	], # add comma ,
	28: [
		["interaction_109|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_61"],
		["write"],
		["K"]
	], # add comma ,
	29: [
		["interaction_110|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_62"],
		["write"],
		["J"]
	], # add comma ,
	30: [
		["interaction_111|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_63"],
		["write"],
		["H"]
	], # add comma ,
	31: [
		["interaction_112|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_65"],
		["write"],
		["M"]
	], # add comma ,
	32: [
		["interaction_113|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_66"],
		["write"],
		["N"]
	], # add comma ,
	33: [
		["interaction_114|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_67"],
		["write"],
		["B"]
	], # add comma ,
	34: [
		["interaction_115|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_68"],
		["write"],
		["G"]
	], # add comma ,
	35: [
		["interaction_116|keyboard_right_container|thing_53"],
		["scene_1"],
		["thing_70"],
		["write"],
		[" "]
	], # add comma ,
	36: [
		["interaction_117|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_55"],
		["write"],
		["0"]
	],
	37: [
		["interaction_118|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_56"],
		["write"],
		["9"]
	], # add comma ,
	38: [
		["interaction_119|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_57"],
		["write"],
		["8"]
	], # add comma ,
	39: [
		["interaction_120|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_58"],
		["write"],
		["7"]
	], # add comma ,
	40: [
		["interaction_121|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_59"],
		["write"],
		["6"]
	], # add comma ,
	41: [
		["interaction_122|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_60"],
		["write"],
		["¤"]
	], # add comma ,
	42: [
		["interaction_123|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_61"],
		["write"],
		["@"]
	], # add comma ,
	43: [
		["interaction_124|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_62"],
		["write"],
		["&"]
	], # add comma ,
	44: [
		["interaction_125|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_63"],
		["write"],
		[";"]
	], # add comma ,
	45: [
		["interaction_126|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_65"],
		["write"],
		["'"]
	], # add comma ,
	46: [
		["interaction_127|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_66"],
		["write"],
		["¥"]
	], # add comma ,
	47: [
		["interaction_128|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_67"],
		["write"],
		["§"]
	], # add comma ,
	48: [
		["interaction_129|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_68"],
		["write"],
		[")"]
	], # add comma ,
	49: [
		["interaction_130|keyboard_right_container|thing_53"],
		["scene_2"],
		["thing_70"],
		["write"],
		[" "]
	], # add comma ,
	50: [
		["interaction_131|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_55"],
		["write"],
		["="]
	],
	51: [
		["interaction_132|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_56"],
		["write"],
		["+"]
	], # add comma ,
	52: [
		["interaction_133|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_57"],
		["write"],
		["*"]
	], # add comma ,
	53: [
		["interaction_134|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_58"],
		["write"],
		["^"]
	], # add comma ,
	54: [
		["interaction_135|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_59"],
		["write"],
		["%"]
	], # add comma ,
	55: [
		["interaction_136|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_60"],
		["write"],
		["$"]
	], # add comma ,
	56: [
		["interaction_137|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_61"],
		["write"],
		["∩"]
	], # add comma ,
	57: [
		["interaction_138|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_62"],
		["write"],
		["†"]
	], # add comma ,
	58: [
		["interaction_139|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_63"],
		["write"],
		["·"]
	], # add comma ,
	59: [
		["interaction_140|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_65"],
		["write"],
		["¨"]
	], # add comma ,
	60: [
		["interaction_141|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_66"],
		["write"],
		["¯"]
	], # add comma ,
	61: [
		["interaction_142|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_67"],
		["write"],
		["»"]
	], # add comma ,
	62: [
		["interaction_143|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_68"],
		["write"],
		[">"]
	], # add comma ,
	63: [
		["interaction_145|keyboard_right_container|thing_53"],
		["scene_3"],
		["thing_70"],
		["write"],
		[" "]
	] # add comma ,
}


# InteractionsBank.interactions_list_0
const interactions_list_6 = {
	0: [
		["interaction_146|things_creation_container|thing_72"], # ["interaction_12|akashic_records|thing_7|scene_7|scenes_frames_7|add_scene"],
		["scene_0"],
		["thing_73"],
		["add_scene"],
		["keyboard"] # ["akashic_records|thing_12|settings"] # 17 exit/back
	],
	1: [
		["interaction_147|things_creation_container|thing_72"],
		["scene_0"],
		["thing_74"],
		["dunno_yet"],
		["node_path"]
	] # add comma ,
}
# interaction 148 in menus stuff eh


# InteractionsBank.interactions_list_0
const interactions_list_7 = {
	0: [
		["interaction_0|singular_lines_container|thing_1"], # ["interaction_12|akashic_records|thing_7|scene_7|scenes_frames_7|add_scene"],
		["scene_0"],
		["thing_2"],
		["dunno_yet"],
		["keyboard"] # ["akashic_records|thing_12|settings"] # 17 exit/back
	],
	1: [
		["interaction_1|singular_lines_container|thing_1"],
		["scene_0"],
		["thing_3"],
		["dunno_yet"],
		["singular_lines"]
	] # add comma ,
}
