# banks_combiner.gd
#
# JSH Ethereal Banks Combiner
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┓    ┓    ┏┓     ┓ •      
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣┫┏┓┏┓┃┏┏  ┃ ┏┓┏┳┓┣┓┓┏┓┏┓┏┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┻┛┗┻┛┗┛┗┛  ┗┛┗┛┛┗┗┗┛┗┛┗┗ ┛
#       888 oo     .d8P  888     888          
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Banks Combiner
#

extends Node3D
class_name BanksCombiner #BanksCombiner.combination_0 
#BanksCombiner.set_containers_names

func _init():
	print(" ready on each script ? 3")


# BanksCombiner.data_names_0
const data_names_0 = [
	"records", "instructions", "scenes", "interactions"
]

# BanksCombiner.data_names_0
const data_names_2_numbers = {
	"records" = 0, 
	"instructions" = 1, 
	"scenes" = 2, 
	"interactions" = 3
	}




const data_names_1 = [
	"records"
]

const data_names_2 = [
	"instructions", "scenes", "interactions"
]

# BanksCombiner.data_names_3
# recreator, needs records, scenes, interactions
const data_names_3 = [
	"records", "scenes", "interactions"
]

#class_name BanksCombiner #BanksCombiner.combination_0
const data_sets_names = [
	"base_", "menu_", "settings_", "keyboard_", "keyboard_left_", "keyboard_right_", "things_creation_", "singular_lines_"
]

# BanksCombiner.data_sets_names "base_"
# BanksCombiner.data_sets_names_0 "base"
const data_sets_names_0 = [
	"base", "menu", "settings", "keyboard", "keyboard_left", "keyboard_right", "things_creation", "singular_lines"
]

const dataSetLimits = { # dataSetLimits and data_sets_names in BanksCombiner
	"base_": 1,
	"menu_": 1,
	"settings_": 1,
	"keyboard_": 1,
	"keyboard_left_": 1,
	"keyboard_right_": 1,
	"things_creation_": 2,
	"singular_lines_": 8
}

const data_set_type = {
	"base_": 0,
	"menu_": 0,
	"settings_": 0,
	"keyboard_": 0,
	"keyboard_left_": 0,
	"keyboard_right_": 0,
	"things_creation_": 0,
	"singular_lines_": 1
}

const set_container_name = {
	"base_": "akashic_records",
	"menu_": "akashic_records",
	"settings_": "settings_container",
	"keyboard_": "keyboard_container",
	"keyboard_left_": "keyboard_left_container",
	"keyboard_right_": "keyboard_right_container",
	"things_creation_": "things_creation_container",
	"singular_lines_": "singular_lines_container"
}

const container_set_name = {
	"akashic_records": ["base", "menu"],
	"settings_container" : "settings",
	"keyboard_container": "keyboard",
	"keyboard_left_container" : "keyboard_left",
	"keyboard_right_container": "keyboard_right",
	"things_creation_container" : "things_creation",
	"singular_lines_container" : "singular_lines"
}


const set_active_name = {
	"base_": "base",
	"menu_": "menu",
	"settings_": "settings",
	"keyboard_": "keyboard",
	"keyboard_left_": "keyboard_left",
	"keyboard_right_": "keyboard_right",
	"things_creation_": "things_creation",
	"singular_lines_": "singular_lines"
}


const set_containers_names = {
	"base": "akashic_records",
	"menu": "akashic_records",
	"settings": "settings_container",
	"keyboard": "keyboard_container",
	"keyboard_left": "keyboard_left_container",
	"keyboard_right": "keyboard_right_container",
	"things_creation": "things_creation_container",
	"singular_lines": "singular_lines_container"
}

# the new way to do things
const combination_new_gen_0 = [
	[0]
]


# the new way to do things
const combination_new_gen_1 = [
	[1], [2], [3]
]



# the base one
const combination_0 = [
	[0], [1], [2], [3]
]

# the menu one
const combination_1 = [
	[0], [1], [2], [3]
]

# the settings one
const combination_2 = [
	[0], [1], [2], [3]
]

# the keyboard bracekt one
const combination_3 = [
	[0], [1], [2], [3]
]

# keyboard left
const combination_4 = [
	[0], [1], [2], [3]
]

# keyboard migi
const combination_5 = [
	[0], [1], [2], [3]
]

# things creation
const combination_6 = [
	[0], [1], [2], [3]
]

# things creation
const combination_7 = [
	[0], [1], [2], [3]
]
