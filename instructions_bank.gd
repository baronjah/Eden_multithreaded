# instructions_bank.gd
extends Node3D
class_name InstructionsBank # InstructionsBank.instructions_set_0   InstructionsBank.type_of_instruction_0


var instruction_add_number : String = "instruction_"
var set_add_number : String = "set_"

const type_of_instruction_0 = [
	"assign_priority_to_datapoint", "assign_things_to_datapoint", "set_max_things_number", "connect_containter_datapoint", "add_things_to_container", "set_the_scene", "rotate_container", "setup_text_bracet", "set_interaction_check_mode", "move_container", "load_file"
]



# instructions set 0
const instructions_set_0 = {
	0: [ # send things to datapoint
		["instruction_0|assign_priority_to_datapoint"],
		["akashic_records|thing_7"],
		["0"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_1|assign_things_to_datapoint"],
		["akashic_records|thing_7"],
		["akashic_records|thing_2|thing_3|thing_5|thing_4|thing_6|thing_1|thing_8|thing_9"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_2|set_max_things_number"],
		["akashic_records|thing_7"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_3|connect_containter_datapoint"],
		["akashic_records|thing_7|0"],
		["akashic_records"]
	],
	#4:[
	#	["instruction_4|set_the_scene"],
	#	["akashic_records|thing_7|0"],
	#	["0"]
	#],
	5:[
		["instruction_5|set_interaction_check_mode"],
		["akashic_records|thing_7"],
		["single|1"]
	]
}

# second isntructions set, after menu
const instructions_set_1 = {
	0: [ # send things to datapoint
		["instruction_6|assign_things_to_datapoint"],
		["akashic_records|thing_7"],
		["akashic_records|thing_11|thing_12|thing_13|thing_14|thing_15|thing_16|thing_17"]
	],
	1:[
		["instruction_7|set_the_scene"],
		["akashic_records|thing_7|0"],
		["2"]
	]
}

# the added scene instructions lol
const instructions_set_2 = {
	0: [ # send things to datapoint
		["instruction_5|assign_priority_to_datapoint"],
		["settings_container|thing_19"],
		["1"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_6|assign_things_to_datapoint"],
		["settings_container|thing_19"],
		["settings_container|thing_19|thing_20|thing_21|thing_22|thing_23|thing_24"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_7|set_max_things_number"],
		["settings_container|thing_19"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_8|connect_containter_datapoint"],
		["settings_container|thing_19|1"],
		["settings_container"]
	],
	4:[
		["instruction_31|set_the_scene"],
		["settings_container|thing_19|0"],
		["0"]
	],
	5:[
		["instruction_9|load_file"],#load_file
		["settings_container|thing_19|0"],
		["settings.txt"]
	],
	6:[
		["instruction_10|set_interaction_check_mode"],
		["settings_container|thing_19"],
		["single|1"]
	]
}



# keyboard instructions
const instructions_set_3 = {
	0: [ # send things to datapoint
		["instruction_9|assign_priority_to_datapoint"],
		["keyboard_container|thing_24"],
		["1"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_10|assign_things_to_datapoint"],
		["keyboard_container|thing_24"],
		["keyboard_container|thing_24|thing_25|thing_26|thing_27|thing_28|thing_29|thing_30"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_11|set_max_things_number"],
		["keyboard_container|thing_24"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_12|connect_containter_datapoint"],
		["keyboard_container|thing_24|2"],
		["keyboard_container"]
	],
	4:[ # rotate keyboard
		["instruction_13|rotate_container"],
		["keyboard_container|thing_24|2"],
		["keyboard_container|90.0"]
	],
	5:[ # setup text bracet keyboard
		["instruction_14|setup_text_bracet"],
		["keyboard_container|thing_24|2"],
		["keyboard_container|call_function"]
	],
	6:[
		["instruction_32|set_the_scene"],
		["keyboard_container|thing_24|0"],
		["0"]
	],#"move_container"
	7:[ #  move_container
		["instruction_15|move_container"],
		["keyboard_container|thing_24|2"],
		["keyboard_container|0.0,-4.5,0.41"]
	],
	8:[
		["instruction_16|set_interaction_check_mode"],
		["keyboard_container|thing_24"],
		["single|1"]
	]
}



# keyboard left instructions
const instructions_set_4 = {
	0: [ # send things to datapoint
		["instruction_15|assign_priority_to_datapoint"],
		["keyboard_left_container|thing_34"],
		["1"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_16|assign_things_to_datapoint"],
		["keyboard_left_container|thing_34"],
		["keyboard_left_container|thing_35|thing_36|thing_37|thing_38|thing_39|thing_40|thing_41|thing_42|thing_43|thing_44|thing_45|thing_46|thing_47|thing_48|thing_49|thing_50|thing_51"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_17|set_max_things_number"],
		["keyboard_left_container|thing_34"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_18|connect_containter_datapoint"],
		["keyboard_left_container|thing_34|3"],
		["keyboard_left_container"]
	],
	4:[ # rotate keyboard
		["instruction_19|rotate_container"],
		["keyboard_left_container|thing_34|3"],
		["keyboard_left_container|90.0"]
	],
	5:[
		["instruction_33|set_the_scene"],
		["keyboard_left_container|thing_34|0"],
		["0"]
	],
	6:[ #  move_container
		["instruction_20|move_container"],
		["keyboard_left_container|thing_34|3"],
		["keyboard_left_container|0.0,-4.5,0.41"]
	],
	7:[
		["instruction_21|set_interaction_check_mode"],
		["keyboard_left_container|thing_34"],
		["single|1"]
	]
}



# keyboard right instructions
const instructions_set_5 = {
	0: [ # send things to datapoint
		["instruction_20|assign_priority_to_datapoint"],
		["keyboard_right_container|thing_53"],
		["1"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_21|assign_things_to_datapoint"],
		["keyboard_right_container|thing_53"],
		["keyboard_right_container|thing_54|thing_55|thing_56|thing_57|thing_58|thing_59|thing_60|thing_61|thing_62|thing_63|thing_64|thing_65|thing_66|thing_67|thing_68|thing_69|thing_70"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_22|set_max_things_number"],
		["keyboard_right_container|thing_53"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_23|connect_containter_datapoint"],
		["keyboard_right_container|thing_53|4"],
		["keyboard_right_container"]
	],
	4:[ # rotate keyboard
		["instruction_24|rotate_container"],
		["keyboard_right_container|thing_53|4"],
		["keyboard_right_container|90.0"]
	],
	5:[
		["instruction_34|set_the_scene"],
		["keyboard_right_container|thing_53|0"],
		["0"]
	],
	6:[ #  move_container
		["instruction_25|move_container"],
		["keyboard_right_container|thing_53|4"],
		["keyboard_right_container|0.0,-4.5,0.41"]
	],
	7:[
		["instruction_26|set_interaction_check_mode"],
		["keyboard_right_container|thing_53"],
		["single|1"]
	]
}


# the added scene instructions lol
const instructions_set_6 = {
	0: [ # send things to datapoint
		["instruction_25|assign_priority_to_datapoint"],
		["things_creation_container|thing_72"],
		["1"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_26|assign_things_to_datapoint"],
		["things_creation_container|thing_72"],
		["things_creation_container|thing_73|thing_74|thing_75"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_27|set_max_things_number"],
		["things_creation_container|thing_72"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_28|connect_containter_datapoint"],
		["things_creation_container|thing_72|1"],
		["things_creation_container"]
	],
	4:[
		["instruction_35|set_the_scene"],
		["things_creation_container|thing_72|0"],
		["0"]
	],
	7:[
		["instruction_36|set_interaction_check_mode"],
		["things_creation_container|thing_72"],
		["single|1"]
	]
}



const instructions_set_7 = {
	0: [ # send things to datapoint
		["instruction_0|assign_priority_to_datapoint"],
		["singular_lines_container|thing_1"],
		["0"]
	] ,# add coma ,
	1: [ # send things to datapoint
		["instruction_1|assign_things_to_datapoint"],
		["singular_lines_container|thing_1"],
		["singular_lines_container|thing_0|thing_1|thing_2|thing_3|thing_4|thing_5"]
	] ,# add coma ,
	2:[ # send max things to datapoint
		["instruction_2|set_max_things_number"],
		["singular_lines_container|thing_1"],
		["100"]
	], # add coma ,
	3:[ # connect containter and datapoint
		["instruction_3|connect_containter_datapoint"],
		["singular_lines_container|thing_1|0"],
		["singular_lines_container"]
	],
	4:[
		["instruction_4|set_the_scene"],
		["singular_lines_container|thing_1|0"],
		["0"]
	],
	5:[
		["instruction_5|set_interaction_check_mode"],
		["singular_lines_container|thing_1"],
		["multi|2"]
	]
}
