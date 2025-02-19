# data_point.gd
#
# JSH Ethereal Datapoint
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┓         •   
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┃┃┏┓╋┏┓┏┓┏┓┓┏┓╋
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┻┛┗┻┗┗┻┣┛┗┛┗┛┗┗
#       888 oo     .d8P  888     888                            ┛     
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Datapoint
#

extends Node3D

# the only connection with thread_pool
@onready var thread_pool = get_node("/root/thread_pool_autoload")
#hopefully now i will check connection, before creation of tasks
@onready var task_manager =  get_node("/root/main/JSH_task_manager")#$JSH_task_manager
# this might need mutex
var main_scene_to_set : int = 99

# probably this thing
var datapoint_things_dictionary = {}
var things_dictionary = Mutex.new()


# these might need mutexes
var Scenes_array : Array = []
var scenes_mutex = Mutex.new()
var current_scene : String
var number_of_scene : int = -1

# probably this too
var Interactions_array : Array = []
var interactions_mutex = Mutex.new()

# Sending stuff functions :)
# In data_point.gd
var main_node: Node
var container_node: Node




var data_point_name : String
var data_point_number : int
var max_things_number : int

var current_things_number : int = -1
var current_priority : int = -1

var data_point_information : Array = []
var data_point_layer_0 : Array = []
var data_point_layer_0_data : Array = []

var data_point_ : String = "datapoint_"

var datapoint_checked : Array = []


# Scenes Stuff

var can_it_work_now_marry : Array = []






var current_text: String = ""
var cursor_position: int = 0
var cursor_visible: bool = true
var cursor_model: MeshInstance3D
var char_width: float = 0.2
var char_width_new : float = 0.0
var bracket_width: float = 4.0

var bracket_current_text : Array = []

var maximum_amount_of_interaction : int = 1
var current_interaction_mode : String = "single"











# the bolean ints of truths,
var the_scenes_fiasco : int = 0
var the_new_layers_fiasco : int = 0
var third_inty_thingy : int = 0
var scenes_array_size_now : int = 0
var movement_checker : int = 0

var mutex_for_three_thingies = Mutex.new()

# the newest thingy
var array_datalayer_new : Array = []


# the informations to put on labels type of var
var the_label_message : Array = []


# the godly messengers with data, getting them download, and even uploading information
var download_received : Dictionary = {}
var upload_to_send : Dictionary = {}

var mutex_for_cursor = Mutex.new()
var current_text_mutex = Mutex.new()


var data_to_be_used : Array = []
var times_of_data_used : int = 0


#var frame_signal_connected := false

#func _process(delta):
#	print(self.name)
func _init():
	print(" ready on each script ? 2 datapoint.gd ")

func process_delta_fake():
	print(self.name, " , " , the_scenes_fiasco, " , " , the_new_layers_fiasco, " , " , third_inty_thingy, " , " , scenes_array_size_now , " , " , main_scene_to_set)

#func _ready():
	#
##	main_node.connect("frame_processed", Callable(self, "_on_frame_processed"))
##	frame_signal_connected = true
#
	#thread_pool.connect("task_discarded", func(task): 
		##print("Task completed: ", task.tag)
		#var finished_task = task.tag
		#queue_pusher_adder(finished_task)
	#)


#func downloads_of_information():
#	print
	# gere we receive data
	# here we create keys? for dictionary?
	# and also its informations


#func upload_data():
#	print
	# here we are sending data
	# it will first send data to main node
	# then it will need to clear that Dictionary key of that message from that message

func finishied_setting_up_datapoint(my_name):
	#main_node.await_for_signal()
	container_node = self.get_parent()
	#print(my_name, " and lets get container too ", container_node)

func check_amount_of_container():
	var container = self.get_parent()
	#print(" in data point : container " , container)
	#main_node.check_amount_of_children_in_branch()

func check_state_of_dictionary_and_three_ints_of_doom():
	var array_of_current_state : Array = []
	things_dictionary.lock()
	array_of_current_state.append(datapoint_things_dictionary.duplicate(true))
	things_dictionary.unlock()
	print(" data point main scene ? " , main_scene_to_set)
	mutex_for_three_thingies.lock()
	var three_thingies : Vector3i 
	three_thingies.x = the_new_layers_fiasco # the dictionary being send there
	three_thingies.y = the_scenes_fiasco # any scene being send there?
	three_thingies.z = third_inty_thingy # the main scene instruction being send already
	array_of_current_state.append(three_thingies)
	mutex_for_three_thingies.unlock()
	
	return array_of_current_state
	#print(" the current state of datapoint : " , array_of_current_state)

func new_datapoint_layer_system(deep_state_copy_of_apples):
	
	
	things_dictionary.lock()
	datapoint_things_dictionary = deep_state_copy_of_apples
	things_dictionary.unlock()
	
	
	mutex_for_three_thingies.lock()
	if the_new_layers_fiasco == 0:
		the_new_layers_fiasco +=1

	if the_new_layers_fiasco == 1 and the_scenes_fiasco == 1 and third_inty_thingy == 1:
		if scenes_array_size_now >= main_scene_to_set  + 1:
			the_new_layers_fiasco = 0
			the_scenes_fiasco = 0
			third_inty_thingy = 0
			#print(" upload scene frames testingg 1 ", self.name)
			move_things_around(main_scene_to_set)
	mutex_for_three_thingies.unlock()



func check_dictionary_from_datapoint():
	things_dictionary.lock()
	var dictionary = datapoint_things_dictionary.duplicate(true)
	things_dictionary.unlock()
	return dictionary



func initialize_loading_file(file_name):
	
	print(" file name ", file_name)
	
	var message = SettingsBank.check_all_settings_data()
	print("load_file message : " , message)
	#print("initialize loading file settings self name " , self.name)
	
	var new_array_thingy : Array = []
	var amounts_of_thingies : int = 0
	for thing_labely in message:
		print(message[thing_labely])
		new_array_thingy.append([thing_labely, message[thing_labely]])
		amounts_of_thingies +=1
	
	the_label_message.append(new_array_thingy)
	#the_label_message.append(amounts_of_thingies)
	#print(" print the new thingy ", amounts_of_thingies , " , ", the_label_message)
	settings_labels_start()

var settings_label_checker : int = 0

func settings_labels_start():
	#var array_for_labels
	var counter_of_settings_lines : int = 0
	the_label_message.append(counter_of_settings_lines)
	#print(" new function work pls ", datapoint_things_dictionary)
	var counter_label : int = 0
	
	things_dictionary.lock()
	for thing_inside in datapoint_things_dictionary:
		print("file name now check that" , datapoint_things_dictionary[thing_inside])
		if datapoint_things_dictionary[thing_inside].has("node"):
			if datapoint_things_dictionary[thing_inside]["node"] is Label3D:
				datapoint_things_dictionary[thing_inside]["node"].text = the_label_message[0][0][counter_of_settings_lines]
				counter_of_settings_lines +=1
	things_dictionary.unlock()
	
	if settings_label_checker == 0:
		settings_label_checker = 1
	
		var size_of_data = the_label_message[0].size()
		
		
		var number_of_actions = size_of_data - (counter_of_settings_lines / 2)
		
		the_label_message[0][0] = []
		the_label_message[0].erase([])
		
		#main_node.create_new_task("three_stages_of_creation", "singular_lines")
		var add_container : String = "add_container"
		var container_missing : String = "singular_lines_container"
		main_node.seventh_dimensional_magic(add_container, container_missing, number_of_actions)
		# func eight_dimensional_magic(type_of_message : String, message_now, receiver_name : String):
		var type_of_message = "singular_lines_text"
		main_node.eight_dimensional_magic(type_of_message, the_label_message, container_missing)


func receive_a_message(message):
	#message[0].erase([])
	print(" datapoint received a message ", message)
	# var data_to_be_used : Array = []
	times_of_data_used = 1
	data_to_be_used.append(message)


func singular_lines_added():
	print(" singular_line added")


#func start_temporary_timer_settings():
	#await get_tree().create_timer(1.0).timeout  # Waits 1 second


#var counter_label : int = 0


func change_dual_text():
	#var array_for_labels
	var counter_of_settings_lines : int = 0
	#the_label_message.append(counter_of_settings_lines)
	#print(" new function work pls")
	var counter_message : int = 0
	
	var size_of_message = data_to_be_used[0][0].size() - 1
	
	things_dictionary.lock()
	for thing_inside in datapoint_things_dictionary:
		print(datapoint_things_dictionary[thing_inside])
		if datapoint_things_dictionary[thing_inside].has("node"):
			if datapoint_things_dictionary[thing_inside]["node"] is Label3D:
				
				if size_of_message >= counter_message:
					#print(" the message that would appear " , data_to_be_used[0][0][counter_message][counter_of_settings_lines])
					datapoint_things_dictionary[thing_inside]["node"].text = str(data_to_be_used[0][0][counter_message][counter_of_settings_lines])
				counter_of_settings_lines +=1
				if counter_of_settings_lines == 2:
					counter_message +=1
					counter_of_settings_lines = 0
	things_dictionary.unlock()




func connect_keyboard_string():
	print()
	## so a node can have text changed





# current_things_number, data_point_layer_0, data_point_layer_0_data, data_point_information
func setup_text_handling():
	#print(" setup text handling " , self.name)
	add_cursor()
	setup_cursor_timer()

func add_cursor():
	mutex_for_cursor.lock()
	cursor_model = MeshInstance3D.new()
	var cursor_mesh = BoxMesh.new()
	cursor_mesh.size = Vector3(0.05, 0.4, 0.01)
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(1, 1, 1, 1)
	cursor_model.material_override = material
	cursor_model.mesh = cursor_mesh
	mutex_for_cursor.unlock()
	
	var container = get_parent()
	var text_bracket = container.get_node("thing_27")
	if text_bracket:
		mutex_for_cursor.lock()
		text_bracket.add_child(cursor_model)
		mutex_for_cursor.unlock()
		update_cursor_position()
	

func setup_cursor_timer():
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.53
	timer.timeout.connect(blink_cursor)
	timer.start()



func blink_cursor():
	#print(" cursor_position : ", cursor_position)
	cursor_visible = !cursor_visible
	mutex_for_cursor.lock()
	if cursor_model:
		cursor_model.visible = cursor_visible
	mutex_for_cursor.unlock()

#func create_new_task(function_name: String, data):
#func create_new_task_empty(function_name: String):
## if process delta changes stuff, it is changing it before time, so we could theoretically update the text here, but we would probably need to make a task, that will
## update the rest?
func handle_key_press(key: String):
	
#	create_new_task("handle_key_press_o", key)

#func handle_key_press_o(key: String):
	current_text_mutex.lock()
	if len(current_text) * char_width < bracket_width:
		current_text = current_text.insert(cursor_position, key)
		cursor_position += 1
		current_text_mutex.unlock()
		update_text_and_cursor(key)
	else:
		current_text_mutex.unlock()

func handle_backspace():
#	create_new_task_empty("handle_backspace_o")
	
	
#func handle_backspace_o():
	if cursor_position > 0:
		current_text_mutex.lock()
		current_text = current_text.erase(cursor_position - 1, 1)
		cursor_position -= 1
		var key = ""
		current_text_mutex.unlock()
		update_text_and_cursor(key)
	else:
		current_text_mutex.unlock()

func update_text_and_cursor(key):
	#print(" we update text and cursor")
	var container = self.get_parent()
	var text_label = container.get_node("thing_28")

	if text_label:
		var action_additional : String = "update_text_cursor_after" 
		var datapoint_node = self
		main_node.first_dimensional_magic(action_additional, datapoint_node, text_label)
		#print(" we get that text label thingy")
		text_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		current_text_mutex.lock()
		text_label.text = current_text
		text_label.set_text(current_text)
		current_text_mutex.unlock()

		char_width_new = get_text_width(text_label)
		create_new_task("get_text_width", text_label)

		if key.is_empty():

			bracket_current_text.pop_back()
		else:
			bracket_current_text.append([[key], [char_width_new]])

	update_cursor_position()


#func first_dimensional_magic(type_of_action_to_do : String, datapoint_node : Node, additional_node : Node = null):
#	print

func update_text_cursor_after(text_label):
	char_width_new = get_text_width(text_label)
	update_cursor_position()


func update_cursor_position():
	mutex_for_cursor.lock()
	if cursor_model:
		var start_x = -bracket_width/2
		var x_pos = start_x + char_width_new#(cursor_position * char_width)
		cursor_model.position = Vector3(x_pos, 0, 0.01)
	mutex_for_cursor.unlock()




func get_text_width(text_label: Label3D) -> float:
	# Method 1: Using get_aabb()
	#text_label.queue_redraw()
	var aabb = text_label.get_aabb()
	var text_width = aabb.size.x
	#print(" text_width : " , text_width)
	#char_width_new = text_width
	#update_cursor_position()\
	return text_width

func change_numbers_letters(scene_to_pull): #
	print(" parallel reality chan num let func : " , scene_to_pull)
	#var container_left = main_node.get_node("keyboard_left_container/thing_34")
	#var container_right = main_node.get_node("keyboard_right_container/thing_53")
	#container_left.move_things_around(int(scene_to_pull))
	#container_right.move_things_around(int(scene_to_pull))
	
	
	
	
func shift_keyboard(scene_to_pull): # print(" parallel reality numbers / letters ") 
	print(" parallel reality shift keys : " , scene_to_pull)
	#var container_left = main_node.get_node("keyboard_left_container/thing_34")
	#print(" parallel reality container left? : " , container_left)
	#var container_right = main_node.get_node("keyboard_right_container/thing_53")
	#container_left.move_things_around(int(scene_to_pull))
	#container_right.move_things_around(int(scene_to_pull))
	
	
	
	
func return_string_from_keyboards():
	print(" return a string") # 
	


func undo_a_character(data):
#	print(" undo a character") # handle_backspace()
	#var container_keyboard = main_node.get_node("keyboard_container/thing_24")
	handle_backspace()
	













func setup_main_reference(main_ref: Node) -> void:
#	await main_ref.get_tree().process_frame
#	print(" datapoint first ever contact with wordl, ", self.name, " and ", main_ref)
	main_node = main_ref

func check_all_things_inside_datapoint():
	var some_data = [data_point_name , 
	data_point_number , 
	max_things_number , 
	current_things_number , 
	current_priority , 
	data_point_information , 
	data_point_layer_0 , 
	datapoint_checked , 
	data_point_layer_0_data]
	return some_data

func get_datapoint_info_for_containter_connection():
	#print("now we in datapoint, wanna connect with containter :)")
	return


func thing_interaction(thing):
	#print("thing in datapoint ", thing.name, current_scene)
	
	things_dictionary.lock()
	if datapoint_things_dictionary.has(thing.name):
		things_dictionary.unlock()
		#print(" it got that thing ")
		var array_of_things = check_possible_interactions(thing.name)
		
		return array_of_things
	else:
		#print(" it does not have that thing? ")
		things_dictionary.unlock()

var lets_check_thingies_again : int = 0



## to be deleted i guess, i dont want it done this way, will change it all soon
#func queue_pusher_adder(finished_task):
	#
#
	#var names_splitterr = finished_task.split("|")
#
	#
	#
	#if names_splitterr[0] == "finishied_setting_up_datapoint" and self.name == "thing_19" and names_splitterr[1] == "thing_19":
		#print(" lets make the settings working ",finished_task)
		#settings_labels_start()
		#
		#
#
#
	#if names_splitterr[0] == "write_on_keyboard" and self.name == "thing_24":
		##print("array_of_conciousness datapoint finished task : write_on_keyboard from there we print " , self.name )
		#print(" write_on_keyboard handle key press thing 24, names_splitterr " , names_splitterr)
		#handle_key_press(names_splitterr[1])
#
	#if names_splitterr[0] == "undo_a_character" and self.name == "thing_24":
		##print("array_of_conciousness datapoint finished task : write_on_keyboard from there we print " , self.name )
		#print(" undo a character thing 24")
		#handle_backspace()
		#
##handle_backspace()
#
	#if names_splitterr[0] == "shift_keyboard" and (self.name == "thing_34" or self.name == "thing_53"):
		#if names_splitterr[1].length() < 2:
			##print(" shift keyboard in queue ", self.name , " names splitter 1" , names_splitterr[1])
			#print(" shift_keyboard  thing 53 and 34 " , names_splitterr)
			#var scene_to_set = int(names_splitterr[1])
			#move_things_around(scene_to_set)
			#
			##change_numbers_letters
	#if names_splitterr[0] == "change_numbers_letters" and (self.name == "thing_34" or self.name == "thing_53"):
		#if names_splitterr[1].length() < 2:
			##print(" shift keyboard in queue ", self.name , " names splitter 1" , names_splitterr[1])
			#var scene_to_set = int(names_splitterr[1])
			#print(" change numbers_letter thing 53 and 34 " , names_splitterr)
			#move_things_around(scene_to_set)


	

func write_on_keyboard(data_of_key_pressed):
	print(" we clicking : " , data_of_key_pressed)



# creating new tasks, also punishing mortals 
#func create_new_task(function_name: String, data):
	#var task_tag = function_name + "|" + str(data) + "|" + str(Time.get_ticks_msec())
	## Declare the variable first
	##var completion_handler
	### Then assign the function to it
	##completion_handler = func(completed_tag):
		##if completed_tag == task_tag:
			###print("Task completed: ", function_name)
			##thread_pool.disconnect("task_finished", completion_handler)
	### Connect with the callable
	##thread_pool.connect("task_finished", completion_handler)
#
	#thread_pool.submit_task(self, function_name, data, task_tag)

# function that is first, here we send its name, priority, max things number?
func power_up_data_point(datapoint_name, datapoint_number, array_of_data):


	var str_num = str(datapoint_number)
	data_point_name = data_point_ + str_num
	var int_num = int(array_of_data[0][0])

	data_point_information.append([data_point_name])

	data_point_information.append([datapoint_name])

	data_point_information.append([datapoint_number])

	data_point_information.append([int_num])

	return data_point_information
	
	#
func datapoint_check():
	datapoint_checked.clear()
	
	datapoint_checked.append([current_priority])
	datapoint_checked.append([current_things_number])
	
#	print(" datapoint being checked") 
	
	return datapoint_checked

func datapoint_assign_priority(send_priority_number):
	#print(" the multi tasking testing : datapoint_assign_priority : ", " , ", send_priority_number)
	current_priority = int(send_priority_number)
	
func add_thing_to_datapoint(array_from_main):

	data_point_layer_0.append(array_from_main)

func datapoint_max_things_number_setter(sended_max_number):
	max_things_number = int(sended_max_number)
	


var sad_counter : int = 0

func upload_scenes_frames(header_line, information_lines):
	#print(" datapoint thinking " , current_interaction_mode)
	#print("  the await two point o stuff  upload scenes")

	var array_for_present_moment : Array = []
	
	# Create a deep copy of the arrays to prevent reference issues
	var header_copy = header_line.duplicate(true)
	var info_copy = information_lines.duplicate(true)
	
	array_for_present_moment.append(header_copy)
	array_for_present_moment.append(info_copy)
	
	# If this is a new scene, append it
	var is_new_scene = true
	var counter_for_scenes : int = -1
	#
	scenes_mutex.lock()
	for existing_scene in Scenes_array:
		counter_for_scenes +=1
		if existing_scene[0][0][0] == header_line[0][0]:  # Compare scene names
			#print(" datapoint thinking 1 " , existing_scene)
			#print(" datapoint thinking 2 " , array_for_present_moment)
			is_new_scene = false
			#print(" datapoint scenes test before : " , Scenes_array[counter_for_scenes])
			Scenes_array[counter_for_scenes] = array_for_present_moment
			#print("the scene we set now datapoint scenes test after : " , Scenes_array[counter_for_scenes])
			movement_checker = 0
			#break
	scenes_mutex.unlock()
	#
	if is_new_scene:
		scenes_mutex.lock()
		Scenes_array.append(array_for_present_moment)
		scenes_array_size_now = Scenes_array.size()
		scenes_mutex.unlock()
	else:
		print(" we should been appendin them scenes but somehow it exist?!", self.name, header_line)
	
	
	
	mutex_for_three_thingies.lock()
	if movement_checker == 0:
		if the_scenes_fiasco == 0:
			the_scenes_fiasco +=1
		#print(" upload scene frames testingg ", self.name, " the scene is : " , array_for_present_moment[0])
	
	if the_new_layers_fiasco == 1 and the_scenes_fiasco == 1 and third_inty_thingy == 1:
		if scenes_array_size_now >= main_scene_to_set  + 1:
			the_new_layers_fiasco = 0
			the_scenes_fiasco = 0
			third_inty_thingy = 0
			#print(" upload scene frames testingg 2 ", self.name)
			move_things_around(main_scene_to_set)
	mutex_for_three_thingies.unlock()

func upload_interactions(header_line, information_lines):
	print(" the await two point o stuff  upload interaction")
	
	var interaction_blimp : Array = [header_line, information_lines]
	
	interactions_mutex.lock()
	Interactions_array.append(interaction_blimp.duplicate(true))
	interactions_mutex.unlock()

func safe_get(array: Array, indices: Array, default = null) -> Variant:
	var current = array
	for index in indices:
		if typeof(current) != TYPE_ARRAY or index < 0 or index >= current.size():
			return default # If any depth check fails, return the default value
		current = current[index]
	return current

#var sixth_interaction = safe_get(posib_inter, [1, 0, 8, 0], "Not Found")


func check_possible_interactions(thing):
	var first_results = check_possible_actions(thing)
	#print(" Action 2.0 results : " , first_results)
	var array_of_things = null
	if first_results != null:
		array_of_things = do_action_found(first_results)
	return array_of_things


func check_possible_actions(thing):
	var found_interaction = null
	#print(" Action 2.0 thing : " , thing)
	#print(" Action 2.0 current_scene : " , current_scene)
	interactions_mutex.lock()
	var actions_possible = Interactions_array.duplicate(true) 
	interactions_mutex.unlock()
	for possible_action in actions_possible:
		#print(" Action 2.0 : " , possible_action[1][0])
		var possible_scenes = possible_action[1][0]
		for one_scene in possible_scenes:
			#print(" Action 2.0 one_scene " , one_scene)
			if current_scene == one_scene[0]:
				#print(" Action 2.0 we found that scene " , possible_action)
				var possible_things = possible_action[1][1]
				for one_thing in possible_things:
					#print(" Action 2.0 one thing " , one_thing[0])
					if thing == one_thing[0]:
						#print(" Action 2.0 we found that thing " , thing)
						found_interaction = possible_action
						## here we could append every possible actions
						## why?
						## the datapoint, container, thing, could not only need a scene, but also state
						## like while walking, standing, doing something, it can do something else, but not that
						## maybe when it is falling, it can only stand up?
						return found_interaction


func do_action_found(action_page):
	var actions = action_page[1]
	#print(" Action 2.0 results need to do stuff 2 : " , actions[2] , " and 3 : " , actions[3])
	var the_actions_to_do = actions[2]
	var specifics_in_action = actions[3]
	
	var counter_one : int = -1
	for singular_action in the_actions_to_do:
		counter_one +=1
		#print(" Action 2.0 ", the_actions_to_do[counter_one] , " and " , specifics_in_action[counter_one])
		var action_current = specifics_in_action[counter_one][0]
		match the_actions_to_do[counter_one][0]:
			"change_scene":
				#print(" Action 2.0 change_scene ", action_current)
				if action_current is String:
					#print(" Action 2.0 change scene, it is a string ")
					var split_for_number = action_current.split("_")
					if split_for_number.size() > 1:
						#print(" Action 2.0 it is bigger than 1 " , split_for_number[1])
						var inty_numba = int(split_for_number[1])
						move_things_around(inty_numba)
						
			
			"add_scene":
				print("catch Action 2.0 add_scene ", action_current)
				main_node.create_new_task("three_stages_of_creation", action_current)
				
			"change_text": 
				print(" Action 2.0 change_text ", action_current)
				
				
			"call_function": 
				print(" Action 2.0 call_function ", action_current)
				
				
			"unload_container": 
				#print(" Action 2.0 unload_container ", action_current)
				var container_name = action_current
				var send_type_of_unload = "container"
				main_node.fifth_dimensional_magic(send_type_of_unload, container_name)
				
			"write":
				#print(" Action 2.0 write ", action_current)
				var name_of_action : String = "call_function_get_node"
				var node_to_get : String = "keyboard_container/thing_24"
				var name_of_the_function : String = "handle_key_press"
				main_node.sixth_dimensional_magic(name_of_action, node_to_get, name_of_the_function, action_current)
				
			"shift_keyboard": 
				#print(" Action 2.0 shift_keyboard ", action_current)
					#print(" parallel reality shift keyboard ", posib_inter[1][0][2][0])
				var name_of_action : String = "move_things_around"
				var node_to_get_0 : String = "keyboard_left_container/thing_34"
				var node_to_get_1 : String = "keyboard_right_container/thing_53"
				var array_of_nodes : Array = []
				array_of_nodes.append(node_to_get_0)
				array_of_nodes.append(node_to_get_1)
				var type_of_action : String = "get_nodes_call_function"
				var data_to_send = int(action_current)
				main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
				
			"number_letter":
				#print(" Action 2.0 number_letter ", action_current)
				#print(" parallel reality numbers / letters ", posib_inter[1][0][2][0]) 
				var name_of_action : String = "move_things_around"
				var node_to_get_0 : String = "keyboard_left_container/thing_34"
				var node_to_get_1 : String = "keyboard_right_container/thing_53"
				var array_of_nodes : Array = []
				array_of_nodes.append(node_to_get_0)
				array_of_nodes.append(node_to_get_1)
				var type_of_action : String = "get_nodes_call_function"
				var data_to_send = int(action_current)
				main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
				
			"return_string":
				#print(" Action 2.0 return_string ", action_current)
				var return_string_from_keyboards : String = "return_string_from_keyboards"
				
				
			"undo_char":
				#print(" Action 2.0 undo_char ", action_current)
				var function_name_to_call : String = "handle_backspace"
				var node_to_get : String = "keyboard_container/thing_24"
				var name_of_action : String = "call_function_single_get_node"
				main_node.sixth_dimensional_magic(name_of_action, node_to_get, function_name_to_call)
				
			"load_file":
				print(" Action 2.0 load_file ", action_current)
				var splitter_of_one = action_current.split("ø")
				print(" Action 2.0 load_file splitter_of_one ", splitter_of_one)
				var name_of_action = "load_a_file"
				var container_name = splitter_of_one[0]
				var file_to_load = splitter_of_one[1]
				print(" Action 2.0 load_file splitter_of_one ", name_of_action , " , " , container_name , " , " , file_to_load)
				main_node.eight_dimensional_magic(name_of_action, file_to_load, container_name)
				
			"dunno_yet":
				print(" Action 2.0 dunno_yet ", action_current)
				
				
			_:
				print(" Action 2.0 we didnt find it ", action_current)
	
	#match counter:
		#0: 
			##print(" counter ", counter)
			##print(" multi tasking, lets find out why we do rea rae 0, ", scene_things)
			#var scene_to_set : int = int(posib_inter[1][0][3][0])
			##print(" move things around " , scene_to_set)
			##scene_things = 
			#move_things_around(scene_to_set)
			##print("scene_things :" , scene_things)
			##array_of_things = check_things_in_scene(scene_things)
			#counter = -1
		#1: 
			##print(" counter ", counter , " and " , counter_for_array)
			##print(" multi tasking, lets find out why we do rea rae 1")
			#var current_interaction_to_do
			#match counter_for_array:
				#0: 
					#current_interaction_to_do = scene_to_pull
				#1:
					#current_interaction_to_do = first_interaction
				#2:
					#current_interaction_to_do = second_interaction
				#3:
					#current_interaction_to_do = third_interaction
				#4:
					#current_interaction_to_do = fourth_interaction
				#5:
					#current_interaction_to_do = fifth_interaction
				#6:
					#current_interaction_to_do = sixth_interaction
			##var container = self.get_parent()
			##var main_script = container.get_parent()
			##print(" are we even calling here ?")
			#main_node.create_new_task("three_stages_of_creation", current_interaction_to_do)
			## maybe lets try to create a task
			#counter = -1
		#2: 
			##print(" multi tasking, lets find out why we do rea rae 2")
			#counter = -1
		#3: #
			##print(" multi tasking, lets find out why we do rea rae 3")
			#counter = -1
		#4: 
			##print(" multi tasking, lets find out why we do rea rae 4")
			#var current_interaction_to_do
			#match counter_for_array:
				#0:
					#current_interaction_to_do = first_interaction
				#1:
					#current_interaction_to_do = second_interaction
				#2:
					#current_interaction_to_do = third_interaction
				#3:
					#current_interaction_to_do = fourth_interaction
				#4:
					#current_interaction_to_do = fifth_interaction
				#5:
					#current_interaction_to_do = sixth_interaction
			#var container_name = current_interaction_to_do
			#var send_type_of_unload = "container"
			#main_node.fifth_dimensional_magic(send_type_of_unload, container_name)
			##print(" probably this one for unloading containers? : " , current_interaction_to_do)
			#counter = -1
			##var container_node = get_parent()
			##var parent_node = container_node.get_parent()
			##if parent_node:
			##	for child in parent_node.get_children():
			##		if child.name == container_name:
						##var two_things : Array = []
						##two_things.clear()
						##two_things.append(name_of_interaction)
						##two_things.append(current_interaction_to_do)
						##array_of_things[1].append(two_things)
						##break
					##else:
						##print(" check_possible_interactions 5 Sibling node with name does not exist: ", container_name, " also parent_node :" , parent_node)
				##counter = -1
			##else:
				##print(" check_possible_interactions 5 Parent node does not exist!")
		#5: 
			##print(" multi tasking, lets find out why we do rea rae 5")
			##print(" i think we would start writing maybe hehe " , scene_to_pull,  " , ", self.name)
			#counter = -1
			##var keyboard_bracet_node = main_node.get_node("keyboard_container/thing_24")
			##if !keyboard_bracet_node:
				##keyboard_bracet_node = await try_get_node("keyboard_container/thing_24", main_node)
			##if keyboard_bracet_node:
				#
				##print( " i think we would start writing maybe hehe keyboard_bracet_node :  ", keyboard_bracet_node)
				##keyboard_bracet_node.handle_key_press(scene_to_pull)
			##create_new_task("write_on_keyboard", scene_to_pull)
			#
			## "thing_24"
			## "thing_24"
			#var name_of_action : String = "call_function_get_node"
			#var node_to_get : String = "keyboard_container/thing_24"
			#var name_of_the_function : String = "handle_key_press"
			#main_node.sixth_dimensional_magic(name_of_action, node_to_get, name_of_the_function, scene_to_pull)
			#
			##create_new_task(name_of_the_function, scene_to_pull)
		#6: 
			##print(" multi tasking, lets find out why we do rea rae 6")
			#print(" parallel reality shift keyboard ", posib_inter[1][0][2][0])
			#var name_of_action : String = "move_things_around"
			#var node_to_get_0 : String = "keyboard_left_container/thing_34"
			#var node_to_get_1 : String = "keyboard_right_container/thing_53"
			#var array_of_nodes : Array = []
			#array_of_nodes.append(node_to_get_0)
			#array_of_nodes.append(node_to_get_1)
			#var type_of_action : String = "get_nodes_call_function"
			#var data_to_send = int(posib_inter[1][0][2][0])
			#main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
			##create_new_task("shift_keyboard", scene_to_pull)# shift_keyboard(scene_to_pull)
		#7: 
			##print(" multi tasking, lets find out why we do rea rae 7")
			#print(" parallel reality numbers / letters ", posib_inter[1][0][2][0]) 
			#var name_of_action : String = "move_things_around"
			#var node_to_get_0 : String = "keyboard_left_container/thing_34"
			#var node_to_get_1 : String = "keyboard_right_container/thing_53"
			#var array_of_nodes : Array = []
			#array_of_nodes.append(node_to_get_0)
			#array_of_nodes.append(node_to_get_1)
			#var type_of_action : String = "get_nodes_call_function"
			#var data_to_send = int(posib_inter[1][0][2][0])
			#main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
			##create_new_task("change_numbers_letters", scene_to_pull) #change_numbers_letters(scene_to_pull) 
		#8: 
			##print(" multi tasking, lets find out why we do rea rae 8")
			##print(" return_string")
			##return_string_from_keyboards()
			#var return_string_from_keyboards : String = "return_string_from_keyboards"
			##create_new_task("return_string_from_keyboards", return_string_from_keyboards)
		#9: 
			##print(" multi tasking, lets find out why we do rea rae 9")
			##print(" undo_char")
			##var undo_char : String = "undo_char"
			##create_new_task("undo_a_character", undo_char)
			#var function_name_to_call : String = "handle_backspace"
			#var node_to_get : String = "keyboard_container/thing_24"
			#var name_of_action : String = "call_function_single_get_node"
			#main_node.sixth_dimensional_magic(name_of_action, node_to_get, function_name_to_call)
		#10: 
			#print(" multi tasking, lets find out why we do rea rae 10")
			##print(" load_file ?" , interaction_to_do_now , " scene_to_pull : " , scene_to_pull)
			##initialize_loading_file(scene_to_pull, interaction_to_do_now)

# here we unlock mutexes?


	#if number_of_possible_interactions == current_number_of_inter:
		##print(" check_possible_interactions we would return some array i guess")
		##print(" array_of_things check possible : ", array_of_things)
		#return array_of_things


func check_possible_interactions_old(thing):
	
	interactions_mutex.lock()
	var size_of_inter_array = Interactions_array.size() 
	interactions_mutex.unlock()
	
	if size_of_inter_array < number_of_scene:
		return
	
	
	var scene_things: Array = []
	var counter_of_interaction_checked : int = 0
	var counter_for_array : int = -1
	var counter = -1
	var first_interaction
	var second_interaction
	var third_interaction
	var fourth_interaction
	var fifth_interaction
	var sixth_interaction
	var interaction_to_do_now
	var scene_to_pull
	var second_scene_to_pull
	var third_scene_to_pull
	var fourth_scene_to_pull
	var array_of_things
	var number_of_possible_interactions
	var current_number_of_inter
	
	interactions_mutex.lock()
	var current_possible_interaction = Interactions_array[number_of_scene]
	var interactions_copy = Interactions_array.duplicate(true)
	interactions_mutex.unlock()
	
	var possible_interaction = current_possible_interaction[1][0][1][0]
	
	
	# here we start mutexes? scenes array, interactions array and things dictionary?
	
	
	for posib_inter in interactions_copy:
		if counter_of_interaction_checked == maximum_amount_of_interaction:
			break
		var inter_ar_siz = posib_inter[1][0].size()
		if inter_ar_siz > 2:
			scene_to_pull = posib_inter[1][0][2][0]
		if inter_ar_siz > 3:
			first_interaction = posib_inter[1][0][3][0]
		if inter_ar_siz > 4:
			second_interaction = posib_inter[1][0][4][0]
		if inter_ar_siz > 5:
			third_interaction = posib_inter[1][0][5][0]
		if inter_ar_siz > 6:
			fourth_interaction = posib_inter[1][0][6][0]
		if inter_ar_siz > 7:
			fifth_interaction = posib_inter[1][0][7][0]
		if inter_ar_siz > 8:
			sixth_interaction = posib_inter[1][0][8][0]
		var thing_name_to_interact = posib_inter[1][0][1][0]
		var from_that_scene_we_can_go = posib_inter[0][0]
		
		if thing == thing_name_to_interact and from_that_scene_we_can_go == current_scene:
			print(" lets check multi tasking thingies " , thing , " , " , thing_name_to_interact , " , " , from_that_scene_we_can_go , "  ,  " , current_scene)
			print("posib_inter ", posib_inter)
			counter_of_interaction_checked +=1
			number_of_possible_interactions = int(posib_inter[3])
			for interaction in number_of_possible_interactions :
				current_number_of_inter = interaction + 1
				var check_size_of_posib_inter = posib_inter[2].size()
				if counter_for_array + 1 < number_of_possible_interactions:
					counter_for_array +=1
				var name_of_interaction
				if posib_inter[2].size() > 1:
					name_of_interaction = posib_inter[2][counter_for_array][0]
				else:
					name_of_interaction = posib_inter[2][0][0]
				for i in ActionsBank.type_of_interactions_0:
					counter +=1
					#print(" counter : " ,counter)
					if name_of_interaction == i:
						#print(" check_possible_interactions i guess we got somewhere?")
						break
					else:
						continue
				match counter_for_array:
					0: # interaction one
						interaction_to_do_now = scene_to_pull
					1:
						interaction_to_do_now = first_interaction
					2:
						interaction_to_do_now = second_interaction
					3:
						interaction_to_do_now = third_interaction
					4:
						interaction_to_do_now = fourth_interaction
					5:
						interaction_to_do_now = fifth_interaction
					6:
						interaction_to_do_now = sixth_interaction
				match counter:
					0: 
						#print(" counter ", counter)
						#print(" multi tasking, lets find out why we do rea rae 0, ", scene_things)
						var scene_to_set : int = int(posib_inter[1][0][3][0])
						#print(" move things around " , scene_to_set)
						#scene_things = 
						move_things_around(scene_to_set)
						#print("scene_things :" , scene_things)
						#array_of_things = check_things_in_scene(scene_things)
						counter = -1
					1: 
						#print(" counter ", counter , " and " , counter_for_array)
						#print(" multi tasking, lets find out why we do rea rae 1")
						var current_interaction_to_do
						match counter_for_array:
							0: 
								current_interaction_to_do = scene_to_pull
							1:
								current_interaction_to_do = first_interaction
							2:
								current_interaction_to_do = second_interaction
							3:
								current_interaction_to_do = third_interaction
							4:
								current_interaction_to_do = fourth_interaction
							5:
								current_interaction_to_do = fifth_interaction
							6:
								current_interaction_to_do = sixth_interaction
						#var container = self.get_parent()
						#var main_script = container.get_parent()
						#print(" are we even calling here ?")
						main_node.create_new_task("three_stages_of_creation", current_interaction_to_do)
						# maybe lets try to create a task
						counter = -1
					2: 
						#print(" multi tasking, lets find out why we do rea rae 2")
						counter = -1
					3: #
						#print(" multi tasking, lets find out why we do rea rae 3")
						counter = -1
					4: 
						#print(" multi tasking, lets find out why we do rea rae 4")
						var current_interaction_to_do
						match counter_for_array:
							0:
								current_interaction_to_do = first_interaction
							1:
								current_interaction_to_do = second_interaction
							2:
								current_interaction_to_do = third_interaction
							3:
								current_interaction_to_do = fourth_interaction
							4:
								current_interaction_to_do = fifth_interaction
							5:
								current_interaction_to_do = sixth_interaction
						var container_name = current_interaction_to_do
						var send_type_of_unload = "container"
						main_node.fifth_dimensional_magic(send_type_of_unload, container_name)
						#print(" probably this one for unloading containers? : " , current_interaction_to_do)
						counter = -1
						#var container_node = get_parent()
						#var parent_node = container_node.get_parent()
						#if parent_node:
						#	for child in parent_node.get_children():
						#		if child.name == container_name:
									#var two_things : Array = []
									#two_things.clear()
									#two_things.append(name_of_interaction)
									#two_things.append(current_interaction_to_do)
									#array_of_things[1].append(two_things)
									#break
								#else:
									#print(" check_possible_interactions 5 Sibling node with name does not exist: ", container_name, " also parent_node :" , parent_node)
							#counter = -1
						#else:
							#print(" check_possible_interactions 5 Parent node does not exist!")
					5: 
						#print(" multi tasking, lets find out why we do rea rae 5")
						#print(" i think we would start writing maybe hehe " , scene_to_pull,  " , ", self.name)
						counter = -1
						#var keyboard_bracet_node = main_node.get_node("keyboard_container/thing_24")
						#if !keyboard_bracet_node:
							#keyboard_bracet_node = await try_get_node("keyboard_container/thing_24", main_node)
						#if keyboard_bracet_node:
							
							#print( " i think we would start writing maybe hehe keyboard_bracet_node :  ", keyboard_bracet_node)
							#keyboard_bracet_node.handle_key_press(scene_to_pull)
						#create_new_task("write_on_keyboard", scene_to_pull)
						
						# "thing_24"
						# "thing_24"
						var name_of_action : String = "call_function_get_node"
						var node_to_get : String = "keyboard_container/thing_24"
						var name_of_the_function : String = "handle_key_press"
						main_node.sixth_dimensional_magic(name_of_action, node_to_get, name_of_the_function, scene_to_pull)
						
						#create_new_task(name_of_the_function, scene_to_pull)
					6: 
						#print(" multi tasking, lets find out why we do rea rae 6")
						print(" parallel reality shift keyboard ", posib_inter[1][0][2][0])
						var name_of_action : String = "move_things_around"
						var node_to_get_0 : String = "keyboard_left_container/thing_34"
						var node_to_get_1 : String = "keyboard_right_container/thing_53"
						var array_of_nodes : Array = []
						array_of_nodes.append(node_to_get_0)
						array_of_nodes.append(node_to_get_1)
						var type_of_action : String = "get_nodes_call_function"
						var data_to_send = int(posib_inter[1][0][2][0])
						main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
						#create_new_task("shift_keyboard", scene_to_pull)# shift_keyboard(scene_to_pull)
					7: 
						#print(" multi tasking, lets find out why we do rea rae 7")
						print(" parallel reality numbers / letters ", posib_inter[1][0][2][0]) 
						var name_of_action : String = "move_things_around"
						var node_to_get_0 : String = "keyboard_left_container/thing_34"
						var node_to_get_1 : String = "keyboard_right_container/thing_53"
						var array_of_nodes : Array = []
						array_of_nodes.append(node_to_get_0)
						array_of_nodes.append(node_to_get_1)
						var type_of_action : String = "get_nodes_call_function"
						var data_to_send = int(posib_inter[1][0][2][0])
						main_node.sixth_dimensional_magic(type_of_action, array_of_nodes, name_of_action, data_to_send)
						#create_new_task("change_numbers_letters", scene_to_pull) #change_numbers_letters(scene_to_pull) 
					8: 
						#print(" multi tasking, lets find out why we do rea rae 8")
						#print(" return_string")
						#return_string_from_keyboards()
						var return_string_from_keyboards : String = "return_string_from_keyboards"
						#create_new_task("return_string_from_keyboards", return_string_from_keyboards)
					9: 
						#print(" multi tasking, lets find out why we do rea rae 9")
						#print(" undo_char")
						#var undo_char : String = "undo_char"
						#create_new_task("undo_a_character", undo_char)
						var function_name_to_call : String = "handle_backspace"
						var node_to_get : String = "keyboard_container/thing_24"
						var name_of_action : String = "call_function_single_get_node"
						main_node.sixth_dimensional_magic(name_of_action, node_to_get, function_name_to_call)
					10: 
						print(" multi tasking, lets find out why we do rea rae 10")
						#print(" load_file ?" , interaction_to_do_now , " scene_to_pull : " , scene_to_pull)
						#initialize_loading_file(scene_to_pull, interaction_to_do_now)

# here we unlock mutexes?


	if number_of_possible_interactions == current_number_of_inter:
		#print(" check_possible_interactions we would return some array i guess")
		#print(" array_of_things check possible : ", array_of_things)
		return array_of_things


####################
# JSH Multi Threads
func create_new_task(function_name: String, data):
	# lets send it first to our tasker
	var new_data_way = str(data)
	# if data is array, if is string, if is int
	var task_tag = function_name + "|" + new_data_way + "|" + str(Time.get_ticks_msec())
	# now we got three different things to check
	## new_task_appeared(task_id, function_called, data_send_to_function)
	task_manager.new_task_appeared(task_tag, function_name, data)
	
	thread_pool.submit_task(self, function_name, data, task_tag)
####################


####################
# JSH Multi Threads
func create_new_task_empty(function_name: String):
	# lets send it first to our tasker
	var new_data_way = "empty"
	# if data is array, if is string, if is int
	var task_tag = function_name + "|" + new_data_way + "|" + str(Time.get_ticks_msec())
	# now we got three different things to check
	## new_task_appeared(task_id, function_called, data_send_to_function)
	task_manager.new_task_appeared(task_tag, function_name, new_data_way)
	#thread_pool.submit_task(self, function_name, data, task_tag)
	thread_pool.submit_task_unparameterized(self, function_name, task_tag)
####################

func move_things_around(scene_number: int):

	#await main_node.get_tree().process_frame
	#print(" move_things_around scene_number : ", scene_number, self.name)
	#main_node.await_for_signal()
#
	var counter_of_what_to_move : int = 0
	var counter_of_what_we_moved : int = 0
#
	scenes_mutex.lock()
	var scen_siz = Scenes_array.size()
	var scenes_copy = Scenes_array.duplicate(true)
	scenes_mutex.unlock()
	#
	var scene_things: Array = []
	#
	var scene_to_set
#
	for available_scenes in scenes_copy:
#
		var scene_number_to_find = available_scenes[0][0][0].split("_")
		#print( " available_scenes : " , available_scenes , " and that ? " , scene_number_to_find)
		if scene_number == int(scene_number_to_find[1][0]):
#
			scene_to_set = available_scenes
			
	#print(" the scene we set now : " , scene_to_set)
	if scene_to_set:
		for scene_test in scene_to_set[1]:
			counter_of_what_to_move +=1
	#
			if scene_test.size() < 3 or scene_test[0].is_empty():
				continue
			var lets_get_path = str(self.get_path())
			var splitter_path = lets_get_path.split("/")
			var new_name_scene = splitter_path[3] + "/" + scene_test[1][0]
	#
			scene_things.append(scene_test[1][0])
	#
			var new_position = Vector3(
				float(scene_test[2][0]),
				float(scene_test[2][1]),
				float(scene_test[2][2])
			)
			things_dictionary.lock()
			if is_instance_valid(datapoint_things_dictionary[scene_test[1][0]]["node"]):
				#print(" i guess that node exist?")
				var type_of_stuff : String = "move"
				main_node.the_fourth_dimensional_magic(type_of_stuff, datapoint_things_dictionary[scene_test[1][0]]["node"], new_position)
				#datapoint_things_dictionary[scene_test[1][0]]["node"].position = new_position
				things_dictionary.unlock()
			else:
				things_dictionary.unlock()
				print(" we must add another node to the tree ")

			if scene_test.size() > 3:
				things_dictionary.lock()
				if is_instance_valid(datapoint_things_dictionary[scene_test[1][0]]["node"]):
					#print(" for changing text stuff?")
					var type_of_stuff : String = "write"
					var data_to_write = scene_test[3][0]
					main_node.the_fourth_dimensional_magic(type_of_stuff, datapoint_things_dictionary[scene_test[1][0]]["node"], data_to_write)

					things_dictionary.unlock()
				else:
					things_dictionary.unlock()
					print(" we must add another node to the tree ")
	#					break
		current_scene = "scene_" + str(scene_number)
		number_of_scene = scene_number
		prepare_data_for_unloading(scene_things)
		check_multi_stuff(scene_number)
		print(" so lets make new version, of that unloading nodes now : " , scene_things)
		if times_of_data_used == 1:
			change_dual_text()
		#return scene_things
	if movement_checker == 0:
		movement_checker = 1
		var number_of_actions : int = 1
		var change_visibilty : String = "change_visibilty"
		var container_name  = self.get_parent()
		var container_path = container_name.get_path()
		main_node.seventh_dimensional_magic(change_visibilty, container_path, number_of_actions)
		## lets call main node, that first movement was there, and we can do stuff, like change visibility of construct, to visible :) as it was organised already


#func move_things_around1(scene_number: int):
	#
	#print(" the await two point o stuff move things around 0 " , datapoint_things_dictionary)
#
	##print(" move things around ? 0 ", main_node)
#
	#main_node.await_for_signal()
	#main_node.await_for_signal()
	#main_node.await_for_signal()
	##await main_node.get_tree().process_frame
	#
	#print(" the await two point o stuff move things around 0.1 " , datapoint_things_dictionary)
	## Get scene data safely
	#scenes_mutex.lock()
	#var scenes_copy = Scenes_array.duplicate(true)
	#scenes_mutex.unlock()
#
	## Find target scene
	#var scene_to_set = scenes_copy.filter(func(s): 
		#return int(s[0][0][0].split("_")[1][0]) == scene_number
	#)[0]
#
	##print(" move things around ? 1 ")
	##print(" scene_to_set " , scene_to_set)
	## Pre-validate nodes and cache data
	#things_dictionary.lock()
	#var valid_nodes = {}
	#for item in scene_to_set[1]:
		#var node_key = item[1][0]
		#if datapoint_things_dictionary.has(node_key):
			#var node_data = datapoint_things_dictionary[node_key]
			#if is_instance_valid(node_data.get("node")):
				#valid_nodes[node_key] = node_data["node"]
	#things_dictionary.unlock()
	#print(" the await two point o stuff move things around 1 ")
	##print(" move things around ? 2 ")
	## Update positions and text without holding locks
	#var scene_things = []
	#for scene_test in scene_to_set[1]:
		#if scene_test.size() < 3 or scene_test[0].is_empty():
			#continue
			#
		#scene_things.append(scene_test)
		#var node_key = scene_test[1][0]
		#
		#if valid_nodes.has(node_key):
			#var node = valid_nodes[node_key]
			#node.position = Vector3(
				#float(scene_test[2][0]),
				#float(scene_test[2][1]), 
				#float(scene_test[2][2])
			#)
			#
			#if scene_test.size() > 3:
				#for child in node.get_children():
					#if child is Label3D:
						#child.text = scene_test[3][0]
						#break
	#print(" the await two point o stuff move things around 2")
	#current_scene = "scene_" + str(scene_number)
	#number_of_scene = scene_number
	##print(" move things around ? 3 ")
	#return scene_things
# after interaction, we move thing, and check what shall remain

var multi_checker : Array = []

func check_multi_stuff(scene_number):

	
	if current_interaction_mode == "multi":
		
		scenes_mutex.lock()
		var current_scenes_size = scenes_array_size_now
		scenes_mutex.unlock()
		
		if multi_checker.size() < current_scenes_size:
			multi_checker.append(scene_number)
			if multi_checker.size() < scene_number + 1:
				print(" it should mean that we must move things around again, from 0 to current number maybe? ")
				var current_possibility : int = 0
				mutex_for_three_thingies.lock()
				if the_new_layers_fiasco == 0 and the_scenes_fiasco == 0 and third_inty_thingy == 0:
					current_possibility = 1
				mutex_for_three_thingies.unlock()
				
				if current_possibility == 1:
					for i in range(scene_number):
						move_things_around(i)
				#print("Loop iteration:", i)
				#var all_complete = false
				#mutex_for_three_thingies.lock()
				#all_complete = (the_new_layers_fiasco == 0 and 
							   #the_scenes_fiasco == 0 and 
							   #third_inty_thingy == 0)
				#mutex_for_three_thingies.unlock()
	#mutex_for_three_thingies.lock()
	#if third_inty_thingy == 0:
		#third_inty_thingy = 1
	#
	#if the_new_layers_fiasco == 1 and the_scenes_fiasco == 1 and third_inty_thingy == 1:
		#if scenes_array_size_now >= main_scene_to_set  + 1:
			#the_new_layers_fiasco = 0
			#the_scenes_fiasco = 0
			#third_inty_thingy = 0
			#print(" upload scene frames testingg 3 ", self.name)
			#move_things_around(main_scene_to_set)
	#mutex_for_three_thingies.unlock()

func prepare_data_for_unloading(scene_stuff):
	#print()
	
	if current_interaction_mode == "duplicate":
		print(" kinda like multi, different containers? instead of different things name, dman ")
		#it will be easier than i thought
		# it is creating itself, it lives in me
		# we drewam in it
		# one day we will duplicate
		# lol
		
	elif current_interaction_mode == "multi":
		print(" god doesnt know what to put here, but we have it already, just in case ")
		## i guess here we could do some trickery?
		# but now i need to see my menu again
		# where are you perfect settings file
		# just visualisation
		# will make it appear again
		# even now
		# no glasses needed
		# goodnight
	
	
	# oh also the eden carmagedon ancient home cinema
	# the best god mode there ever is
	# even exploding and becoming a plasmoid
	# abducting the neareset being that is not annoying
	# and contrilling thse copies
	# to continue this fantastic production
	# is all that it takes to maybe not explode planet eaerth
	# or tonight, but who knows what happens in dreams
	# ask the ones spleeping, i am working now ,con
	# gn
	
	elif current_interaction_mode == "single":
		# interaction check mode 
		
		# "single"
		
		
		var container_path_currently : String
		var current_action_to_do : String = "just_node"
		var keys_to_erase : Array = []
		
		things_dictionary.lock()
		container_path_currently = datapoint_things_dictionary["metadata"]["container_path"]
		#print(" datapoint_things_dictionary ", datapoint_things_dictionary["metadata"])
		if datapoint_things_dictionary["metadata"]["container_path"] == "akashic_records":
			#print(" i guess it is the main one")
			var line_thingy : String = "thing_3"
			scene_stuff.append(line_thingy)
			var jsh_textmesh : String = "thing_4"
			scene_stuff.append(jsh_textmesh)
			scene_stuff.append(datapoint_things_dictionary["metadata"]["datapoint_name"])
		else:
			scene_stuff.append(datapoint_things_dictionary["metadata"]["datapoint_name"])
		
		for thingy in datapoint_things_dictionary:
			if thingy != "metadata":
				var thingy_checker : int = 0
				#print("thingy " , thingy)
				for thingy_0 in scene_stuff:
					if thingy_0 == thingy:
						thingy_checker = 1
				if thingy_checker == 0:
				#	print(" i guess these thingies are to remain")
				#else:
					#print(" i guess these ones are to be unloaded")
					var path_of_thingy : String = container_path_currently + "/" + thingy
					main_node.fifth_dimensional_magic(current_action_to_do, path_of_thingy)
					keys_to_erase.append(thingy)
					datapoint_things_dictionary[thingy]["node"] = null
				
		things_dictionary.unlock()


func check_things_in_scene(scene_we_wanna) -> Array:
	
	var data_point_name_thingy : String = self.name
	var data_point_path = self.get_parent()
	var list_of_things_that_shall_remain : Array = []
	list_of_things_that_shall_remain.clear
	list_of_things_that_shall_remain.append([data_point_path])# data_point_path
	list_of_things_that_shall_remain.append([data_point_name_thingy])
	list_of_things_that_shall_remain.append(["thing_3"])
	list_of_things_that_shall_remain.append(["thing_4"])
	
	
	for thing_to_leave in scene_we_wanna:
		#print(" scenes we wanna : " , thing_to_leave[1])
		var thing_that_is_in_scene = thing_to_leave[1]
		list_of_things_that_shall_remain.append(thing_that_is_in_scene)
	return [[list_of_things_that_shall_remain], []]
	


func scene_to_set_number_later(number_int_eh):
	#print(" the await two point o stuff  main scene set")
	main_scene_to_set = number_int_eh
	
	
	mutex_for_three_thingies.lock()
	if third_inty_thingy == 0:
		third_inty_thingy = 1
	
	if the_new_layers_fiasco == 1 and the_scenes_fiasco == 1 and third_inty_thingy == 1:
		if scenes_array_size_now >= main_scene_to_set  + 1:
			the_new_layers_fiasco = 0
			the_scenes_fiasco = 0
			third_inty_thingy = 0
			print(" upload scene frames testingg 3 ", self.name)
			move_things_around(main_scene_to_set)
	mutex_for_three_thingies.unlock()

func set_maximum_interaction_number(mode : String, amount : int):
	#print(" the await two point o stuff  mnax inter num")
	#print("the multi tasking testing : so we are setting thingies! mode : " , mode , " amount : " , amount)
	maximum_amount_of_interaction = amount
	current_interaction_mode = mode
