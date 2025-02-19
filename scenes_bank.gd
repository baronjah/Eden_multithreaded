# scenes_bank.gd
extends Node3D
class_name ScenesBank 

var scene_add_number : String = "scene_"
var frame_add_number : String = "frame_"


const type_of_scene = [
	"static_frame", "loopable_frame"
]




# ScenesBank.scenes_frames_0
const scenes_frames_0 = {
	0: [ # thing_2|thing_3|thing_5|thing_4|thing_6|thing_1|thing_8|thing_9
		["scene_0|akashic_records|thing_7|records_0"],
		["akashic_records|thing_2|6.0,-3.0,0.1"], # -6.802811, -3.425565, 0)
		["akashic_records|thing_3|6.0,-3.0,0.1"], # text shall move with that button i guess so -6.802811, -3.425565, 0)
		["akashic_records|thing_4|0.0,0.0,0.0"], # screen, maybe shall stay as it is
		["akashic_records|thing_6|0.0,0.0,-1.0"],
		["akashic_records|thing_8|0.0,0.0,1.0"]
	],
	1: [
		["scene_1|akashic_records|thing_7|records_0"],
		["akashic_records|thing_2|-6.0,-3.0,0.1"], # -6.802811, -3.425565, 0)
		["akashic_records|thing_3|-6.0,-3.0,0.1"], # text shall move with that button i guess so -6.802811, -3.425565, 0)
		["akashic_records|thing_4|0.0,0.0,0.0"], # screen, maybe shall stay as it is
		["akashic_records|thing_6|0.0,0.0,1.0"],
		["akashic_records|thing_8|0.0,0.0,-1.0"]
	] # add comma ,
}

# ScenesBank.scenes_set_1
const scenes_frames_1 = {
	0: [ # main menu
		["scene_2|akashic_records|thing_7|records_2"], # menu 0
		["akashic_records|thing_11|0.0,0.0,0.0|a1"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Things"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Scenes"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Interactions"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Instructions"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|Settings"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Exit"] # button
	],
	1: [ # things menu
		["scene_3|akashic_records|thing_7|records_2"], # menu 1
		["akashic_records|thing_11|0.0,0.0,0.0|a2"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Thing creator"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Thing viewer"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Things combiner"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Construct viewer"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|Records maps"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Back"] # button
	], # add comma ,
	2: [ # Scenes Menu
		["scene_4|akashic_records|thing_7|records_2"], # menu 2
		["akashic_records|thing_11|0.0,0.0,0.0|a3"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Frane creator"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Frame viewer"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Frames combiner"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Scenes viewer"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|Scenes frames"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Back"] # button
	],# add comma ,
	3: [ # Interactions Menu
		["scene_5|akashic_records|thing_7|records_2"], # menu 2
		["akashic_records|thing_11|0.0,0.0,0.0|a3"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Interaction creator"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Interaction viewer"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Interactions combiner"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Interactions viewer"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|Interactions lists"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Back"] # button
	],# add comma ,
	4: [ # Instructions Menu
		["scene_6|akashic_records|thing_7|records_2"], # menu 2
		["akashic_records|thing_11|0.0,0.0,0.0|a3"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Instruction creator"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Instruction viewer"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Instructions combiner"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Instructions viewer"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|Instructions sets"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Back"] # button
	],# add comma ,
	5: [ # Settings Menu
		["scene_7|akashic_records|thing_7|records_2"], # menu 2
		["akashic_records|thing_11|0.0,0.0,0.0|a3"], # screen
		["akashic_records|thing_12|-6.0,4.0,0.1|Files Paths"], # button
		["akashic_records|thing_13|-6.0,2.5,0.1|Graphics"], # button
		["akashic_records|thing_14|-6.0,1.0,0.1|Sounds"], # button
		["akashic_records|thing_15|-6.0,-0.5,0.1|Key bindings"], # button
		["akashic_records|thing_16|-6.0,-2.0,0.1|internet stuff maybe? dunno, how they manage to do so many settings in games, and make them confusing xD"], # button
		["akashic_records|thing_17|-6.0,-4.0,0.1|Back"] # button
	]
}


const scenes_frames_2 = { # Settings additional stuff
	0: [
		["scene_0|settings_container|thing_19|records_3"],
		["settings_container|thing_20|2.0,0.0,0.1"], # 12:9 window
		["settings_container|thing_21|6.0,4.0,0.2"], # button smaller
		["settings_container|thing_22|0.0,4.0,0.2"], # button bigger
		["settings_container|thing_23|6.0,4.0,0.2"], # text 1
		["settings_container|thing_24|0.0,4.0,0.2"] # text 2
	],
	1: [
		["scene_1|settings_container|thing_19|records_3"],
		["settings_container|thing_20|2.0,0.0,0.1"], # 12:9 window
		["settings_container|thing_21|6.0,4.0,0.2"], # button smaller
		["settings_container|thing_22|0.0,4.0,0.2"], # button bigger
		["settings_container|thing_23|6.0,4.0,0.2"], # text 1
		["settings_container|thing_24|0.0,4.0,0.2"] # text 2
	] # add comma ,
}

# keyboard scenes
const scenes_frames_3 = { # keyboard
	0: [
		["scene_0|keyboard_container|thing_24|records_4"],
		["keyboard_container|thing_25|2.33,0.0,0.2"], # screen for keyboard, left
		["keyboard_container|thing_26|-2.33,0.0,0.2"], # right space for keyboard
		["keyboard_container|thing_27|0.0,0.0,0.3"], # bracket for text, over keyboard
		["keyboard_container|thing_28|-2.0,0.0,0.3"], # text to put inside a bracket
		["keyboard_container|thing_29|0.0,-0.58,0.3|add"], # q button
		["keyboard_container|thing_30|0.0,-0.33,0.1"]
	],
	1: [
		["scene_1|keyboard_container|thing_24|records_4"],
		["keyboard_container|thing_25|2.33,0.0,0.2"], # screen for keyboard, left
		["keyboard_container|thing_26|-2.33,0.0,0.2"], # right space for keyboard
		["keyboard_container|thing_27|0.0,0.0,0.3"], # bracket for text, over keyboard
		["keyboard_container|thing_28|-2.0,0.0,0.3"], # text to put inside a bracket
		["keyboard_container|thing_29|0.0,-0.58,0.3|close"], # Q button
		["keyboard_container|thing_30|0.0,-0.33,0.1"]
	] # add comma ,
}

# keyboard left scenes
const scenes_frames_4 = { # keyboard
	0: [ # small letters
		["scene_0|keyboard_left_container|thing_34|records_5"],
		["keyboard_left_container|thing_35|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_left_container|thing_36|-4.5,-1.625,0.2|q"], # key for keyboard q
		["keyboard_left_container|thing_37|-3.5,-1.625,0.2|w"], # key for keyboard w
		["keyboard_left_container|thing_38|-2.5,-1.625,0.2|e"], # key for keyboard e
		["keyboard_left_container|thing_39|-1.5,-1.625,0.2|r"], # key for keyboard r
		["keyboard_left_container|thing_40|-0.5,-1.625,0.2|t"], # key for keyboard t
		["keyboard_left_container|thing_41|-4.0,-2.8725,0.2|a"], # key for keyboard a
		["keyboard_left_container|thing_42|-3.0,-2.8725,0.2|s"], # key for keyboard s
		["keyboard_left_container|thing_43|-2.0,-2.8725,0.2|d"], # key for keyboard d
		["keyboard_left_container|thing_44|-1.0,-2.8725,0.2|f"], # key for keyboard f 
		["keyboard_left_container|thing_45|-4.27,-4.1225,0.2|△"], # key for keyboard △  shift▲
		["keyboard_left_container|thing_46|-3.0,-4.1225,0.2|z"], # key for keyboard z
		["keyboard_left_container|thing_47|-2.0,-4.1225,0.2|x"], # key for keyboard x
		["keyboard_left_container|thing_48|-1.0,-4.1225,0.2|c"], # key for keyboard c
		["keyboard_left_container|thing_49|-0.0,-4.1225,0.2|v"], # key for keyboard z
		["keyboard_left_container|thing_50|-4.27,-5.3725,0.2|0010110"], # key for keyboard 0010110
		["keyboard_left_container|thing_51|-1.73,-5.3725,0.2|                                                            space"] # key for keyboard z
	],
	1: [ # big letters
		["scene_1|keyboard_left_container|thing_34|records_5"],
		["keyboard_left_container|thing_35|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_left_container|thing_36|-4.5,-1.625,0.2|Q"], # key for keyboard q
		["keyboard_left_container|thing_37|-3.5,-1.625,0.2|W"], # key for keyboard w
		["keyboard_left_container|thing_38|-2.5,-1.625,0.2|E"], # key for keyboard e
		["keyboard_left_container|thing_39|-1.5,-1.625,0.2|R"], # key for keyboard r
		["keyboard_left_container|thing_40|-0.5,-1.625,0.2|T"], # key for keyboard t
		["keyboard_left_container|thing_41|-4.0,-2.8725,0.2|A"], # key for keyboard a
		["keyboard_left_container|thing_42|-3.0,-2.8725,0.2|S"], # key for keyboard s
		["keyboard_left_container|thing_43|-2.0,-2.8725,0.2|D"], # key for keyboard d
		["keyboard_left_container|thing_44|-1.0,-2.8725,0.2|F"], # key for keyboard f 
		["keyboard_left_container|thing_45|-4.27,-4.1225,0.2|▲"], # key for keyboard △  shift▲
		["keyboard_left_container|thing_46|-3.0,-4.1225,0.2|Z"], # key for keyboard z
		["keyboard_left_container|thing_47|-2.0,-4.1225,0.2|X"], # key for keyboard x
		["keyboard_left_container|thing_48|-1.0,-4.1225,0.2|C"], # key for keyboard c
		["keyboard_left_container|thing_49|-0.0,-4.1225,0.2|V"], # key for keyboard z
		["keyboard_left_container|thing_50|-4.27,-5.3725,0.2|0010110"], # key for keyboard 0010110
		["keyboard_left_container|thing_51|-1.73,-5.3725,0.2|                                                            space"] # key for keyboard z
	],
	2: [ # numbers
		["scene_2|keyboard_left_container|thing_34|records_5"],
		["keyboard_left_container|thing_35|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_left_container|thing_36|-4.5,-1.625,0.2|1"], # key for keyboard q
		["keyboard_left_container|thing_37|-3.5,-1.625,0.2|2"], # key for keyboard w
		["keyboard_left_container|thing_38|-2.5,-1.625,0.2|3"], # key for keyboard e
		["keyboard_left_container|thing_39|-1.5,-1.625,0.2|4"], # key for keyboard r
		["keyboard_left_container|thing_40|-0.5,-1.625,0.2|5"], # key for keyboard t
		["keyboard_left_container|thing_41|-4.0,-2.8725,0.2|-"], # key for keyboard a
		["keyboard_left_container|thing_42|-3.0,-2.8725,0.2|/"], # key for keyboard s
		["keyboard_left_container|thing_43|-2.0,-2.8725,0.2|:"], # key for keyboard d
		["keyboard_left_container|thing_44|-1.0,-2.8725,0.2|("], # key for keyboard f 
		["keyboard_left_container|thing_45|-4.27,-4.1225,0.2|△"], # key for keyboard △  shift▲
		["keyboard_left_container|thing_46|-3.0,-4.1225,0.2|."], # key for keyboard z
		["keyboard_left_container|thing_47|-2.0,-4.1225,0.2|、"], # key for keyboard x
		["keyboard_left_container|thing_48|-1.0,-4.1225,0.2|?"], # key for keyboard c
		["keyboard_left_container|thing_49|-0.0,-4.1225,0.2|!"], # key for keyboard z
		["keyboard_left_container|thing_50|-4.27,-5.3725,0.2|qwerty"], # key for keyboard 0010110
		["keyboard_left_container|thing_51|-1.73,-5.3725,0.2|                                                            space"] # key for keyboard z
	],
	3: [ # numbers
		["scene_3|keyboard_left_container|thing_34|records_5"],
		["keyboard_left_container|thing_35|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_left_container|thing_36|-4.5,-1.625,0.2|["], # key for keyboard q
		["keyboard_left_container|thing_37|-3.5,-1.625,0.2|]"], # key for keyboard w
		["keyboard_left_container|thing_38|-2.5,-1.625,0.2|{"], # key for keyboard e
		["keyboard_left_container|thing_39|-1.5,-1.625,0.2|}"], # key for keyboard r
		["keyboard_left_container|thing_40|-0.5,-1.625,0.2|#"], # key for keyboard t
		["keyboard_left_container|thing_41|-4.0,-2.8725,0.2|_"], # key for keyboard a
		["keyboard_left_container|thing_42|-3.0,-2.8725,0.2|ø"], # key for keyboard s
		["keyboard_left_container|thing_43|-2.0,-2.8725,0.2|┃"], # key for keyboard d
		["keyboard_left_container|thing_44|-1.0,-2.8725,0.2|<"], # key for keyboard f 
		["keyboard_left_container|thing_45|-4.27,-4.1225,0.2|▲"], # key for keyboard △  shift▲
		["keyboard_left_container|thing_46|-3.0,-4.1225,0.2|."], # key for keyboard z
		["keyboard_left_container|thing_47|-2.0,-4.1225,0.2|、"], # key for keyboard x
		["keyboard_left_container|thing_48|-1.0,-4.1225,0.2|?"], # key for keyboard c
		["keyboard_left_container|thing_49|-0.0,-4.1225,0.2|!"], # key for keyboard z
		["keyboard_left_container|thing_50|-4.27,-5.3725,0.2|qwerty"], # key for keyboard 0010110
		["keyboard_left_container|thing_51|-1.73,-5.3725,0.2|                                                            space"] # key for keyboard z
	]
}



# keyboard left scenes
const scenes_frames_5 = { # keyboard
	0: [ # small letters
		["scene_0|keyboard_right_container|thing_53|records_6"], # the header, datapoint
		["keyboard_right_container|thing_54|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_right_container|thing_55|4.5,-1.625,0.2|p"], # key for keyboard p
		["keyboard_right_container|thing_56|3.5,-1.625,0.2|o"], # key for keyboard o
		["keyboard_right_container|thing_57|2.5,-1.625,0.2|i"], # key for keyboard i
		["keyboard_right_container|thing_58|1.5,-1.625,0.2|u"], # key for keyboard u
		["keyboard_right_container|thing_59|0.5,-1.625,0.2|y"], # key for keyboard y
		["keyboard_right_container|thing_60|4.0,-2.8725,0.2|l"], # key for keyboard l
		["keyboard_right_container|thing_61|3.0,-2.8725,0.2|k"], # key for keyboard k
		["keyboard_right_container|thing_62|2.0,-2.8725,0.2|j"], # key for keyboard j
		["keyboard_right_container|thing_63|1.0,-2.8725,0.2|h"], # key for keyboard h 
		["keyboard_right_container|thing_64|4.27,-4.1225,0.2|undo"], # key for undo
		["keyboard_right_container|thing_65|3.0,-4.1225,0.2|m"], # key for keyboard g
		["keyboard_right_container|thing_66|2.0,-4.1225,0.2|n"], # key for keyboard m
		["keyboard_right_container|thing_67|1.0,-4.1225,0.2|b"], # key for keyboard n
		["keyboard_right_container|thing_68|0.0,-2.8725,0.2|g"], # key for keyboard b
		["keyboard_right_container|thing_69|4.27,-5.3725,0.2|return"], # return key
		["keyboard_right_container|thing_70|1.73,-5.3725,0.2|bar                                                                "] # space bar
	],
	1: [ # small letters
		["scene_1|keyboard_right_container|thing_53|records_6"], # the header, datapoint
		["keyboard_right_container|thing_54|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_right_container|thing_55|4.5,-1.625,0.2|P"], # key for keyboard p
		["keyboard_right_container|thing_56|3.5,-1.625,0.2|O"], # key for keyboard o
		["keyboard_right_container|thing_57|2.5,-1.625,0.2|I"], # key for keyboard i
		["keyboard_right_container|thing_58|1.5,-1.625,0.2|U"], # key for keyboard u
		["keyboard_right_container|thing_59|0.5,-1.625,0.2|Y"], # key for keyboard y
		["keyboard_right_container|thing_60|4.0,-2.8725,0.2|L"], # key for keyboard l
		["keyboard_right_container|thing_61|3.0,-2.8725,0.2|K"], # key for keyboard k
		["keyboard_right_container|thing_62|2.0,-2.8725,0.2|J"], # key for keyboard j
		["keyboard_right_container|thing_63|1.0,-2.8725,0.2|H"], # key for keyboard h 
		["keyboard_right_container|thing_64|4.27,-4.1225,0.2|undo"], # key for undo
		["keyboard_right_container|thing_65|3.0,-4.1225,0.2|M"], # key for keyboard g
		["keyboard_right_container|thing_66|2.0,-4.1225,0.2|N"], # key for keyboard m
		["keyboard_right_container|thing_67|1.0,-4.1225,0.2|B"], # key for keyboard n
		["keyboard_right_container|thing_68|0.0,-2.8725,0.2|G"], # key for keyboard b
		["keyboard_right_container|thing_69|4.27,-5.3725,0.2|return"], # return key
		["keyboard_right_container|thing_70|1.73,-5.3725,0.2|bar                                                                "] # space bar
	],
	2: [ # small letters
		["scene_2|keyboard_right_container|thing_53|records_6"], # the header, datapoint
		["keyboard_right_container|thing_54|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_right_container|thing_55|4.5,-1.625,0.2|0"], # key for keyboard p
		["keyboard_right_container|thing_56|3.5,-1.625,0.2|9"], # key for keyboard o
		["keyboard_right_container|thing_57|2.5,-1.625,0.2|8"], # key for keyboard i
		["keyboard_right_container|thing_58|1.5,-1.625,0.2|7"], # key for keyboard u
		["keyboard_right_container|thing_59|0.5,-1.625,0.2|6"], # key for keyboard y
		["keyboard_right_container|thing_60|4.0,-2.8725,0.2|¤"], # key for keyboard l
		["keyboard_right_container|thing_61|3.0,-2.8725,0.2|@"], # key for keyboard k
		["keyboard_right_container|thing_62|2.0,-2.8725,0.2|&"], # key for keyboard j
		["keyboard_right_container|thing_63|1.0,-2.8725,0.2|;"], # key for keyboard h 
		["keyboard_right_container|thing_64|4.27,-4.1225,0.2|undo"], # key for undo
		["keyboard_right_container|thing_65|3.0,-4.1225,0.2|'"], # key for keyboard g
		["keyboard_right_container|thing_66|2.0,-4.1225,0.2|¥"], # key for keyboard m
		["keyboard_right_container|thing_67|1.0,-4.1225,0.2|§"], # key for keyboard n
		["keyboard_right_container|thing_68|0.0,-2.8725,0.2|)"], # key for keyboard b
		["keyboard_right_container|thing_69|4.27,-5.3725,0.2|return"], # return key
		["keyboard_right_container|thing_70|1.73,-5.3725,0.2|bar                                                                "] # space bar
	],
	3: [ # small letters
		["scene_3|keyboard_right_container|thing_53|records_6"], # the header, datapoint
		["keyboard_right_container|thing_54|0.0,-1,0.1"], # screen for keyboard, left
		["keyboard_right_container|thing_55|4.5,-1.625,0.2|="], # key for keyboard p
		["keyboard_right_container|thing_56|3.5,-1.625,0.2|+"], # key for keyboard o
		["keyboard_right_container|thing_57|2.5,-1.625,0.2|*"], # key for keyboard i
		["keyboard_right_container|thing_58|1.5,-1.625,0.2|^"], # key for keyboard u
		["keyboard_right_container|thing_59|0.5,-1.625,0.2|%"], # key for keyboard y
		["keyboard_right_container|thing_60|4.0,-2.8725,0.2|$"], # key for keyboard l
		["keyboard_right_container|thing_61|3.0,-2.8725,0.2|∩"], # key for keyboard k
		["keyboard_right_container|thing_62|2.0,-2.8725,0.2|†"], # key for keyboard j
		["keyboard_right_container|thing_63|1.0,-2.8725,0.2|·"], # key for keyboard h 
		["keyboard_right_container|thing_64|4.27,-4.1225,0.2|undo"], # key for undo
		["keyboard_right_container|thing_65|3.0,-4.1225,0.2|¨"], # key for keyboard g
		["keyboard_right_container|thing_66|2.0,-4.1225,0.2|¯"], # key for keyboard m
		["keyboard_right_container|thing_67|1.0,-4.1225,0.2|»"], # key for keyboard n
		["keyboard_right_container|thing_68|0.0,-2.8725,0.2|>"], # key for keyboard b
		["keyboard_right_container|thing_69|4.27,-5.3725,0.2|return"], # return key
		["keyboard_right_container|thing_70|1.73,-5.3725,0.2|bar                                                                "] # space bar
	]
}


const scenes_frames_6 = { # Settings additional stuff
	0: [
		["scene_0|things_creation_container|thing_72|records_7"],
		["things_creation_container|thing_73|2.0,0.0,0.1"], # 12:9 window
		["things_creation_container|thing_74|6.0,4.0,0.2"], # button smaller
		["things_creation_container|thing_75|0.0,4.0,0.2"] # button bigger
	],
	1: [
		["scene_1|things_creation_container|thing_72|records_7"],
		["things_creation_container|thing_73|2.0,0.0,0.1"], # 12:9 window
		["things_creation_container|thing_74|6.0,4.0,0.2"], # button smaller
		["things_creation_container|thing_75|0.0,4.0,0.2"] # button bigger
	] # add comma ,
}



const scenes_frames_7 = { # Settings additional stuff
	0: [
		["scene_0|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,3.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,3.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,3.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,3.0,0.3"] # text
	],
	1: [
		["scene_1|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,2.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,2.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,2.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,2.0,0.3"] # text
	],
	2: [
		["scene_2|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,1.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,1.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,1.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,1.0,0.3"] # text
	],
	3: [
		["scene_3|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,0.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,0.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,0.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,0.0,0.3"] # text
	],
	4: [
		["scene_4|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,-1.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,-1.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,-1.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,-1.0,0.3"] # text
	],
	5: [
		["scene_5|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,-2.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,-2.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,-2.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,-2.0,0.3"] # text
	],
	6: [
		["scene_6|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,-3.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,-3.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,-3.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,-3.0,0.3"] # text
	],
	7: [
		["scene_7|singular_lines_container|thing_1|singular_records"],
		["singular_lines_container|thing_2|6.0,-4.0,0.2"], # button smaller
		["singular_lines_container|thing_3|0.0,-4.0,0.2"], # button bigger
		["singular_lines_container|thing_4|6.0,-4.0,0.3"], # text
		["singular_lines_container|thing_5|0.0,-4.0,0.3"] # text
	]
}
