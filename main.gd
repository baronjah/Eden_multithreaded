# main.gd
# root/main
#, main node, main_root, main.gd, scripts/main.gd

####################
#
# JSH Ethereal Engine
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓    •      ┏┓        
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                          ┛          ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine
#
####################

####################
# JSH Ethereal Engine
extends Node3D
####################


# signals
####################
# JSH Ethereal Engine
signal main_node_signal(place)
####################

# scripts
# i guess i will add more scripts here too?
####################
# JSH Ethereal Engine
const DataPointScript = preload("res://scripts/data_point.gd")
const ContainterScript = preload("res://scripts/containter.gd")
const LineScript = preload("res://scripts/line.gd")
####################

# catching nodes
# need to add every node of core compotent to it
####################
# JSH Ethereal Engine
@onready var data_splitter = get_node("JSH_data_splitter")
# why this one is cash money?
@onready var task_manager = $JSH_task_manager
# ones on the scene already
@onready var JSH_records_system = get_node("JSH_records_system")
# thread manager with basic stats
@onready var JSH_Threads = get_node("JSH_ThreadPool_Manager")
# check system
@onready var JSH_system_check = get_node("system_check")

# autoload ones
@onready var thread_pool = get_node("/root/thread_pool_autoload")
####################


# getting class files
# need to add every class file, and normalize the way to get to it
####################
# JSH Ethereal Engine
var timer_system: GodotTimersSystem
####################
# the idea was simple, databases of consts
# metadatas files

####################
# JSH Ethereal Engine
# dictionaries loose
var test_results: Dictionary = {}
var download_received : Dictionary = {}
var upload_to_send : Dictionary = {}
var cache_timestamps: Dictionary = {}
var task_timeouts: Dictionary = {}
var task_timestamps: Dictionary = {}
var task_status: Dictionary = {}
####################

####################
# JSH Ethereal Engine
# arrays loose
var first_run_prints : Array = []
var first_run_numbers : Array = []
var init_array : Array = []
var init_array_int : Array = []
var blimp_of_time : Array = []
var previous_blimp_of_time : Array = []
var past_deltas_memories : Array = []
var stored_delta_memory : Array = []
var array_of_startup_check : Array = []
var check_settings_data : Array = []
var array_with_no_mutex : Array = []
var available_directiories : Array = []
var curent_queue : Array = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
####################

####################
# JSH Ethereal Engine
# ints loose
var int_of_stuff_started : int = 0
var int_of_stuff_finished : int = 0
var turn_number_process : int = 0
var delta_turn_0 : int = 0
var max_cache_size_mb: int = 8
# this is for process turn 6, if something goes wrong, we check it?
var some_kind_of_issue : int = 0
# add basic sets, just once
var just_one_try : int = 0
####################

####################
# JSH Ethereal Engine
# floats?
var ray_distance_set = 20.0
####################

####################
# JSH Ethereal Engine
# strings loose
var first_start_check : String = "pending"
var path = "D:/Eden"
####################

####################
# JSH Ethereal Engine
# boleans? booleans? bool? the true and false thingies
var directory_existence = false
var folders_existence = false
var files_existence = false
var fsc_status = null
var fdc_status = null
var ftc_status = null
####################

####################
# JSH Ethereal Engine
# vars without specified type
var current_operational_system
var file_path
var files_content
var folders_content
var viewport
var mouse_pos
var camera
var max_task_duration = 50000
var message_of_delta_start
var scan_result
var creation_can_happen
var mistakes_of_past
var deletion_process_can_happen
var movement_possible
var edit_possible
####################

####################
# JSH Ethereal Engine
# combo with mutexes, arrays, dictionaries, ints
# the active and cached data, for creation, recreation etc
var active_record_sets: Dictionary = {}
var active_r_s_mut = Mutex.new()

# cached records sets
var cached_record_sets: Dictionary = {}
var cached_r_s_mutex = Mutex.new()

# current state of set, being created, its name as string
var list_of_sets_to_create : Array = []
var array_mutex_process = Mutex.new()

# data to be put for my eyes
var max_nodes_added_per_cycle : int = 369
var nodes_to_be_added_int : int = 0
var nodes_to_be_added : Array = []
var mutex_nodes_to_be_added = Mutex.new()

# second impact of creation data
var max_data_send_per_cycle : int = 369
var data_to_be_send : Array = []
var mutex_data_to_send = Mutex.new()

## the way to store that data, we are sending
var data_that_is_send : Dictionary = {}
var data_sending_mutex = Mutex.new()

## lets also cache that data :)
var data_that_was_send : Dictionary = {}
var data_send_mutex = Mutex.new()


# moving and rotating things
var max_movements_per_cycle : int = 369
var things_to_be_moved : Array = []
var movmentes_mutex = Mutex.new()

# the unloading stuff
var max_nodes_to_unload_per_cycle : int = 369
var nodes_to_be_unloaded : Array = []
var mutex_for_unloading_nodes = Mutex.new()

# the function caller from main thread
var max_functions_called_per_cycle : int = 369
var functions_to_be_called : Array = []
var mutex_function_call = Mutex.new()

# to get missing nodes, add more containers like singular lines
var max_additionals_per_cycle : int = 369
var additionals_to_be_called : Array = []
var mutex_additionals_call = Mutex.new()

# first turn of doing stuff
var max_actions_per_cycle : int = 369
var actions_to_be_called : Array = []
var mutex_actions = Mutex.new()

# messahe to be send between datapoints
var max_messages_per_cycle : int = 369
var messages_to_be_called : Array = []
var mutex_messages_call = Mutex.new()

# the godot tree, didnt respect my needs, made my own, even signed it
var scene_tree_jsh : Dictionary = {}
var tree_mutex = Mutex.new()

# cached tree
var cached_jsh_tree_branches : Dictionary = {}
var cached_tree_mutex = Mutex.new()

# here i wanted to pull errors, that happened, somehow, somewhere
var dictionary_of_mistakes : Dictionary = {}
var dictionary_of_mistakes_mutex = Mutex.new()


# dunno, we checked if it was changed, we dont use it anymore, i think, before we needed that for while loop of thread, that could break
var the_menace_checker : int = 0
var menace_mutex = Mutex.new()

# what was this one for, was it the main things being send to container datapoint, with numbers counting stuff
var array_for_counting_finish : Dictionary = {}
var array_counting_mutex = Mutex.new()

# hmm, i think it is like records sets status? similar to containers
var current_containers_state : Dictionary = {}
var mutex_for_container_state = Mutex.new()

# the queue of stuff to be unloaded
var unload_queue : Dictionary = {}
var unload_queue_mutex = Mutex.new()

# the queue of stuff to be loaded
var load_queue : Dictionary = {}
var load_queue_mutex = Mutex.new()

# the menace checker, when set is being added to the list, we also change it, into 1, so something was being created
var menace_tricker_checker : int = -2
var mutex_for_trickery = Mutex.new()

# the list of containers, what are right now loaded, were loaded
var list_of_containers : Dictionary = {}
var mutex_containers = Mutex.new()

# this one was put in one place for something
# it was queue pusher adder
var mutex_singular_l_u = Mutex.new()
####################

####################
# JSH Ethereal Engine
# the last hope to figure out, why a task failed, was started, but didnt quite get anywhere?
# a new jewish hope, for new process frame intel
#signal frame_processed
#var frame_signal_connected := false
# the files, directiories, folders, spaces, places, data
# the scripts, that we apply to datapoints, containers, line for clicky
# the ready stuff, first container, akashic_records and ray thingy stuff screen, mouse lol
# the delta idea of turns and moves, so we always have it easy as we spread the tasks
# that one is supposed to be free array, with no mutex needed
# the godly messengers with data, getting them download, and even uploading information
# like C and D on windows, so drives, maybe some /home or whatever others use
#var first_run_check_string : String = ""
####################

# metadata consts type stuff, to be moved, to their files
# interpretors? consts, enums, lists stuff
# enums
####################
# JSH Ethereal Engine
enum SystemState {
	UNKNOWN = -1,
	INACTIVE = 0,
	ACTIVE = 1,
	BUSY = 2,
	ERROR = 3
}

# Enum for possible creation states
enum CreationStatus {
	ERROR = -1,
	SUCCESS = 0,
	PENDING = 1,
	INVALID_INPUT = 2,
	LOCKED = 3
}

enum CreationState {
	INACTIVE = -1,
	POSSIBLE = 0,
	IN_PROGRESS = 1,
	LOCKED = 2,
	ERROR = 3
}

####################

# lists? just vars?
####################
# JSH Ethereal Engine
var status_symbol = {
	"active": "●",
	"pending": "○", 
	"disabled": "×"
}

# JSH Scene Tree
var tree_data = {
	"snapshot": "",  # For pretty-print style storage
	"structure": {}, # For node hierarchy
	"timestamp": 0,
	"node_count": 0
}


# Core system states that need mutex protection
var core_states := {
	"mutex": Mutex.new(),  # Single mutex for all core states
	"states": {
		"creation": SystemState.INACTIVE,
		"deletion": SystemState.INACTIVE,
		"movement": SystemState.INACTIVE,
		"edit": SystemState.INACTIVE
	}
}

# First-time checks (need mutex as they're initialization flags)
var initialization_states := {
	"mutex": Mutex.new(),
	"states": {
		"first_start": null,      # fsc_status
		"first_delta": null,      # fdc_status
		"first_task": null        # ftc_status
	}
}

# History tracking (needs mutex for concurrent access)
var history_tracking := {
	"mutex": Mutex.new(),
	"mistakes": [],  # mistakes_of_past
	"creation_history": [],
	"deletion_history": []
}

# Time tracking (needs mutex for concurrent updates)
var time_tracking := {
	"mutex": Mutex.new(),
	"delta_history": [],
	"godot_timers": {},
	"last_update": Time.get_ticks_msec()
}

# Add properties to track main script memory
var memory_metadata = {
	"arrays": {
		"blimp_of_time": [],
		"stored_delta_memory": [],
		"past_deltas_memories": [],
		"array_with_no_mutex": [],
		"list_of_sets_to_create": []
	},
	"dictionaries": {
		"active_record_sets": {},
		"cached_record_sets": {},
		"scene_tree_jsh": {},
		"current_containers_state": {},
		"dictionary_of_mistakes": {}
	},
	"last_cleanup": Time.get_ticks_msec(),
	"cleanup_thresholds": {
		"array_max": 1000,  # Max array entries
		"dict_max_mb": 50,  # Max dictionary size in MB
		"time_between_cleanups": 30000  # 30 seconds
	}
}


##
## hopefully last addition to the core stuff
##

var system_states = {
	"creation": {
		"mutex": Mutex.new(),
		"state": SystemState.INACTIVE,
		"pending_sets": [],
		"active_sets": []
	}
}

# Core Systems State Tracking
var system_states_0 := {
	"mutex": Mutex.new(),
	"core_systems": {
		"system_check": {
			"node": null,
			"ready": false,
			"last_verified": 0
		},
		"timers": {
			"node": null,
			"ready": false,
			"last_verified": 0
		},
		"tree": {
			"node": null,
			"ready": false,
			"last_verified": 0
		},
		"records": {
			"node": null,
			"ready": false,
			"last_verified": 0
		},
		# etc for all systems
	}
}

# System Verification Data
var verification_data := {
	"mutex": Mutex.new(),
	"current_phase": 0,
	"phases": {
		0: "system_initialization",
		1: "node_verification", 
		2: "script_connections",
		3: "mutex_verification",
		4: "memory_check",
		5: "final_verification"
	},
	"logs": [],
	"errors": []
}


var system_readiness = {
	"mutexes": false,
	"threads": false,
	"records": false
}

## Add tracking variables
#var system_states = {
	#"creation": {
		#"mutex": Mutex.new(),
		#"can_create": false,
		#"pending_sets": [],
		#"active_sets": []
	#},
	#"movement": {
		#"mutex": Mutex.new(),
		#"can_move": false,
		#"pending_moves": []
	#},
	#"deletion": {
		#"mutex": Mutex.new(),
		#"can_delete": false,
		#"pending_deletions": []
	#}
#}

var system_checks = {
	"creation": "is_creation_possible",
	"movement": "movement_possible",
	"deletion": "deletion_process_can_happen"
}
####################








####################
#
# JSH Initialize Ethereal Engine
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳  • •  ┓•     ┏┓ ┓         ┓  ┏┓    •    
#       888  `"Y8888o.   888ooooo888     ┃┏┓┓╋┓┏┓┃┓┓┏┓  ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓
#       888      `"Y88b  888     888     ┻┛┗┗┗┗┗┻┗┗┗┗   ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗ 
#       888 oo     .d8P  888     888                                         ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Initialize Ethereal Engine
#
####################

####################
# JSH Initialize Ethereal Engine
func _init():
	#print(" new check of where we even went to 0 ")
	# 5 function, and one class used not from godot
	print("\n🌱 [INIT] Starting initialization...\n")
	print(" main.gd print tree pretty init ")
	print_tree_pretty()
	print(" main.gd print tree pretty should end here")
	####################
	## [0] = threads status
	####################
	var status_threads_int = -1
	var status_threads = check_status_just_timer()
	if status_threads:
		status_threads_int = 1
	else:
		status_threads_int = 0
	init_array_int.append(status_threads_int)
	####################
	## [1] = prepare akashic records
	####################
	prepare_akashic_records_init()
	
	# Setup system checks for debugging
	####################
	## [2] = setup system checks
	####################
	setup_system_checks()
	# another split = setup_system_checks()
	print("\n✅ [INIT] Initialization complete. Waiting for _ready()...\n")
####################

####################
# JSH Initialize Ethereal Engine
func setup_system_checks():
	#print(" new check of where we even went to 1 ")
	system_readiness.mutexes = false
	system_readiness.threads = false
	system_readiness.records = false
####################



## NOT USED YET ANYWHERE
####################
# JSH Initialize Ethereal Engine
func test_init() -> Dictionary:
	#print(" new check of where we even went to 2 ")
	var init_status = {
		"system_check": validate_system_environment(),
		"stages": []
	}
	
	# Stage 1: System Environment
	var env_status = validate_system_environment()
	init_status.stages.append(["environment", env_status])
	
	# Stage 2: Thread Pool
	var thread_status = validate_thread_system() 
	init_status.stages.append(["threads", thread_status])
	
	# Only proceed if threads are working
	if thread_status.status != "operational":
		retry_thread_initialization()
	
	return init_status
####################


####################
# JSH Initialize Ethereal Engine
func retry_thread_initialization():
	#print(" new check of where we even went to 3 ")
	print("blank")
####################


####################
# JSH Initialize Ethereal Engine
func validate_system_environment() -> Dictionary:
	#print(" new check of where we even went to 4 ")
	return {
		"os": OS.get_name(),
		"processor_count": OS.get_processor_count(),
		"vulkan_version": Engine.get_version_info()["vulkan"], # From your output: "Vulkan 1.3.277"
		"device_info": Engine.get_version_info()["video_adapter"], # "NVIDIA - Quadro RTX 3000"
		"timestamp": Time.get_ticks_msec()
	}
####################

####################
#
# JSH Start Ethereal Engine
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓        ┏┓ ┓         ┓  ┏┓    •    
#       888  `"Y8888o.   888ooooo888     ┗┓╋┏┓┏┓╋  ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓
#       888      `"Y88b  888     888     ┗┛┗┗┻┛ ┗  ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗ 
#       888 oo     .d8P  888     888                                    ┛     
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Start Ethereal Engine
#
####################



# informational arrays
####################
# JSH Ethereal Engine Start up

####################

#func _ready():
#	camera = get_viewport().get_camera_3d()
	#create_new_task("three_stages_of_creation", "base")
	#create_new_task("three_stages_of_creation", "menu")



# the ready function
####################
# JSH Start Ethereal Engine
func _ready():
	#print(" new check of where we even went to 5 ")
	print("\n🚀 [READY] Beginning full system setup...\n")
	# Conditional debugging
	####################
	## [0] = is it debug build
	####################
	var debug_build_info : int = -1
	var debug_build_name : String = "no build detected"
	if OS.is_debug_build():
		print("Scanning in debug mode, OS.is_debug_build()")
		debug_build_info = 1
		debug_build_name = "debug_build"

	else: 
		print(" os is not in debug build ")
		debug_build_info = 0
		debug_build_name = "normal_build"
	# first just ints
	first_run_numbers.append(debug_build_info)
	# now string data and other
	first_run_prints.append(debug_build_name)
	####################
	##
	##
	# Detect OS & environment
	####################
	## [1] = what system it is
	####################
	var os_int_fr : int = -1
	current_operational_system = OS.get_name()
	if current_operational_system:
		os_int_fr = 1
		first_run_prints.append(current_operational_system)
	else:
		os_int_fr = 0
		first_run_prints.append("error")
	# first just ints
	first_run_numbers.append(os_int_fr)
	print("🖥️ Running on:", current_operational_system)
	# now string data and other
	####################
	#
	####################
	## [2] = main.gd read lines
	####################
	# Load main script for structure analysis
	var main_file_state : int = -1
	var file = FileAccess.open("res://main.gd", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var structure = task_manager.parse_code_structure(content)
		task_manager.create_tasks_from_structure(structure)
		print(task_manager.generate_task_report())
		main_file_state = 1
		first_run_prints.append([content, structure])
	else:
		main_file_state = 0
		first_run_prints.append("error")
	# first just ints
	first_run_numbers.append(main_file_state)
	####################
	##
	##
	# 🔍 Scan all files & directories inside res://
	####################
	## [3] = res folder
	####################
	var res_scan_int : int = -1
	print("\n🔍 Scanning res:// directory...\n")
	var res_scan = scan_res_directory()
	print("\n✅ Scan Completed. Files & Directories Indexed.\n")
	if res_scan:
		res_scan_int = 1
		first_run_prints.append(res_scan)
	else:
		res_scan_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(res_scan_int)
	####################
	print(" maybe again")
	# Print the scene tree before changes
	print("\n🌳 Scene Tree Before Adjustments:")
	print_tree_pretty()
	####################
	## [4] = scene tree at launch
	####################
	var tree_state_int : int = -1
	var tree_state = capture_tree_state()
	if tree_state:
		tree_state_int = 1
		first_run_prints.append(tree_state)
	else:
		tree_state_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(tree_state_int)
	
	################# here we shall await for prints maybe??
	####################
	## [5] = Eden folder
	####################
	var eden_D = scan_eden_directory() # directory: String = "D:/Eden"
	var eden_d_i : int = -1
	#
	if eden_D:
		eden_d_i = 1
		first_run_prints.append(eden_D)
	else:
		eden_d_i = 0
		first_run_prints.append("error")
	first_run_numbers.append(eden_d_i)
	####################
	##
	##
	#
	####################
	## [6] Eden_Backup folder
	####################
	var eden_b_i : int = -1
	var eden_B = scan_eden_directory("D:/Eden_Backup") 
	#
	if eden_B:
		eden_b_i = 1
		first_run_prints.append(eden_B)
	else:
		eden_b_i = 0
		first_run_prints.append("error")
	first_run_numbers.append(eden_b_i)
	####################
	##
	#
	# Debug system state
	#####################
	### [7] = mutexes check
	#####################
	#message_of_delta_start = breaks_and_handles_check()
	#var delta_message_int : int = -1
	#if message_of_delta_start:
		#delta_message_int = 1
		#first_run_prints.append(message_of_delta_start)
	#else:
		#delta_message_int = 0
		#first_run_prints.append("error")
	#first_run_numbers.append(delta_message_int)
	#####################
	###
	
	
	####################
	## signals connection
	####################
	print("\n🔄 Delta System State:", message_of_delta_start)
	# Connect signals for task management
	##
	thread_pool.connect("task_discarded", func(task): 
		#print("❌ Task discarded:", task.tag)
		queue_pusher_adder(task)
		int_of_stuff_finished += 1
	)
	thread_pool.connect("task_started", func(task):
		#print("⏳ Task Started:", task)
		track_task_status(task)
		int_of_stuff_started += 1
	)
	####################
	##
	print("\n🎬 Starting Scene Setup...\n")
	# 📝 Load & Check Settings File
	
	##
	var threads_0 = check_status_just_timer()
	##
	
	##
	####################
	## [8] = settings file at start
	####################
	var settings_check_int : int = -1
	var settings_check = check_settings_file()
	if settings_check:
		settings_check_int = 1
		first_run_prints.append(settings_check)
	else:
		settings_check_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(settings_check_int)
	##
	# Setup Viewport & Camera
	##
	
	####################
	## mouse position at start, could break later
	####################
	mouse_pos = get_viewport().get_mouse_position()
	####################
	## [9] = camera node of viewport
	####################
	var camera_check_int : int = -1
	camera = get_viewport().get_camera_3d()
	if camera:
		camera_check_int = 1
		first_run_prints.append(camera)
	else:
		camera_check_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(camera_check_int)
	####################
	##
	
	####################
	## [10] = viewport
	####################
	var viewport_check_int : int = -1
	viewport = get_viewport()
	if viewport:
		viewport_check_int = 1
		first_run_prints.append(viewport)
	else:
		viewport_check_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(viewport_check_int)
	##
	
	# # threads_0, threads_1
	var threads_1 = check_status_just_timer()
	# 🚀 Start Scene Tree (Loading Components)
	
	####################
	## [11] = scene tree, check if we have branches
	####################
	start_up_scene_tree()
	var int_for_jsh_tree : int = -1
	var tree_jsh_status_start = check_tree_branches()
	if tree_jsh_status_start == true:
		int_for_jsh_tree = 1
		first_run_prints.append(tree_jsh_status_start)
	elif tree_jsh_status_start == false:
		int_for_jsh_tree = 0
		first_run_prints.append("just main root")
	elif tree_jsh_status_start == null:
		int_for_jsh_tree = -2
		first_run_prints.append("main root missing")
	else:
		int_for_jsh_tree = -3
		first_run_prints.append("fatal kurwa error")
	first_run_numbers.append(int_for_jsh_tree)
	##
	
	## # threads_0, threads_1, threads_2
	var threads_2 = check_status_just_timer()
	##
	#print("\n✅ Scene Setup Complete!\n")
	# Run Performance Tests
	print(" we gotta figure out the time stuff, clocks, watches, ticks and tacks")
	####################
	## [12] = timers system
	####################
	var timer_system_int : int = -1
	timer_system = GodotTimersSystem.new()
	if timer_system:
		add_child(timer_system)
		_setup_retry_timer()  # Fixed the underscore
		timer_system_int = 1
		first_run_prints.append(timer_system)
	else:
		timer_system_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(timer_system_int)
	##
	
	####################
	## [13] = thread status
	####################
	var thread_status_int : int = -1
	var threads_state = check_three_tries_for_threads(threads_0, threads_1, threads_2)
	if threads_state:
		thread_status_int = 1
		first_run_prints.append(threads_state)
	else:
		thread_status_int = 0
		first_run_prints.append("error")
	first_run_numbers.append(thread_status_int)
	##
	
	print("\n🛠️ Starting System Tests...\n")
	##
	####################
	## [14] = single core check
	####################
	test_single_core()
	##
	
	####################
	## [15] = multi threads check
	####################
	test_multi_threaded()
	##
	print("\n📝 Test Results:", test_results)
	# Connect to interval ticks
	timer_system.connect("interval_tick", Callable(self, "_on_interval_tick"))
	# new stuff, store things
	var target_directory = "D:/Eden_Backup/all scripts files 13.02.25"  # Define directory
	print("\n📂 Scanning directory: " + target_directory)
	var results = scan_directory_with_sizes(target_directory)
	
	# Store results in RAM
	#first_run_prints.append(results)  
	#first_run_numbers.append(1 if results["status"] == "completed" else 0)
	# not yet, lets first take  a look at them
	# Save results to ROM
	save_file_list_text(results, "D:/Eden/files/file_list.txt", target_directory)
	
	
####################

####################
#
# JSH Ethereal Engine tests
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓    •      ┏┳┓     
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓   ┃ ┏┓┏╋┏
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗    ┻ ┗ ┛┗┛
#       888 oo     .d8P  888     888                          ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine tests
#
####################

####################
# JSH Ethereal Engine tests
# The name # JSH Ethereal Engine tests suggests actual unit tests or runtime checks that verify if functions work correctly.
# The segment JSH Ethereal Engine tests suggests verifying functionality or running checks after the system is active.
####################

## THIS IS IN CORRECT PLACE
####################
# JSH Ethereal Engine tests
func check_system_function(check_name: String) -> bool:
	#print(" new check of where we even went to 6 ")
	match check_name:
		"creation": return is_creation_possible()
		"movement": return movement_possible
		"deletion": return deletion_process_can_happen
		_: return false
####################

####################
#
# JSH Ethereal Engine Repair
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓    •      ┳┓      •  
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓  ┣┫┏┓┏┓┏┓┓┏┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗   ┛┗┗ ┣┛┗┻┗┛ 
#       888 oo     .d8P  888     888                          ┛           ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine Repair
#
####################

####################
# JSH Ethereal Engine Repair
#MISSION : REPAIR CHECK ENGINE
#
#CONNECTED MISSIONS :
#
#### CORE FUNCTIONS
#CHECK ENGINE
#CHECK SINGLE_THREAD
#CHECK MULTI_THREADS
#CHECK TASK_SYSTEM
#CHECK CLOCKS_AND_WATCHES_SYSTEM
#CHECK OS
#CHECK DIRECTIORIES
#CHECK FOLDERS
#
#
#### LOAD DATA
#CHECK SETTINGS_FILE
#CHECK IF_IT_IS_FIRST_RUN
#CHECK IF_WE_HAVE_DATABASES_ACCESS
#### NOW WE EITHER CREATE FILES, REOPEN FILES, OPEN FILES, RESTART THE SYSTEM
#CHECK FILES
#
#### TO SEE ANYTHING
#CHECK LOAD_BASIC_RECORDS_SETS
#
#print(" scan_results " , scan_result)
#scan result of project files :
#scan_result
####################


####################
# JSH Ethereal Engine Repair
func log_error_state(error_type, details):
	#print(" new check of where we even went to 7 ")
	dictionary_of_mistakes_mutex.lock()
	
	if !dictionary_of_mistakes.has(error_type):
		dictionary_of_mistakes[error_type] = {
			"first_seen": Time.get_ticks_msec(),
			"count": 0,
			"instances": []
		}
	
	dictionary_of_mistakes[error_type]["count"] += 1
	dictionary_of_mistakes[error_type]["instances"].append({
		"time": Time.get_ticks_msec(),
		"details": details
	})
	
	# If error occurs frequently, trigger deep repair
	if dictionary_of_mistakes[error_type]["count"] > 5:
		trigger_deep_repair(error_type)
		
	dictionary_of_mistakes_mutex.unlock()
####################

####################
# JSH Ethereal Engine Repair
func start_health_checks():
	#print(" new check of where we even went to 8 ")
	while true:
		await get_tree().create_timer(5.0).timeout
		check_system_health()
####################

####################
# JSH Ethereal Engine Repair
func check_system_health():
	#print(" new check of where we even went to 9 ")
	# Check thread pool state
	if int_of_stuff_started > int_of_stuff_finished + 10:
		log_error_state("thread_pool_backlog", {
			"started": int_of_stuff_started,
			"finished": int_of_stuff_finished
		})
	
	# Check container states
	mutex_for_container_state.lock()
	for container in current_containers_state:
		if current_containers_state[container]["status"] == -1:
			validate_container_state(container)
	mutex_for_container_state.unlock()
####################


####################
# JSH Ethereal Engine Repair
func handle_random_errors(): # array_with_no_mutex
	#print(" new check of where we even went to 10 ")
	print(" elquadromadro trying to figure out random problems ")
	for current_error in array_with_no_mutex:
		print(" elquadromadro error to stick to something " , current_error)
		var name_of_error = current_error[0]
		var type_of_error = current_error[1]
		print(" elquadromadro error to stick to something " , name_of_error , " and " , type_of_error)
		dictionary_of_mistakes_mutex.lock()
		if dictionary_of_mistakes.has(name_of_error):
			# that one appeared before
			print(" elquadromadro we had issues with that one before ")
			if dictionary_of_mistakes[name_of_error].has(name_of_error):
				# we had this type of error before
				print(" elquadromadro the same error as we had previously ")
				if dictionary_of_mistakes[name_of_error][name_of_error].has(type_of_error):
					print(" elquadromadro the same type of the same error hmm ")
					# this same stage of error as before
		else:
			print(" elquadromadro that is a new trouble maker, why could it not work already ? ")
			dictionary_of_mistakes[name_of_error] = {}
			dictionary_of_mistakes[name_of_error]["status"] = "pending"
			dictionary_of_mistakes[name_of_error]["counter"] = int(1)
			
			dictionary_of_mistakes[name_of_error][name_of_error] = {}
			dictionary_of_mistakes[name_of_error][name_of_error]["status"] = "pending"
			dictionary_of_mistakes[name_of_error][name_of_error]["counter"] = int(1)
			
			dictionary_of_mistakes[name_of_error][name_of_error][type_of_error] = {}
			dictionary_of_mistakes[name_of_error][name_of_error][type_of_error]["status"] = "pending"
			dictionary_of_mistakes[name_of_error][name_of_error][type_of_error]["counter"] = int(1)
		
		print(" elquadromadro dictionary_of_mistakes_mutex : " , dictionary_of_mistakes_mutex)
		dictionary_of_mistakes_mutex.unlock()
####################


#######################
# JSH Ethereal Engine Repair
## Claude continuation
#######################



####################
# JSH Ethereal Engine Repair
func trigger_deep_repair(error_type: String):
	#print(" new check of where we even went to 11 ")
	print("Initiating deep repair for error type: ", error_type)
	
	dictionary_of_mistakes_mutex.lock()
	var error_data = dictionary_of_mistakes[error_type]
	dictionary_of_mistakes_mutex.unlock()
	
	match error_type:
		"thread_pool_backlog":
			# Reset thread counters and clear stuck tasks
			int_of_stuff_started = 0
			int_of_stuff_finished = 0
			
			# Recheck all container states
			mutex_for_container_state.lock()
			for container in current_containers_state.keys():
				current_containers_state[container]["status"] = -1  # Force recheck
			mutex_for_container_state.unlock()
			
			# Trigger container state checker
			mutex_for_trickery.lock()
			menace_tricker_checker = 1
			mutex_for_trickery.unlock()
		
		"node_missing":
			# Scan all containers for missing nodes
			tree_mutex.lock()
			for branch_name in scene_tree_jsh["main_root"]["branches"].keys():
				var branch = scene_tree_jsh["main_root"]["branches"][branch_name]
				
				# Check required nodes
				var missing = []
				if !branch.has("datapoint") or !branch["datapoint"].has("node"):
					missing.append("datapoint")
				if !branch.has("node") or !is_instance_valid(branch["node"]):
					missing.append("container")
				
				if missing.size() > 0:
					# Get records for reconstruction
					active_r_s_mut.lock()
					var records_set = branch_name.split("_")[0] + "_"
					if active_record_sets.has(records_set):
						var records = active_record_sets[records_set]
						for node_type in missing:
							recreate_node_from_records(branch_name, node_type, records)
					active_r_s_mut.unlock()
			tree_mutex.unlock()
		
		"container_state_mismatch":
			# Reset all container states and force revalidation
			mutex_for_container_state.lock()
			current_containers_state.clear()
			mutex_for_container_state.unlock()
			
			mutex_containers.lock()
			list_of_containers.clear()
			mutex_containers.unlock()
			
			# Force recheck of all active records
			active_r_s_mut.lock()
			for records_set in active_record_sets.keys():
				if active_record_sets[records_set].has("metadata"):
					active_record_sets[records_set]["metadata"]["container_count"] = 0
			active_r_s_mut.unlock()
			
			# Trigger full recheck
			containers_states_checker()
			containers_list_creator()
		
		_:
			print("Unknown error type for deep repair: ", error_type)
	
	# Clear error history after repair attempt
	dictionary_of_mistakes_mutex.lock()
	dictionary_of_mistakes[error_type]["count"] = 0
	dictionary_of_mistakes[error_type]["instances"].clear()
	dictionary_of_mistakes_mutex.unlock()
####################

# shish was broken so i made fake one lol
####################
# JSH Ethereal Engine Repair
func breaks_and_handles_check():
	return true
####################

####################
# JSH Ethereal Engine Repair
func breaks_and_handles_check_issue():# breaks_and_handles_check() reanimate_all_handles_and_breaks
	#print(" new check of where we even went to 12 ")
	print(" if this helps, then this helps ")
	#print()
	
	var current_state_mutexes : Array = []
	var negative_counter : int = -1
	var positive_counter : int = -1
	
	print("🔓 Checking & Unlocking stuck mutexes...")

	var mutex_list = [
		active_r_s_mut, cached_r_s_mutex, array_mutex_process, mutex_nodes_to_be_added, 
		mutex_data_to_send, movmentes_mutex, mutex_for_unloading_nodes, mutex_function_call, 
		mutex_additionals_call, mutex_messages_call, tree_mutex, cached_tree_mutex, 
		dictionary_of_mistakes_mutex, menace_mutex, array_counting_mutex, mutex_for_container_state, 
		unload_queue_mutex, load_queue_mutex, mutex_for_trickery, mutex_containers, 
		mutex_singular_l_u
	]

	for mutex in mutex_list:
		if mutex.try_lock():
			positive_counter +=1
			mutex.unlock()
		else:
			negative_counter +=1
			mutex.unlock()

	if negative_counter >= 0:
		return false
	else:
		return true
####################

####################
# JSH Ethereal Engine Repair
func unlock_stuck_mutexes():
	#print(" new check of where we even went to 13 ")
	print("🔓 Checking & Unlocking stuck mutexes...")

	var mutex_list = [
		active_r_s_mut, cached_r_s_mutex, tree_mutex, cached_tree_mutex, 
		mutex_nodes_to_be_added, mutex_data_to_send, movmentes_mutex, 
		mutex_for_unloading_nodes, mutex_function_call, array_mutex_process, 
		menace_mutex, array_counting_mutex, mutex_for_container_state, 
		mutex_for_trickery, unload_queue_mutex, load_queue_mutex, 
		mutex_containers, mutex_singular_l_u
	]

	for mutex in mutex_list:
		if !mutex.try_lock():
			print("⚠️ Unlocking:", mutex)
			mutex.unlock()
####################

####################
# JSH Ethereal Engine Repair
func reanimate_all_handles_and_breaks():
	#print(" new check of where we even went to 14 ")
	#print()
	
	var current_state_mutexes : Array = []
	var negative_counter : int = -1
	var positive_counter : int = -1
	
#####################################################
		## active_r_s_mut
	var mutex_check_0 = null
	if active_r_s_mut.try_lock():
		mutex_check_0 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_0 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_0)
#####################################################
	
#####################################################
		## cached_r_s_mutex
	var mutex_check_1 = null
	if cached_r_s_mutex.try_lock():
		mutex_check_1 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_1 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_1)
#####################################################
	
#####################################################
		## tree_mutex
	var mutex_check_2 = null
	if tree_mutex.try_lock():
		mutex_check_2 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_2 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_2)
#####################################################
	
	
#####################################################
		## cached_tree_mutex
	var mutex_check_3 = null
	if cached_tree_mutex.try_lock():
		mutex_check_3 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_3 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_3)
#####################################################
	
	
#####################################################
		## mutex_nodes_to_be_added
	var mutex_check_4 = null
	if mutex_nodes_to_be_added.try_lock():
		mutex_check_4 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_4 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_4)
#####################################################
	
#####################################################
		## movmentes_mutex
	var mutex_check_5 = null
	if movmentes_mutex.try_lock():
		mutex_check_5 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_5 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_5)
#####################################################
	
#####################################################
		## mutex_data_to_send
	var mutex_check_6 = null
	if mutex_data_to_send.try_lock():
		mutex_check_6 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_6 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_6)
#####################################################
	
#####################################################
		## mutex_function_call
	var mutex_check_7 = null
	if mutex_function_call.try_lock():
		mutex_check_7 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_7 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_7)
#####################################################
	
#####################################################
		## mutex_for_unloading_nodes
	var mutex_check_8 = null
	if mutex_for_unloading_nodes.try_lock():
		mutex_check_8 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_8 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_8)
#####################################################

#####################################################
		## array_mutex_process
	var mutex_check_9 = null
	if array_mutex_process.try_lock():
		mutex_check_9 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_9 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_9)
#####################################################



############################################################

# the cardinal sin of creation beyond number 9

#############################################################


#####################################################
		## menace_mutex
	var mutex_check_00 = null
	if menace_mutex.try_lock():
		mutex_check_00 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_00 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_00)
#####################################################

#####################################################
	# array_counting_mutex
	var mutex_check_01 = null
	if array_counting_mutex.try_lock():
		mutex_check_01 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_01 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_01)
#####################################################

#####################################################
	# mutex_for_container_state
	var mutex_check_02 = null
	if mutex_for_container_state.try_lock():
		mutex_check_02 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_02 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_02)
#####################################################

#####################################################
	# mutex_for_trickery
	var mutex_check_03 = null
	if mutex_for_trickery.try_lock():
		mutex_check_03 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_03 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_03)
#####################################################

#####################################################
	# unload_queue_mutex
	var mutex_check_04 = null
	if unload_queue_mutex.try_lock():
		mutex_check_04 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_04 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_04)
#####################################################

#####################################################
	# mutex_containers
	var mutex_check_05 = null
	if mutex_containers.try_lock():
		mutex_check_05 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_05 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_05)
#####################################################

#####################################################
	# mutex_singular_l_u
	var mutex_check_06 = null
	if mutex_singular_l_u.try_lock():
		mutex_check_06 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_06 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_06)
#####################################################



#####################################################
	# unload_queue_mutex
	var mutex_check_07 = null
	if unload_queue_mutex.try_lock():
		mutex_check_07 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_07 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_07)
#####################################################


#####################################################
	# load_queue_mutex
	var mutex_check_08 = null
	if load_queue_mutex.try_lock():
		mutex_check_08 = true
		#############################################
		positive_counter +=1
	else:
		mutex_check_08 = false
		negative_counter +=1
		#############################################
	current_state_mutexes.append(mutex_check_08)
#####################################################
	
	return current_state_mutexes
####################


####################
#
# JSH Ethereal Engine check
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓    •       ┓    ┓ 
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┏┓┏┓┓┏┓┏┓  ┏┣┓┏┓┏┃┏
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┛┛┗┗┫┗┛┗┗   ┗┛┗┗ ┗┛┗
#       888 oo     .d8P  888     888                          ┛               
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Engine check
#
####################



# Check initialization state
####################
# JSH Ethereal Engine check
func check_first_time_status(status_name: String) -> bool:
	#print(" new check of where we even went to 15 ")
	initialization_states.mutex.lock()
	var status = initialization_states.states.get(status_name)
	initialization_states.mutex.unlock()
	return status == true
####################

####################
# JSH Ethereal Engine check
func is_creation_possible() -> bool:
	#print(" new check of where we even went to 16 ")
	# Quick preliminary checks without mutex locks
	if thread_pool == null or first_start_check != "started":
		print("Basic system check failed")
		return false
	# Begin mutex-protected checks
	var creation_allowed := true
	var block_reason := ""
	# Check process mutex
	array_mutex_process.lock()
	var process_check = list_of_sets_to_create.size() < max_nodes_added_per_cycle
	array_mutex_process.unlock()
	if not process_check:
		creation_allowed = false
		block_reason = "Creation queue full"
	# Check container state
	mutex_for_container_state.lock()
	var container_check = current_containers_state.size() < max_nodes_added_per_cycle
	mutex_for_container_state.unlock()
	if not container_check:
		creation_allowed = false
		block_reason = "Container state limit reached"
	# Check resource availability
	array_counting_mutex.lock()
	var resource_check = array_for_counting_finish.size() < max_nodes_added_per_cycle
	array_counting_mutex.unlock()
	if not resource_check:
		creation_allowed = false
		block_reason = "Resource limit reached"
	# Check if we're not in error state
	dictionary_of_mistakes_mutex.lock()
	var error_check = dictionary_of_mistakes.is_empty()
	dictionary_of_mistakes_mutex.unlock()
	if not error_check:
		creation_allowed = false
		block_reason = "System has unresolved errors"
	if not creation_allowed:
		print("Creation blocked: ", block_reason)
		# Record the blocking reason if needed
		dictionary_of_mistakes_mutex.lock()
		dictionary_of_mistakes[Time.get_ticks_msec()] = {
			"type": "creation_blocked",
			"reason": block_reason,
			"status": "pending"
		}
		dictionary_of_mistakes_mutex.unlock()
	return creation_allowed
####################


####################
# JSH Ethereal Engine check
func check_system_state(state_name: String) -> SystemState:
	#print(" new check of where we even went to 17 ")
	core_states.mutex.lock()
	var state = core_states.states.get(state_name, SystemState.UNKNOWN)
	core_states.mutex.unlock()
	return state
####################

####################
# JSH Ethereal Engine check
func set_system_state(state_name: String, new_state: SystemState) -> bool:
	#print(" new check of where we even went to 18 ")
	if not core_states.states.has(state_name):
		return false
		
	core_states.mutex.lock()
	core_states.states[state_name] = new_state
	core_states.mutex.unlock()
	return true
####################


####################
# JSH Ethereal Engine check
func check_system_readiness() -> Dictionary:
	#print(" new check of where we even went to 19 ")
	# From console: ["started", [["akashic_records"], ["base"], ["menu"]]]
	var pending_sets = []
	if array_of_startup_check.is_empty():
		print(" thing is empty, better return ?")
		
		#pending_sets = array_of_startup_check[3]
	#else:
	#	print(" array_of_startup_check " , array_of_startup_check)
		
	var status = {
		"mutex_state": breaks_and_handles_check(),
		"thread_state": check_thread_status(),
		"records_ready": array_of_startup_check.size() > 0
	}
	
	system_readiness.mutexes = !status.mutex_state.has(false)
	system_readiness.threads = status.thread_state == "working"
	system_readiness.records = status.records_ready
	
	return status
####################


####################
# JSH Ethereal Engine check
func check_if_all_systems_are_green():
	#print(" new check of where we even went to 20 ")
	var nodes_status_check : Array = [] 
	var records_system_int : int = -1
	if JSH_records_system is Node:
		records_system_int = 0
		##
		var message = JSH_records_system.check_all_things()
		JSH_records_system.add_stuff_to_basic(array_of_startup_check[3])
		##
		if message == true:
			records_system_int = 1
		else:
			records_system_int = -2
	else:
		records_system_int = -3
	nodes_status_check.append(records_system_int)

	var task_manager_int : int = -1
	if task_manager is Node:
		task_manager_int = 0
		var message = task_manager.check_all_things()
		if message == true:
			task_manager_int = 1
		else:
			task_manager_int = -2
	else:
		task_manager_int = -3
	nodes_status_check.append(task_manager_int)

	var jsh_threads_int : int = -1
	if JSH_Threads is Node:
		jsh_threads_int = 0
		var message = JSH_Threads.check_all_things()
		if message == true:
			jsh_threads_int = 1
		else:
			jsh_threads_int = -2
	else:
		jsh_threads_int = -3
	nodes_status_check.append(jsh_threads_int)

	var data_splitter_int : int = -1
	if data_splitter is Node:
		data_splitter_int = 0
		print(" data_splitter is a node")
		var message = data_splitter.check_all_things()
		if message == true:
			data_splitter_int = 1
		else:
			data_splitter_int = -2
	else:
		data_splitter_int = -3
	nodes_status_check.append(data_splitter_int)

	var system_check_int : int = -1
	if JSH_system_check is Node:
		system_check_int = 0
		var message = JSH_system_check.check_all_things()
		if message == true:
			system_check_int = 1
		else:
			system_check_int = -2
	else:
		system_check_int = -3
	nodes_status_check.append(system_check_int)
	

	return nodes_status_check
	## somewhere to that point we check stuff, we will need to put them in function
####################


####################
# JSH Ethereal Engine check
func process_pre_delta_check() -> bool:
	var can_proceed = true
	var readiness = check_system_readiness()
	
	# Check creation capability
	if system_readiness.mutexes and system_readiness.threads:
		if array_of_startup_check.is_empty():
			can_proceed = false
			print(" it is empty we cannot proceed")
			return can_proceed

		for set_name in array_of_startup_check[1]:
			# Check if we can start creating this set
			if is_creation_possible():
				# Queue for creation
				print("list_of_sets_to_create process_pre_delta_check ")
				#list_of_sets_to_create.append(set_name[0])
	
	return can_proceed
####################

# 2. Add system state access function
####################
# JSH Ethereal Engine check
func get_system_state(state_name: String) -> Dictionary:
	return system_states[state_name] if system_states.has(state_name) else {}
####################

####################
# JSH Ethereal Engine check
func print_system_metrics():
	var metrics = get_system_metrics()
	print("🔍 System Metrics:")
	for key in metrics:
		print(key)
####################


####################
# JSH Ethereal Engine check
func first_turn_validation() -> Dictionary:
	var validation = {
		"thread_health": check_thread_status(),
		"memory_state": {
			"stored_delta_memory": stored_delta_memory.size(),
			"past_deltas_memories": past_deltas_memories.size()
		},
		"task_state": {
			"started": int_of_stuff_started,
			"finished": int_of_stuff_finished
		},
		"timestamp": Time.get_ticks_msec()
	}
	
	if validation.thread_health == "working":
		# Your stored_delta_memory tracking looks good
		# Maybe formalize the timing tracking more:
		track_delta_timing(validation.timestamp)
	
	return validation
####################


####################
# JSH Ethereal Engine check
func get_system_metrics() -> Dictionary:
	var metrics = {
		"total_functions": 0,
		"checked_functions": 0,
		"gdscript_files": 0,
		"connected_gdscript_files": 0,
		"rom_entries": 0,
		"checked_rom_entries": 0,
		"interface_sets_total": 0,
		"interface_sets_loaded": 0,
		
		# Additional tracking metrics
		"system_nodes": 0,
		"active_threads": 0,
		"mutex_states": 0,
		"error_logs": 0,
		"performance_markers": 0
	}
	
	## how is this part alive over any func, is a mystery for me
	# oh it is a function, i am sorry
	# Count GDScript files
	var dir = DirAccess.open("res://scripts")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".gd"):
				metrics["gdscript_files"] += 1
			file_name = dir.get_next()
		dir.list_dir_end()
	
	# Count connected files (example logic)
	metrics["connected_gdscript_files"] = scene_tree_jsh.keys().size()
	
	# Estimate total functions (rough approximation)
	metrics["total_functions"] = metrics["gdscript_files"] * 10  # Assuming avg 10 functions per script
	
	# Interface sets tracking
	metrics["interface_sets_total"] = list_of_sets_to_create.size()
	metrics["interface_sets_loaded"] = list_of_sets_to_create.filter(func(set): return set[1] != 0).size()
	
	# System nodes count
	metrics["system_nodes"] = get_tree().get_node_count()
	
	# Active threads
	metrics["active_threads"] = thread_pool.get_active_thread_count() if thread_pool else 0
	
	# Mutex states
	var mutex_count = 0
	for key in get_property_list():
		if key.name.ends_with("mutex"):
			mutex_count += 1
	metrics["mutex_states"] = mutex_count
	
	# Error logging
	metrics["error_logs"] = dictionary_of_mistakes.size()
	
	return metrics
####################


####################
#
# JSH Ethereal Time System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┳┓•       ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃   ┃ ┓┏┳┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗   ┻ ┗┛┗┗┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                   ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Time System
#
####################

# Check at next Cycle
# Check Time



####################
# JSH Ethereal Time System
func update_delta_history(delta: float):
	time_tracking.mutex.lock()
	time_tracking.delta_history.append({
		"time": Time.get_ticks_msec(),
		"delta": delta
	})
	time_tracking.last_update = Time.get_ticks_msec()
	time_tracking.mutex.unlock()
####################

####################
# JSH Ethereal Time System
	#print("delta_current : ", delta_current, " time : ", time, " hour : ", hour, " minute : ", minute, " second : ", second)
	#time_passed += delta_current
	
	# time, plus two differenly calculated?
#(Time.get_ticks_msec() / 1000.0)
	#var time_1 = time / 10000.0#(Time.get_ticks_msec() / 10000.0)
	#var time_2 = time / 100000.0
	#var timer_reset = int(time_0)
	#var timer_reset2 = int(time_1)
	
	#var timer_new = time_0 - timer_reset
	#var timer_new2 = time_1 - timer_reset2
	
	#var oscillation = abs(1 - (timer_new * 2))
	#var oscillation2 = abs(1 - (timer_new2 * 2))	
	
	#var information =  0.5 * timer_new
	#var information2 = 0.5 * oscillation
	
	#var information3 = 0.5 + information2
	#var information4 = 2 + (2.0 * oscillation2)
	
	#var passed_seconds
	#var passed_minutes
	#var passed_hour
	
	# Convert milliseconds to seconds
	#if passed_seconds >= 60:
	#	passed_seconds -= 60
	#	passed_minutes += 1
		
		# Convert seconds to minutes
	#	if passed_minutes >= 60:
	#		passed_minutes -= 60
	#		passed_hour += 1
	#		

	#print("Time: ", minutes_passed, "m:", seconds_passed, "s:", milliseconds_passed, "ms")
	
	
	#second = time_0
	#minute = time_0 
	#print(" time calculated, 4 new main variables ")
	#print(" time : ", time, " time_0 : ", time_0, " time_1 : ", time_1, " time_2 : ", time_2)
	#print("past data, for shaders, from 1 to 0, from 0 to 1, simple easing? hmm")
	#print(" 2 new timers : ", timer_new, "timer_new2", timer_new2)
	#print(" oscilation? 2 : ", oscillation, " 2 ", oscillation2)
	#print("some information data ")
	#print("information : ", information, " , information2 : ", information2, " , information3 : ", information3, " , information4 : ", information4)
####################

####################
# JSH Ethereal Time System
func calculate_time(delta_current, time, hour, minute, second):
	time = Time.get_ticks_msec()
	var time_0 = time / 1000.0
	var all_seconds : int = time / 1000
	var minutes : int = all_seconds / 60
	var remaining_seconds : int = all_seconds % 60
	print("Time: ", minutes, " minutes and ", remaining_seconds, " seconds")
####################

####################
# JSH Ethereal Time System
func each_blimp_of_delta():
	var each_blimp_time = Time.get_ticks_msec()
	stored_delta_memory.append(each_blimp_time)
	if stored_delta_memory.size() > 9:
		#print(" lets start erasin from here ")
		var last_delta_to_forget = stored_delta_memory.pop_front()
####################


####################
# JSH Ethereal Time System
func before_time_blimp(how_many_finished, how_many_shall_been_finished):
	var before_blimp_time = Time.get_ticks_msec()
	return before_blimp_time
####################


####################
# JSH Ethereal Time System
func blimp_time_for_some_reason():
	print(" check basic if we allign with prophecies of wisest spirits, do we unlock before it is too late ")
####################


####################
# JSH Ethereal Time System
func _on_interval_tick(interval_name: String):
	match interval_name:
		"quick":
			# Very frequent updates (0.1s)
			print("🕒 Quick tick: ", Time.get_ticks_msec())
		"short":
			# Slightly less frequent updates (0.5s)
			print("⏱️ Short tick: ", Time.get_ticks_msec())
		"medium":
			# Standard interval updates (1s)
			print("⏰ Medium tick: ", Time.get_ticks_msec())
		"long":
			# Infrequent updates (10s)
			print("🕓 Long tick: ", Time.get_ticks_msec())
####################


####################
# JSH Ethereal Time System
func track_delta_timing(validation):
	print("blink")
####################

# these kinda need to change i guess

####################
# JSH Time System
func _setup_retry_timer():
	# Connect to timer completion to retry the operation
	timer_system.timer_completed.connect(_on_retry_timer_completed)
####################

# could do specific function instead of some singular function that does not do too much

####################
# JSH Time System
func _on_retry_timer_completed(timer_id: String):
	if timer_id == "retry_timer":
		print("Retrying operation after timer completion")
		# Retry your operation here
		prepare_akashic_records()
####################




####################
#
# JSH Ethereal Task System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┳┓   ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃   ┃ ┏┓┏┃┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗   ┻ ┗┻┛┛┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                  ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Task System
#
####################

# Add Task
# Check Task
# Modify Task
# Store Task
# Abort Task

# Add Task
#                     ,,        ,,                                         
#       db          `7MM      `7MM      MMP""MM""YMM             `7MM      
#      ;MM:           MM        MM      P'   MM   `7               MM      
#     ,V^MM.     ,M""bMM   ,M""bMM           MM   ,6"Yb.  ,pP"Ybd  MM  ,MP'
#    ,M  `MM   ,AP    MM ,AP    MM           MM  8)   MM  8I   `"  MM ;Y   
#    AbmmmqMA  8MI    MM 8MI    MM           MM   ,pm9MM  `YMMMa.  MM;Mm   
#   A'     VML `Mb    MM `Mb    MM           MM  8M   MM  L.   I8  MM `Mb. 
# .AMA.   .AMMA.`Wbmd"MML.`Wbmd"MML.       .JMML.`Moo9^Yo.M9mmmP'.JMML. YA.
#
# Add Task


# use just once, when process turns on, after ready
####################
# JSH Ethereal Task System
func ready_for_once():
	if just_one_try == 0:
		just_one_try = 1
		create_new_task("three_stages_of_creation", "base")
		create_new_task("three_stages_of_creation", "menu")
		return true
	else:
		return false
####################




# 3. Fix process_pending_sets function
####################
# JSH Ethereal Task System
func process_pending_sets():
	var creation_state = get_system_state("creation")
	if creation_state.is_empty():
		return false
		
	creation_state["mutex"].lock()
	var can_process = true
	
	if creation_state["pending_sets"].size() > 0:
		for set_data in creation_state["pending_sets"]:
			if check_system_function("creation"):
				create_new_task("three_stages_of_creation", set_data)
				creation_state["active_sets"].append(set_data)
			else:
				can_process = false
				break
	
	creation_state["mutex"].unlock()
	return can_process
####################

####################
# JSH Ethereal Task System
func handle_creation_task(target_argument):
	var type_of_state : int = 1
	print(" handle_creation_task : ", target_argument)
	
	# Check if we can proceed with creation
	load_queue_mutex.lock()
	var can_proceed = true
	if load_queue.has(target_argument):
		if load_queue[target_argument].has("metadata"):
			if load_queue[target_argument]["metadata"].has("status"):
				if load_queue[target_argument]["metadata"]["status"] != 0:
					can_proceed = false
	load_queue_mutex.unlock()
	
	if can_proceed:
		# Update tree state
		the_current_state_of_tree(target_argument, type_of_state)
		
		# Trigger recheck
		mutex_for_trickery.lock()
		menace_tricker_checker = 1
		mutex_for_trickery.unlock()
	else:
		# Log creation attempt for retry
		dictionary_of_mistakes_mutex.lock()
		if !dictionary_of_mistakes.has(target_argument):
			dictionary_of_mistakes[target_argument] = {
				"status": "pending",
				"counter": int(1),
				"last_attempt": Time.get_ticks_msec()
			}
		dictionary_of_mistakes_mutex.unlock()
####################

####################
# JSH Ethereal Task System
func handle_unload_task(target_argument):
	var type_of_state : int = -1
	var the_shorter_set = target_argument.substr(0, str(target_argument).length() - 10)
	print(" handle_unload_task : ", target_argument, " shortened to: ", the_shorter_set)
	
	# Check unload queue state
	unload_queue_mutex.lock()
	if !unload_queue.has(target_argument):
		unload_queue[target_argument] = {
			"metadata": {
				"status": "pending",
				"tries": 0,
				"last_attempt": Time.get_ticks_msec()
			}
		}
	else:
		unload_queue[target_argument]["metadata"]["tries"] += 1
		unload_queue[target_argument]["metadata"]["last_attempt"] = Time.get_ticks_msec()
	unload_queue_mutex.unlock()
	
	# Update tree state for unloading
	the_current_state_of_tree(the_shorter_set, type_of_state)
	
	# Trigger recheck
	mutex_for_trickery.lock()
	menace_tricker_checker = 1
	mutex_for_trickery.unlock()
	
	# Monitor unload progress
	if unload_queue[target_argument]["metadata"]["tries"] > 3:
		# Log potential stuck unload
		dictionary_of_mistakes_mutex.lock()
		if !dictionary_of_mistakes.has(target_argument):
			dictionary_of_mistakes[target_argument] = {
				"status": "stuck_unload",
				"counter": int(1),
				"last_attempt": Time.get_ticks_msec()
			}
		dictionary_of_mistakes_mutex.unlock()
####################


# Check Task
#               ,,                                                                        
#   .g8"""bgd `7MM                       `7MM          MMP""MM""YMM             `7MM      
# .dP'     `M   MM                         MM          P'   MM   `7               MM      
# dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'         MM   ,6"Yb.  ,pP"Ybd  MM  ,MP'
# MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y            MM  8)   MM  8I   `"  MM ;Y   
# MM.           MM    MM 8M"""""" 8M       MM;Mm            MM   ,pm9MM  `YMMMa.  MM;Mm   
# `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.          MM  8M   MM  L.   I8  MM `Mb. 
#   `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.       .JMML.`Moo9^Yo.M9mmmP'.JMML. YA.
#
# Check Task




# Then in your check function:
####################
# JSH Ethereal Task System
func check_status():
	var stuck_status = check_thread_status()
	
	if stuck_status == "error":
		print(" something went wrong, starting retry timer")
		if timer_system:  # Check if timer system exists
			if timer_system.is_timer_active("retry_timer"):
				print("Retry timer already running...")
				return
				
			# Create and start retry timer
			timer_system.create_timer("retry_timer", 5.0)
			timer_system.start_timer("retry_timer")
			
			# You can also track the retry attempts
			var current_attempt = 1
			timer_system.timer_completed.connect(
				func(timer_id): 
					if timer_id == "retry_timer":
						current_attempt += 1
						print("Retry attempt: ", current_attempt)
			)
		else:
			push_error("Timer system not initialized!")
			
	elif stuck_status == "working":
		var updated_message = check_thread_status_type()
		print(" stuck status after working : ", updated_message)
	print(" stuff to do :: mutex statuses : ", breaks_and_handles_check(), 
		  ", stuck_status threads status : ", stuck_status, 
		  " and main sets to create", array_of_startup_check)
####################



# In your status check function
####################
# JSH Ethereal Task System
func check_status_just_timer():
	# it must return something, i wanna functions with, return
	var stuck_status = check_thread_status()
	
	if stuck_status is String:
		print(" stuck status it is string ")
		if stuck_status == "error":
			print(" stuck status something went wrong, starting verified timer " , stuck_status)
			if timer_system:
				var start_time = Time.get_ticks_msec()
				timer_system.create_timer("retry_timer", 5.0)
				timer_system.start_timer("retry_timer")
				print(" stuck status Timer started at OS time: ", start_time)
		else:
			print(" stuck status it is not error, it is :::" , stuck_status)
			var updated_message = check_thread_status_type()
			print(" stuck status ::: " , updated_message, " :::: " , stuck_status)
			return stuck_status
	if stuck_status is int:
		print(" stuck status is int " , stuck_status)
		# maybe match
		return str(stuck_status)
####################


####################
# JSH Ethereal Task System
func track_task_status(task_id):
	task_status[task_id] = {
		"start_time": Time.get_ticks_msec(),
		"status": "pending",
		"retries": 0,
		"error_count": 0
	}
####################

####################
# JSH Ethereal Task System
func track_task_completion(task_id):
	task_timeouts[task_id] = {
		"start_time": Time.get_ticks_msec(),
		"status": "pending"
	}
	# Check after max duration
	await get_tree().create_timer(max_task_duration / 1000.0).timeout
	if task_timeouts.has(task_id) and task_timeouts[task_id]["status"] == "pending":
		# Task timed out - attempt recovery
		handle_task_timeout(task_id)
####################

####################
# JSH Ethereal Task System
func handle_task_timeout(task_id):
	var task_data = task_status[task_id]
	
	## Reset stuck mutexes
	#var mutexes_to_check = [
		#active_r_s_mut,
		#cached_r_s_mutex,
		#tree_mutex,
		#mutex_for_container_state
	#]
	#
	#for mutex in mutexes_to_check:
		#if !mutex.try_lock():
			## Force unlock if stuck
			#mutex.unlock()
			#log_error_state("mutex_stuck", {
				#"task_id": task_id,
				#"mutex": mutex
			#})
	#
	## Clear queue if needed
	#if task_data["retries"] > 3:
		#clear_task_queues()
####################


# Modify Task
#                                 ,,    ,,      ,...                                                
# `7MMM.     ,MMF'              `7MM    db    .d' ""             MMP""MM""YMM             `7MM      
#   MMMb    dPMM                  MM          dM`                P'   MM   `7               MM      
#   M YM   ,M MM  ,pW"Wq.    ,M""bMM  `7MM   mMMmm`7M'   `MF'         MM   ,6"Yb.  ,pP"Ybd  MM  ,MP'
#   M  Mb  M' MM 6W'   `Wb ,AP    MM    MM    MM    VA   ,V           MM  8)   MM  8I   `"  MM ;Y   
#   M  YM.P'  MM 8M     M8 8MI    MM    MM    MM     VA ,V            MM   ,pm9MM  `YMMMa.  MM;Mm   
#   M  `YM'   MM YA.   ,A9 `Mb    MM    MM    MM      VVV             MM  8M   MM  L.   I8  MM `Mb. 
# .JML. `'  .JMML.`Ybmd9'   `Wbmd"MML..JMML..JMML.    ,V            .JMML.`Moo9^Yo.M9mmmP'.JMML. YA.
#                                                    ,V                                             
#                                                 OOb"
# Modify Task




# Store Task
#
#  .M"""bgd mm                               MMP""MM""YMM             `7MM      
# ,MI    "Y MM                               P'   MM   `7               MM      
# `MMb.   mmMMmm ,pW"Wq.`7Mb,od8 .gP"Ya           MM   ,6"Yb.  ,pP"Ybd  MM  ,MP'
#   `YMMNq. MM  6W'   `Wb MM' "',M'   Yb          MM  8)   MM  8I   `"  MM ;Y   
# .     `MM MM  8M     M8 MM    8M""""""          MM   ,pm9MM  `YMMMa.  MM;Mm   
# Mb     dM MM  YA.   ,A9 MM    YM.    ,          MM  8M   MM  L.   I8  MM `Mb. 
# P"Ybmmd"  `Mbmo`Ybmd9'.JMML.   `Mbmmd'        .JMML.`Moo9^Yo.M9mmmP'.JMML. YA.
#
# Store Task

# Abort Task
#               ,,                                                                       
#       db     *MM                           mm       MMP""MM""YMM             `7MM      
#      ;MM:     MM                           MM       P'   MM   `7               MM      
#     ,V^MM.    MM,dMMb.   ,pW"Wq.`7Mb,od8 mmMMmm          MM   ,6"Yb.  ,pP"Ybd  MM  ,MP'
#    ,M  `MM    MM    `Mb 6W'   `Wb MM' "'   MM            MM  8)   MM  8I   `"  MM ;Y   
#    AbmmmqMA   MM     M8 8M     M8 MM       MM            MM   ,pm9MM  `YMMMa.  MM;Mm   
#   A'     VML  MM.   ,M9 YA.   ,A9 MM       MM            MM  8M   MM  L.   I8  MM `Mb. 
# .AMA.   .AMMA.P^YbmdP'   `Ybmd9'.JMML.     `Mbmo       .JMML.`Moo9^Yo.M9mmmP'.JMML. YA.
#
# Abort Task



####################
# JSH Ethereal Task System
func clear_task_queues():
	print(" hm ")
	#array_mutex_process.lock()
	#list_of_sets_to_create.clear()
	#array_mutex_process.unlock()
	#
	#mutex_nodes_to_be_added.lock() 
	#nodes_to_be_added.clear()
	#mutex_nodes_to_be_added.unlock()
	#
	## Reset container states
	#mutex_for_container_state.lock()
	#for container in current_containers_state.keys():
		#current_containers_state[container]["status"] = -1
	#mutex_for_container_state.unlock()
####################











####################
#
# JSH Ethereal Downloads System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┓       ┓     ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┃┃┏┓┓┏┏┏┓┃┏┓┏┓┏┫┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┻┛┗┛┗┻┛┛┗┗┗┛┗┻┗┻┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                           ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Downloads System
#
####################

# Receive Data
# Send Data
# Check Data
# Store Data
# Connect
# Disconnect

####################
# Receive Data                                                                                                    
#                                        ,,                                                            
# `7MM"""Mq.                             db                        `7MM"""Yb.            mm            
#   MM   `MM.                                                        MM    `Yb.          MM            
#   MM   ,M9  .gP"Ya   ,p6"bo   .gP"Ya `7MM `7M'   `MF'.gP"Ya        MM     `Mb  ,6"Yb.mmMMmm  ,6"Yb.  
#   MMmmdM9  ,M'   Yb 6M'  OO  ,M'   Yb  MM   VA   ,V ,M'   Yb       MM      MM 8)   MM  MM   8)   MM  
#   MM  YM.  8M"""""" 8M       8M""""""  MM    VA ,V  8M""""""       MM     ,MP  ,pm9MM  MM    ,pm9MM  
#   MM   `Mb.YM.    , YM.    , YM.    ,  MM     VVV   YM.    ,       MM    ,dP' 8M   MM  MM   8M   MM  
# .JMML. .JMM.`Mbmmd'  YMbmd'   `Mbmmd'.JMML.    W     `Mbmmd'     .JMMmmmdP'   `Moo9^Yo.`Mbmo`Moo9^Yo.
#
# Receive Data
####################

func first_dimensional_magic(type_of_action_to_do : String, datapoint_node : Node, additional_node : Node = null):
	var first_dimensional_data_array : Array = []
	first_dimensional_data_array.append(type_of_action_to_do)
	first_dimensional_data_array.append(datapoint_node)
	first_dimensional_data_array.append(additional_node)
	mutex_actions.lock()
	actions_to_be_called.append(first_dimensional_data_array)
	mutex_actions.unlock()

####################
# JSH Ethereal Downloads System
func the_fourth_dimensional_magic(type_of_operation : String, node : Node, data_of_movement):
	var data_for_movement : Array = []
	data_for_movement.append(type_of_operation)
	data_for_movement.append(node)
	data_for_movement.append(data_of_movement)
	movmentes_mutex.lock()
	things_to_be_moved.append(data_for_movement)
	movmentes_mutex.unlock()
####################

####################
# JSH Ethereal Downloads System
func fifth_dimensional_magic(type_of_unloading : String, node_path_for_unload : String):
	#print(" main script, we got data for unloading , " , node_path_for_unload)
	var data_for_unloading : Array = []
	data_for_unloading.append(type_of_unloading)
	data_for_unloading.append(node_path_for_unload)
	mutex_for_unloading_nodes.lock()
	nodes_to_be_unloaded.append(data_for_unloading)
	mutex_for_unloading_nodes.unlock()
####################




####################
# JSH Ethereal Downloads System
func sixth_dimensional_magic(type_of_function, node_to_call, function_name : String, additional_data = null):
	var data_for_function_call : Array = []
	data_for_function_call.append(type_of_function)
	data_for_function_call.append(node_to_call)
	data_for_function_call.append(function_name)
	if additional_data != null:
		data_for_function_call.append(additional_data)
	mutex_function_call.lock()
	functions_to_be_called.append(data_for_function_call)
	mutex_function_call.unlock()
####################

####################
# JSH Ethereal Download System
func seventh_dimensional_magic(type_of_action : String, kind_of_action : String, amount_of_actions : int):
	var data_for_additionals : Array = []
	data_for_additionals.append(type_of_action)
	data_for_additionals.append(kind_of_action)
	data_for_additionals.append(amount_of_actions)
	## needed containers
	## needed nodes
	mutex_additionals_call.lock()
	
	## here is new logic needed, we could somehow, send the same data twice?
	
	additionals_to_be_called.append(data_for_additionals)
	mutex_additionals_call.unlock()
	print(" seventh dimensional magic : " , data_for_additionals)
####################

func check_magical_array(path_of_the_node):
	#print
	#var original_name = "singular_lines_container"
	var name_parts = path_of_the_node.split("_")  # Returns a PackedStringArray

	# Convert to a regular Array to use pop_back()
	var modifiable_parts = Array(name_parts) 
	modifiable_parts.pop_back()  # Remove last element

	# Merge back into a string
	var new_name = "_".join(modifiable_parts)

	print(" magical we must learn abortion hehe ", new_name)  # Output: "singular_lines"
	mutex_additionals_call.lock()
	#.append(data_for_additionals)
	for current_sets_to_create in additionals_to_be_called:
		print("we must learn abortion hehe current_sets_to_create ", current_sets_to_create)
		if current_sets_to_create[1] == path_of_the_node:
			current_sets_to_create[2] = 0
			mutex_additionals_call.unlock()
			return false
		elif current_sets_to_create[0].begins_with(new_name):
			current_sets_to_create[2] = 0
			mutex_additionals_call.unlock()
			return false
	mutex_additionals_call.unlock()
	return true
	
	
	
	#mutex_additionals_call.unlock()


func eight_dimensional_magic(type_of_message : String, message_now, receiver_name : String):
	var divine_messenger_of_space_and_time : Array = []
	divine_messenger_of_space_and_time.append(type_of_message)
	divine_messenger_of_space_and_time.append(message_now)
	divine_messenger_of_space_and_time.append(receiver_name)
	
	mutex_messages_call.lock()
	messages_to_be_called.append(divine_messenger_of_space_and_time)
	mutex_messages_call.unlock()


####################
# Send Data
#                                     ,,                                          
#  .M"""bgd                         `7MM      `7MM"""Yb.            mm            
# ,MI    "Y                           MM        MM    `Yb.          MM            
# `MMb.      .gP"Ya `7MMpMMMb.   ,M""bMM        MM     `Mb  ,6"Yb.mmMMmm  ,6"Yb.  
#   `YMMNq. ,M'   Yb  MM    MM ,AP    MM        MM      MM 8)   MM  MM   8)   MM  
# .     `MM 8M""""""  MM    MM 8MI    MM        MM     ,MP  ,pm9MM  MM    ,pm9MM  
# Mb     dM YM.    ,  MM    MM `Mb    MM        MM    ,dP' 8M   MM  MM   8M   MM  
# P"Ybmmd"   `Mbmmd'.JMML  JMML.`Wbmd"MML.    .JMMmmmdP'   `Moo9^Yo.`Mbmo`Moo9^Yo.
#
# Send Data
####################





# here we get datapoint, and send that data further
####################
# JSH Ethereal Downloads System
func newer_even_function_for_dictionary(name_of_container):

	array_counting_mutex.lock()
	var datapoint_node_newest = array_for_counting_finish[name_of_container]["metadata"]["datapoint_node"]#.duplicate(true)
	var deep_state_copy_of_apples = array_for_counting_finish[name_of_container].duplicate(true)
	array_counting_mutex.unlock()
	datapoint_node_newest.new_datapoint_layer_system(deep_state_copy_of_apples)
####################


####################
# JSH Ethereal Downloads System
func task_to_send_data_to_datapoint(data_for_sending):
	print(" les check stuff sending data to datapoint")
	#await_for_signal()
	var current_datatype = data_for_sending[0][0]
	var first_line_t = data_for_sending[0][1]
	var parsed_lines_t = data_for_sending[0][2]
	var data_point_node_t = data_for_sending[0][3]
	match current_datatype:
		"instructions_analiser":
			var container_node_t = data_for_sending[0][4]
			instructions_analiser(first_line_t, parsed_lines_t[0], parsed_lines_t[1], data_point_node_t, container_node_t)
		"scene_frame_upload":
			var container_node_t = data_for_sending[0][4]
			scene_frames_upload_to_datapoint(first_line_t, parsed_lines_t, data_point_node_t, container_node_t)
		"interactions_upload":
			interactions_upload_to_datapoint(first_line_t, parsed_lines_t, data_point_node_t)
####################




####################
# JSH Ethereal Downloads System
func interactions_upload_to_datapoint(header_line, information_lines, datapoint):
	#var array_of_interactions : Array = []
	#var number_of_interactions = header_line.size() - 5
	#var num_counter : int = 5
	#for num_in in number_of_interactions:
	#	array_of_interactions.append(header_line[num_counter])
	#	num_counter +=1
	#print(" interactions dilema now : ", header_line, information_lines)
	print(" the await two point o stuff ")
	datapoint.upload_interactions(header_line, information_lines)
####################

# uploading scenes to datapoint
# we first must have container and datapoint for it
####################
# JSH Ethereal Downloads System
func scene_frames_upload_to_datapoint(header_line, information_lines, datapointi, containeri):
	var datapoint_path = header_line[1][0] + "/" + header_line[2][0]
	var datapoint_selector = datapointi
	var new_way1 = header_line
	var new_way2 = information_lines
	datapoint_selector.upload_scenes_frames(header_line, information_lines)
####################










####################
# Check Data
#
#               ,,                                                                         
#   .g8"""bgd `7MM                       `7MM          `7MM"""Yb.            mm            
# .dP'     `M   MM                         MM            MM    `Yb.          MM            
# dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'      MM     `Mb  ,6"Yb.mmMMmm  ,6"Yb.  
# MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y         MM      MM 8)   MM  MM   8)   MM  
# MM.           MM    MM 8M"""""" 8M       MM;Mm         MM     ,MP  ,pm9MM  MM    ,pm9MM  
# `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.       MM    ,dP' 8M   MM  MM   8M   MM  
#   `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.    .JMMmmmdP'   `Moo9^Yo.`Mbmo`Moo9^Yo.
#
# Check Data
####################

####################
# JSH Ethereal Downloads System
func load_cached_data_second_impact(data_set: String):
	print(" load cached data start : " , data_set)
	var type_of_data : int
	var records_set_name = data_set
	active_r_s_mut.lock()
	var cached_data_new = active_record_sets[records_set_name].duplicate(true)
	active_r_s_mut.unlock()
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var first_line : Array = []
	var lines_parsed : Array = []
	for data_type in BanksCombiner.combination_new_gen_1:
		type_of_data = int(data_type[0])
		var type_num = data_type[0]
		var data_name = records_set_name + BanksCombiner.data_names_0[type_num]
		var file_data = cached_data_new[data_name]["content"]
		var size_of_data = file_data.size()
		for record in file_data:
			for lines in record:
				if lines == record[0]:
					first_line = record[0]
				else:
					lines_parsed.append(lines)
					
			print(" we have an issue, probably " , first_line)
			match type_of_data:
				0:
					print("newly_made_dictio here we act re se ")
				1:
#					print("instruction stuff:")
					var thingies_to_make_path = lines_parsed[0]
					var datapoint_path_l_c_d_s_i =  thingies_to_make_path[0][0] + "/" + thingies_to_make_path[1][0]
					var data_type_s_i : String = "instructions_analiser"
					
					
					#print(" lets rethink stuff, what was here? " ,first_line[0][0], [data_type_s_i, datapoint_path_l_c_d_s_i, thingies_to_make_path[0][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					# thingies_to_make_path[0][0] = container first_line[0][0] = instruction id, datapoint_path_l_c_d_s_i = datapoint path, data_type_s_i = to where it needs to go later
					print(" we have an issue, probably  1")
					data_to_be_send_processing(thingies_to_make_path[0][0], first_line[0][0], datapoint_path_l_c_d_s_i, data_type_s_i, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					#data_sending_mutex
					#data_that_is_send
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i, datapoint_path_l_c_d_s_i, thingies_to_make_path[0][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
				2: 
#					print(" scenes and frames analise : ")
					var thingies_to_make_path = lines_parsed[0]
					var datapoint_path_l_c_d_s_i0 =  first_line[1][0] + "/" + first_line[2][0]
					var data_type_s_i0 : String = "scene_frame_upload"
					print(" we have an issue, probably  2")
					data_to_be_send_processing(first_line[1][0], first_line[0][0], datapoint_path_l_c_d_s_i0, data_type_s_i0, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i0, datapoint_path_l_c_d_s_i0, first_line[1][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
				3: #interactions
					var datapoint_path_l_c_d_s_i1 =  first_line[1][0] + "/" + first_line[2][0]
					var data_type_s_i1 : String = "interactions_upload"
					print(" we have an issue, probably  3")
					data_to_be_send_processing(first_line[1][0], first_line[0][0], datapoint_path_l_c_d_s_i1, data_type_s_i1, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i1, datapoint_path_l_c_d_s_i1, first_line[1][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
			first_line.clear()
			lines_parsed.clear()
####################

####################
# JSH Ethereal Downloads System
func load_cached_data_second_impact_old(data_set: String):
	print(" load cached data start : " , data_set)
	var type_of_data : int
	var records_set_name = data_set
	active_r_s_mut.lock()
	var cached_data_new = active_record_sets[records_set_name].duplicate(true)
	active_r_s_mut.unlock()
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var first_line : Array = []
	var lines_parsed : Array = []
	for data_type in BanksCombiner.combination_new_gen_1:
		type_of_data = int(data_type[0])
		var type_num = data_type[0]
		var data_name = records_set_name + BanksCombiner.data_names_0[type_num]
		var file_data = cached_data_new[data_name]["content"]
		var size_of_data = file_data.size()
		for record in file_data:
			for lines in record:
				if lines == record[0]:
					first_line = record[0]
				else:
					lines_parsed.append(lines)
			match type_of_data:
				0:
					print("newly_made_dictio here we act re se ")
				1:
#					print("instruction stuff:")
					var thingies_to_make_path = lines_parsed[0]
					var datapoint_path_l_c_d_s_i =  thingies_to_make_path[0][0] + "/" + thingies_to_make_path[1][0]
					var data_type_s_i : String = "instructions_analiser"
					
					
					#print(" lets rethink stuff, what was here? " ,first_line[0][0], [data_type_s_i, datapoint_path_l_c_d_s_i, thingies_to_make_path[0][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					# thingies_to_make_path[0][0] = container first_line[0][0] = instruction id, datapoint_path_l_c_d_s_i = datapoint path, data_type_s_i = to where it needs to go later
					data_to_be_send_processing(thingies_to_make_path[0][0], first_line[0][0], datapoint_path_l_c_d_s_i, data_type_s_i, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					#data_sending_mutex
					#data_that_is_send
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i, datapoint_path_l_c_d_s_i, thingies_to_make_path[0][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
				2: 
#					print(" scenes and frames analise : ")
					var thingies_to_make_path = lines_parsed[0]
					var datapoint_path_l_c_d_s_i0 =  first_line[1][0] + "/" + first_line[2][0]
					var data_type_s_i0 : String = "scene_frame_upload"
					
					data_to_be_send_processing(first_line[1][0], first_line[0][0], datapoint_path_l_c_d_s_i0, data_type_s_i0, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i0, datapoint_path_l_c_d_s_i0, first_line[1][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
				3: #interactions
					var datapoint_path_l_c_d_s_i1 =  first_line[1][0] + "/" + first_line[2][0]
					var data_type_s_i1 : String = "interactions_upload"
					
					data_to_be_send_processing(first_line[1][0], first_line[0][0], datapoint_path_l_c_d_s_i1, data_type_s_i1, first_line.duplicate(true), lines_parsed.duplicate(true), data_set)
					
					mutex_data_to_send.lock()
					data_to_be_send.append([data_type_s_i1, datapoint_path_l_c_d_s_i1, first_line[1][0], first_line.duplicate(true), lines_parsed.duplicate(true)])
					mutex_data_to_send.unlock()
			first_line.clear()
			lines_parsed.clear()
####################


####################
# JSH Ethereal Downloads System
func instructions_analiser(metadata_parts, second_line, third_line, datapoint, container):
	
	var type = metadata_parts[1][0]
	var counter = -1
	for i in InstructionsBank.type_of_instruction_0:
		counter +=1
		if type == i:
			break
	match counter:
		0: # 0 = "assign_priority_to_datapoint"
			datapoint.datapoint_assign_priority(third_line[0][0])
		1: # 1 = "assign_things_to_datapoint"
			datapoint.add_thing_to_datapoint(third_line)
		2: # 2 = "set_max_things_number", 
			datapoint.datapoint_max_things_number_setter(third_line[0][0])
		3: # 3 = "connect_containter_datapoint"
			container.containter_start_up(0, datapoint)
		4: # 4 = "add_things_to_container", 
			print("analise instruction 4, we didnt use it yet, probably putting containers inside containers, so we have like, easy way to use scenes system :)")
		5: # 5 = "set_the_scene", 
			var scene_setter_number = int(third_line[0][0])
			datapoint.scene_to_set_number_later(scene_setter_number)
		6: # 6 = "rotate_container", 
			#container.rotation.x -= deg_to_rad(int(third_line[1][0]))
			var type_of_stuff : String = "rotate"
			the_fourth_dimensional_magic(type_of_stuff, container, int(third_line[1][0]))
			
		7: # 7 = "setup_text_bracet"
			var action_function_type : String = "single_function"
			var name_of_function : String = "setup_text_handling"
			sixth_dimensional_magic(action_function_type, datapoint, name_of_function)
			#datapoint.setup_text_handling() # = get_node(database_node_path)
		8: #
			#print(" interaction single multi mode or whatever" , third_line[0][0] , third_line[1][0])
			datapoint.set_maximum_interaction_number(third_line[0][0], int(third_line[1][0]))
			
		9: #move_container
			print(" move container " , third_line)
			var x = float(third_line[1][0])  # "0.0"
			var y = float(third_line[1][1])  # "-4.5"
			var z = float(third_line[1][2])  # "0.41"
			var new_position = Vector3(x, y, z)
			var type_of_stuff : String = "move"
			the_fourth_dimensional_magic(type_of_stuff, container, new_position)
			#container.position = Vector3(x, y, z)
		10:
			print(" load_file ")
			#datapoint.initialize_loading_file(third_line)
####################


					# thingies_to_make_path[0][0] = container first_line[0][0] = instruction id, datapoint_path_l_c_d_s_i = datapoint path, data_type_s_i = to where it needs to go later
func data_to_be_send_processing(container_name, data_id, path_for_datapoint, place_for_data, first_line, lines_parsed, data_set_name):
	
	data_sending_mutex.lock()
	## container name
	if data_that_is_send.has(data_set_name): 
		## instruction name
		if data_that_is_send[data_set_name].has(place_for_data):
			if data_that_is_send[data_set_name][place_for_data].has(data_id):
				print(" it had it already")
			else:
				data_that_is_send[data_set_name][place_for_data][data_id] = {}#[first_line, lines_parsed]
				data_that_is_send[data_set_name][place_for_data][data_id]["first_line"] = first_line
				data_that_is_send[data_set_name][place_for_data][data_id]["lines_parsed"] = lines_parsed
				#if !data_that_is_send[container_name]["metadata"]["data_set"].has(data_set_name):
				#	data_that_is_send[container_name]["metadata"]["data_set"][data_set_name] = "another"
		else:
			data_that_is_send[data_set_name][place_for_data] = {}
			data_that_is_send[data_set_name][place_for_data][data_id] = {}#[first_line, lines_parsed]
			data_that_is_send[data_set_name][place_for_data][data_id]["first_line"] = first_line
			data_that_is_send[data_set_name][place_for_data][data_id]["lines_parsed"] = lines_parsed
			#if !data_that_is_send[container_name]["metadata"]["data_set"].has(data_set_name):
			#	data_that_is_send[container_name]["metadata"]["data_set"][data_set_name] = "another"
	## it does not posses container name yet
	else:
		data_that_is_send[data_set_name] = {}
		data_that_is_send[data_set_name]["metadata"] = {}
		data_that_is_send[data_set_name]["metadata"]["datapoint_path"] = path_for_datapoint
		data_that_is_send[data_set_name]["metadata"]["container_path"] = container_name
		#data_that_is_send[container_name]["metadata"]["data_set"] = {}
		#data_that_is_send[container_name]["metadata"]["data_set"][data_set_name] = "first"
		data_that_is_send[data_set_name][place_for_data] = {}
		data_that_is_send[data_set_name][place_for_data][data_id] = {}#[first_line, lines_parsed]
		data_that_is_send[data_set_name][place_for_data][data_id]["first_line"] = first_line
		data_that_is_send[data_set_name][place_for_data][data_id]["lines_parsed"] = lines_parsed
	#print(" les check that  first  " , data_that_is_send[data_set_name][place_for_data][data_id])
	data_sending_mutex.unlock()

func check_type_of_container(data_set_name):
	var type_of_container : String
	data_sending_mutex.lock()
	for instruction in data_that_is_send[data_set_name]["instructions_analiser"]:
		#print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction][0][1][0])#, data_that_is_send[data_set_name]["instructions_analiser"][instruction])
		#print(" les check that repair ",data_that_is_send[data_set_name]["instructions_analiser"][instruction]["first_line"][1][0])
		if data_that_is_send[data_set_name]["instructions_analiser"][instruction]["first_line"][1][0] == "set_interaction_check_mode":
			#print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction][1][1][0][0])
			print(" les check repair ", data_that_is_send[data_set_name]["instructions_analiser"][instruction]["lines_parsed"][1][0])
			type_of_container = data_that_is_send[data_set_name]["instructions_analiser"][instruction]["lines_parsed"][1][0][0]
			data_sending_mutex.unlock()
			return type_of_container
#		elif data_that_is_send[data_set_name]["instructions_analiser"][instruction][0][1][0] == "set_the_scene":
#			print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction])

	# "set_interaction_check_mode"
	
	
	data_sending_mutex.unlock()


func check_scene_container(data_set_name):
	var type_of_container : String
	data_sending_mutex.lock()
	for instruction in data_that_is_send[data_set_name]["instructions_analiser"]:
		#print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction][0][1][0])#, data_that_is_send[data_set_name]["instructions_analiser"][instruction])
		if data_that_is_send[data_set_name]["instructions_analiser"][instruction]["first_line"][1][0] == "set_the_scene":
			#print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction][1][1][0][0])
			print(" les check repair ", data_that_is_send[data_set_name]["instructions_analiser"][instruction]["lines_parsed"][1][0])
			type_of_container = data_that_is_send[data_set_name]["instructions_analiser"][instruction]["lines_parsed"][1][0][0]
			
			data_sending_mutex.unlock()
			return type_of_container
#		elif data_that_is_send[data_set_name]["instructions_analiser"][instruction][0][1][0] == "set_the_scene":
#			print(" les check that instruction ", data_that_is_send[data_set_name]["instructions_analiser"][instruction])

	# "set_interaction_check_mode"
	
	
	data_sending_mutex.unlock()



####################
# Store Data
#
#  .M"""bgd mm                               `7MM"""Yb.            mm            
# ,MI    "Y MM                                 MM    `Yb.          MM            
# `MMb.   mmMMmm ,pW"Wq.`7Mb,od8 .gP"Ya        MM     `Mb  ,6"Yb.mmMMmm  ,6"Yb.  
#   `YMMNq. MM  6W'   `Wb MM' "',M'   Yb       MM      MM 8)   MM  MM   8)   MM  
# .     `MM MM  8M     M8 MM    8M""""""       MM     ,MP  ,pm9MM  MM    ,pm9MM  
# Mb     dM MM  YA.   ,A9 MM    YM.    ,       MM    ,dP' 8M   MM  MM   8M   MM  
# P"Ybmmd"  `Mbmo`Ybmd9'.JMML.   `Mbmmd'     .JMMmmmdP'   `Moo9^Yo.`Mbmo`Moo9^Yo.
#
# Store Data
####################

####################
# Connect
#
#   .g8"""bgd                                                  mm    
# .dP'     `M                                                  MM    
# dM'       ` ,pW"Wq.`7MMpMMMb.  `7MMpMMMb.  .gP"Ya   ,p6"bo mmMMmm  
# MM         6W'   `Wb MM    MM    MM    MM ,M'   Yb 6M'  OO   MM    
# MM.        8M     M8 MM    MM    MM    MM 8M"""""" 8M        MM    
# `Mb.     ,'YA.   ,A9 MM    MM    MM    MM YM.    , YM.    ,  MM    
#   `"bmmmd'  `Ybmd9'.JMML  JMML..JMML  JMML.`Mbmmd'  YMbmd'   `Mbmo 
#
# Connect
####################

####################
# Disconnect
#                ,,                                                                           
# `7MM"""Yb.     db                                                                     mm    
#   MM    `Yb.                                                                          MM    
#   MM     `Mb `7MM  ,pP"Ybd  ,p6"bo   ,pW"Wq.`7MMpMMMb.  `7MMpMMMb.  .gP"Ya   ,p6"bo mmMMmm  
#   MM      MM   MM  8I   `" 6M'  OO  6W'   `Wb MM    MM    MM    MM ,M'   Yb 6M'  OO   MM    
#   MM     ,MP   MM  `YMMMa. 8M       8M     M8 MM    MM    MM    MM 8M"""""" 8M        MM    
#   MM    ,dP'   MM  L.   I8 YM.    , YA.   ,A9 MM    MM    MM    MM YM.    , YM.    ,  MM    
# .JMMmmmdP'   .JMML.M9mmmP'  YMbmd'   `Ybmd9'.JMML  JMML..JMML  JMML.`Mbmmd'  YMbmd'   `Mbmo 
# 
# Disconnect
####################


####################
#
# JSH Ethereal Queue
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓        
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┃┃┓┏┏┓┓┏┏┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┗┻┗┻┗ ┗┻┗ 
#       888 oo     .d8P  888     888         
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Queue
#
####################

# Add to Queue
# Check Queue
# Modify Queue
# Process Queue


####################
# Add to Queue
#                     ,,        ,,                                                                              
#       db          `7MM      `7MM        mm                  .g8""8q.                                          
#      ;MM:           MM        MM        MM                .dP'    `YM.                                        
#     ,V^MM.     ,M""bMM   ,M""bMM      mmMMmm ,pW"Wq.      dM'      `MM `7MM  `7MM  .gP"Ya `7MM  `7MM  .gP"Ya  
#    ,M  `MM   ,AP    MM ,AP    MM        MM  6W'   `Wb     MM        MM   MM    MM ,M'   Yb  MM    MM ,M'   Yb 
#    AbmmmqMA  8MI    MM 8MI    MM        MM  8M     M8     MM.      ,MP   MM    MM 8M""""""  MM    MM 8M"""""" 
#   A'     VML `Mb    MM `Mb    MM        MM  YA.   ,A9     `Mb.    ,dP'   MM    MM YM.    ,  MM    MM YM.    , 
# .AMA.   .AMMA.`Wbmd"MML.`Wbmd"MML.      `Mbmo`Ybmd9'        `"bmmd"'     `Mbod"YML.`Mbmmd'  `Mbod"YML.`Mbmmd' 
#                                                                 MMb                                           
#                                                                  `bood'                                       
# Add to Queue
####################


####################
# JSH Ethereal Queue
func three_stages_of_creation(data_set_name):
	#check_stuff_again.append(data_set_name)
	
	print(" delta message start 00")
	#if array_mutex_process.try_lock():
		#print(" delta message start 0E")
	#else:
		#print(" delta message start 0F")
	array_mutex_process.lock()
	#print(" catch : " , list_of_sets_to_create, " and " , curent_queue)
	#if active_record_sets.has("singular_lines_"):
		#print(" catch yes it does have")
		#if active_record_sets["singular_lines_"].is_empty():
			#print(" catch it is empty")
	#
	for current_sets_to_create in list_of_sets_to_create:
		if current_sets_to_create[0] == data_set_name:
			array_mutex_process.unlock()
			return
		elif current_sets_to_create[0].begins_with(data_set_name):
			array_mutex_process.unlock()
			return
	array_mutex_process.unlock()
	print(" delta message start 01")
	var current_stage_of_creation : int = 0
	var first_stage_bool : int = 0
	var second_stage_bool : int = 0
	var third_stage_bool : int = 0
	var fourth_stage_bool : int = 0
	var fifth_stage_bool : int = 0
	var sixth_stage_bool : int = 0
	var seventh_stage_bool : int = 0
	var eight_stage_bool : int = 0
	var nineth_stage_bool : int = 0
	
	array_mutex_process.lock()
	print(" delta message start 02")
	#print(" delta message start we start three stage sof creation inside some mutex lock ")
	
	list_of_sets_to_create.append([data_set_name, current_stage_of_creation, first_stage_bool, second_stage_bool, third_stage_bool, fourth_stage_bool, fifth_stage_bool, sixth_stage_bool, seventh_stage_bool, eight_stage_bool, nineth_stage_bool])
	array_mutex_process.unlock()
	print(" delta message start 03")
	handle_creation_task(data_set_name)
####################


####################
# Check Queue                                                                                                    
#               ,,                                                                                         
#   .g8"""bgd `7MM                       `7MM            .g8""8q.                                          
# .dP'     `M   MM                         MM          .dP'    `YM.                                        
# dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'    dM'      `MM `7MM  `7MM  .gP"Ya `7MM  `7MM  .gP"Ya  
# MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y       MM        MM   MM    MM ,M'   Yb  MM    MM ,M'   Yb 
# MM.           MM    MM 8M"""""" 8M       MM;Mm       MM.      ,MP   MM    MM 8M""""""  MM    MM 8M"""""" 
# `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.     `Mb.    ,dP'   MM    MM YM.    ,  MM    MM YM.    , 
#   `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.      `"bmmd"'     `Mbod"YML.`Mbmmd'  `Mbod"YML.`Mbmmd' 
#                                                            MMb                                           
#                                                             `bood'                                       
# Check Queue
####################


func check_if_we_are_adding_container(path_of_the_node):
	print(" we must learn abortion hehe ", path_of_the_node)
	# singular_lines_container
	#var original_name = "singular_lines_container"
	var name_parts = path_of_the_node.split("_")  # Returns a PackedStringArray

	# Convert to a regular Array to use pop_back()
	var modifiable_parts = Array(name_parts) 
	modifiable_parts.pop_back()  # Remove last element

	# Merge back into a string
	var new_name = "_".join(modifiable_parts)

	print(" we must learn abortion hehe ",new_name)  # Output: "singular_lines"
	
	array_mutex_process.lock()
	for current_sets_to_create in list_of_sets_to_create:
		if current_sets_to_create[0] == new_name:
			array_mutex_process.unlock()
			return false
		elif current_sets_to_create[0].begins_with(new_name):
			array_mutex_process.unlock()
			return false
	array_mutex_process.unlock()
	return true



func check_if_already_loading_one(set_name):
	array_mutex_process.lock()
	for current_sets_to_create in list_of_sets_to_create:

		if current_sets_to_create[0] == set_name:
			array_mutex_process.unlock()
			return true

		elif current_sets_to_create[0].begins_with(set_name):
			array_mutex_process.unlock()
			return true

	array_mutex_process.unlock()
	return false


# the set first contact with existnce
####################
# JSH Ethereal Engine check stuff before we proceed
func the_current_state_of_tree(set_name_now, the_state):
	
	mutex_for_container_state.lock()
	if current_containers_state.has(set_name_now):
		current_containers_state[set_name_now]["status"] = the_state
		print("taskkkkl it has it already ", set_name_now, " its status : " , the_state)
	else:
		print("taskkkkl does not have ", set_name_now, " its status : " , the_state)
		current_containers_state[set_name_now] = {
			"status" = the_state
		}
	mutex_for_container_state.unlock()
	if the_state == 1:
		print(" to be loaded ")
		
		load_queue_mutex.lock()
		
		if load_queue.has(set_name_now):
			
			print(" we had it before, to be loaded : ", set_name_now)
		else:
			load_queue[set_name_now] = {}
			print(" we have not loaded it before : ", set_name_now)
		
		load_queue_mutex.unlock()
		
	if the_state == -1:
		print(" to be unloaded ")
		
		unload_queue_mutex.lock()
		
		if unload_queue.has(set_name_now):
			print(" we had it before, to be unloaded : ", set_name_now)
		else:
			unload_queue[set_name_now] = {}
			print(" we have not unloaded it before")
		
		unload_queue_mutex.unlock()
####################


####################
# Modify Queue                                                                                                               
#                                 ,,    ,,      ,...                                                                 
# `7MMM.     ,MMF'              `7MM    db    .d' ""               .g8""8q.                                          
#   MMMb    dPMM                  MM          dM`                .dP'    `YM.                                        
#   M YM   ,M MM  ,pW"Wq.    ,M""bMM  `7MM   mMMmm`7M'   `MF'    dM'      `MM `7MM  `7MM  .gP"Ya `7MM  `7MM  .gP"Ya  
#   M  Mb  M' MM 6W'   `Wb ,AP    MM    MM    MM    VA   ,V      MM        MM   MM    MM ,M'   Yb  MM    MM ,M'   Yb 
#   M  YM.P'  MM 8M     M8 8MI    MM    MM    MM     VA ,V       MM.      ,MP   MM    MM 8M""""""  MM    MM 8M"""""" 
#   M  `YM'   MM YA.   ,A9 `Mb    MM    MM    MM      VVV        `Mb.    ,dP'   MM    MM YM.    ,  MM    MM YM.    , 
# .JML. `'  .JMML.`Ybmd9'   `Wbmd"MML..JMML..JMML.    ,V           `"bmmd"'     `Mbod"YML.`Mbmmd'  `Mbod"YML.`Mbmmd' 
#                                                    ,V                MMb                                           
#                                                 OOb"                  `bood'                                       
# Modify Queue
####################


####################
# JSH Ethereal Queue
func change_creation_set_name(record_type, additional_set_name_):
	print()
	##hmm, first we lock that mutex
	## now probably for set in set_list
	## if record_type == set_list[0]
	## set_list[0] = additional_set_name
	
	
	## at the end we unlock that mutex
	
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == record_type:
			number_thingy[0] = additional_set_name_
			break
	array_mutex_process.unlock()
####################

####################
# Process Queue                                                                                                                   
# `7MM"""Mq.                                                           .g8""8q.                                          
#   MM   `MM.                                                        .dP'    `YM.                                        
#   MM   ,M9 `7Mb,od8 ,pW"Wq.   ,p6"bo   .gP"Ya  ,pP"Ybd ,pP"Ybd     dM'      `MM `7MM  `7MM  .gP"Ya `7MM  `7MM  .gP"Ya  
#   MMmmdM9    MM' "'6W'   `Wb 6M'  OO  ,M'   Yb 8I   `" 8I   `"     MM        MM   MM    MM ,M'   Yb  MM    MM ,M'   Yb 
#   MM         MM    8M     M8 8M       8M"""""" `YMMMa. `YMMMa.     MM.      ,MP   MM    MM 8M""""""  MM    MM 8M"""""" 
#   MM         MM    YA.   ,A9 YM.    , YM.    , L.   I8 L.   I8     `Mb.    ,dP'   MM    MM YM.    ,  MM    MM YM.    , 
# .JMML.     .JMML.   `Ybmd9'   YMbmd'   `Mbmmd' M9mmmP' M9mmmP'       `"bmmd"'     `Mbod"YML.`Mbmmd'  `Mbod"YML.`Mbmmd' 
#                                                                          MMb                                           
#                                                                           `bood'                                       
# Process Queue
####################


####################
# JSH Ethereal Queue
func process_creation_further(record_type : String, amount : int):
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == record_type:
			number_thingy[1] +=amount
			break
	array_mutex_process.unlock()
####################

# Check if creation is possible based on input
####################
# JSH Ethereal Queue
func whip_out_set_by_its_name(set_name_to_test) -> CreationStatus:
	# Input validation
	if not set_name_to_test is String:
		print("Invalid input type for set_name_to_test: ", typeof(set_name_to_test))
		return CreationStatus.INVALID_INPUT
	if set_name_to_test.is_empty():
		print("Set name cannot be empty")
		return CreationStatus.INVALID_INPUT
	# Check if creation is possible (add your conditions)
	if not is_creation_possible():
		print("Creation not possible at this time")
		return CreationStatus.LOCKED
	# Attempt creation
	var task_result = create_new_task("three_stages_of_creation", set_name_to_test)
	if task_result:
		return CreationStatus.SUCCESS
	else:
		return CreationStatus.ERROR
####################


####################
# JSH Ethereal Queue
func attempt_creation(set_name: String) -> CreationState:
	if not is_creation_possible():
		return CreationState.LOCKED
		
	#array_mutex_process.lock()
	#list_of_sets_to_create.append(set_name)
	#array_mutex_process.unlock()
	print(" attempt creation list_of_sets_to_create ")
	return CreationState.POSSIBLE
####################

####################
# JSH Ethereal Queue
func queue_pusher_adder(task):
	var method_task = task.target_method
	var completion_time = Time.get_ticks_msec()
	var task_id = str(task.tag)
	var target_argument = task.target_argument

	if task_status.has(task_id):
		var duration = completion_time - task_status[task_id]["start_time"]
		if duration > 1000: # 1 second timeout
			handle_task_timeout(task_id)
	
	#print(" taskkkkk : ", method_task)
	## Process task
	#match method_task:
		#"three_stages_of_creation":
			#handle_creation_task(target_argument)
			#mutex_for_trickery.lock()
			#menace_tricker_checker = 1
			#mutex_for_trickery.unlock()
		#"unload_container":
			#handle_unload_task(target_argument)
			#mutex_for_trickery.lock()
			#menace_tricker_checker = 1
			#mutex_for_trickery.unlock()
		#"the_finisher_for_nodes":
			#print(" this means, the node is being finished to be whip out baby ")
####################


#var check_stuff_again : Array = []



####################
# JSH Ethereal Queue
func check_currently_being_created_sets():
	print(" delta message start hmm we check if we can push further  ")
	print(" we check em again, are they stuck?")
	array_mutex_process.lock()
	mutex_for_container_state.lock()
	for set_to_create in list_of_sets_to_create:
		print(" we have that for example : ", set_to_create)
		print(" it can even be seen as [0] ", set_to_create[0])
		var name_of_set = set_to_create[0]
		var counter_now : int = -1
		var dumb_counter_0 : int = 0
		var dumb_counter_1 : int = 0
		if current_containers_state.has(name_of_set):
			print(" it has something 0 ", counter_now)
			counter_now = 0
		if current_containers_state.has(name_of_set + "_"):
			print(" it has something 1")
			if counter_now == -1:
				name_of_set = name_of_set + "_"
				counter_now = -2
		# is it atelaset container, not containter or whatever i tried to write
		if current_containers_state.has(name_of_set + "container"):
			print(" it has something 2")
			if counter_now == -2:
				name_of_set = name_of_set + "container"
		for singular_info in set_to_create:
			if singular_info is int:
				print(" singular_info ", singular_info)
				if dumb_counter_0 == 0:
					dumb_counter_0 +=1
				else:
					dumb_counter_0 +=1
					if singular_info != 0:
						dumb_counter_1 +=1
		print(" checky chicky : " , name_of_set , " and that counter : " , counter_now , " , " , dumb_counter_0 , " , " , dumb_counter_1)
		load_queue_mutex.lock()
		if load_queue.has(name_of_set):
			print(" we have it already in load queue")
			if load_queue[name_of_set].has("metadata"):
				print(" it already had it ")
			else:
				load_queue[name_of_set]["metadata"] = {}
				#load_queue[name_of_set]["metadata"]["status"]
		if dumb_counter_1 >= 1:
			print(" we are somewhere, here something started the creation ")
			if load_queue.has(name_of_set):
				if load_queue[name_of_set].has("metadata"):
					if load_queue[name_of_set]["metadata"].has("status"):
						load_queue[name_of_set]["metadata"]["status"] = int(1)
		else:
			if load_queue.has(name_of_set):
				if load_queue[name_of_set].has("metadata"):
					if load_queue[name_of_set]["metadata"].has("status"):
						print(" that thing have not started its creation ")
						load_queue[name_of_set]["metadata"]["status"] = int(0)
		print(" cheecku chicku : load_queue : " , load_queue)
		load_queue_mutex.unlock()
	array_mutex_process.unlock()
	mutex_for_container_state.unlock()
####################



####################
# JSH Ethereal Queue
func process_stages():
	#print(" delta issue  process stages 0 " , list_of_sets_to_create, curent_queue)
	array_mutex_process.lock()
	for sets_to_create in list_of_sets_to_create:
		var dataset = sets_to_create[0]
		var dataset_name = sets_to_create[0]
		var current_stage = sets_to_create[1]
		match current_stage:
			0:
				if sets_to_create[1] == 0 and curent_queue[0][0] == 0 and sets_to_create[2] == 0:
					curent_queue[0][0] = 1
					sets_to_create[2] = 1
					print(" creation 00 ", dataset_name)
					first_stage_of_creation_(dataset_name, sets_to_create)
			1:
				if sets_to_create[1] == 1 and curent_queue[1][0] == 0 and sets_to_create[3] == 0:
					sets_to_create[3] = 1
					curent_queue[0][0] = 0
					curent_queue[1][0] = 1
					print(" creation 01 ", dataset_name)
					second_stage_of_creation_(dataset_name, sets_to_create)
			2:
				if sets_to_create[1] == 2 and curent_queue[2][0] == 0 and sets_to_create[4] == 0:
					curent_queue[1][0] = 0 
					curent_queue[2][0] = 1
					sets_to_create[4] = 1
					print(" creation 02 ", dataset_name)
					third_stage_of_creation_(dataset_name, sets_to_create)
			3:
				if sets_to_create[1] == 3 and curent_queue[3][0] == 0 and sets_to_create[5] == 0:
					sets_to_create[5] = 1
					curent_queue[2][0] = 0
					curent_queue[3][0] = 1
					fourth_impact_of_creation_(dataset_name, sets_to_create)
			4:
				if sets_to_create[1] == 4 and curent_queue[4][0] == 0 and sets_to_create[6] == 0:
					sets_to_create[6] = 1
					curent_queue[3][0] = 0
					curent_queue[4][0] = 1
					fifth_impact_of_creation_(dataset_name, sets_to_create)
			5:
				if sets_to_create[1] == 5 and curent_queue[5][0] == 0 and sets_to_create[7] == 0:
					sets_to_create[7] = 1
					curent_queue[4][0] = 0
					curent_queue[5][0] = 1
					sixth_impact_of_creation(dataset_name, sets_to_create)
					#list_of_sets_to_create.erase(sets_to_create)
					#if list_of_sets_to_create.size() == 0:
						#curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
			6:
				if curent_queue[5][0] == 1:
					curent_queue[5][0] = 0
				
				if curent_queue[0][0] == 1:
					curent_queue[0][0] = 0
				
				list_of_sets_to_create.erase(sets_to_create)
				
				if list_of_sets_to_create.size() == 0:
					curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
			7:
				if curent_queue[4][0] == 1:
					curent_queue[4][0] = 0
				
				if curent_queue[0][0] == 1:
					curent_queue[0][0] = 0
				
				list_of_sets_to_create.erase(sets_to_create)
				if list_of_sets_to_create.size() == 0:
					curent_queue = [[0], [0], [0], [0], [0], [0], [0], [0], [0], [0]] 
					the_menace_checker = 0
	#print(" delta issue  process stages 1 ")
	array_mutex_process.unlock()
####################






# the steps of creation, functions to send data further
####################
# JSH Ethereal Queue
func first_stage_of_creation_(data_set_name_0, sets_to_create_0):
	#print(" the task dilema 0 ")
	create_new_task("initialize_menu", sets_to_create_0[0])
####################


####################
# JSH Ethereal Queue
func second_stage_of_creation_(data_set_name_1, sets_to_create_1):
	create_new_task("second_impact_for_real", sets_to_create_1[0])
####################

####################
# JSH Ethereal Queue
func second_impact_for_real(set_to_do_thingy):
	#print(" the task dilema 1 ")
	var records_set_name_0 = set_to_do_thingy + "_"
	var container_name_for_array = container_finder(records_set_name_0)
	array_counting_mutex.lock()
	if !array_for_counting_finish.has(container_name_for_array):
		array_for_counting_finish[container_name_for_array] = {}
	array_counting_mutex.unlock()
	#print(" the task dilema 11 ")
	active_r_s_mut.lock()
	var safe_activ_record_set = active_record_sets
	active_r_s_mut.unlock()
	#print(" the task dilema 12 ")
	process_active_records_for_tree(safe_activ_record_set, records_set_name_0, container_name_for_array)
	#print(" the task dilema 12b ")
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == set_to_do_thingy:
			number_thingy[1] +=1
	array_mutex_process.unlock()
	#print(" the task dilema 13 ")
####################
	


####################
# JSH Ethereal Queue
func third_stage_of_creation_(data_set_name_2, sets_to_create_2):
	create_new_task("third_impact_right_now", sets_to_create_2[0])
####################

####################
# JSH Ethereal Queue
func third_impact_right_now(data_set_thingiess):
	#print(" the task dilema 2 ")
	var records_set_name_1 = data_set_thingiess + "_"
	load_cached_data(records_set_name_1)
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == data_set_thingiess:
			number_thingy[1] +=1
	array_mutex_process.unlock()
####################


####################
# JSH Ethereal Queue
func fourth_impact_of_creation_(data_set_name_3, sets_to_create_3):
	create_new_task("fourth_impact_right_now", data_set_name_3)
####################

####################
# JSH Ethereal Queue
func fourth_impact_right_now(data_set_nameeee):
	#print(" the task dilema 3 ")
	var records_set_name_1 = data_set_nameeee + "_"
	load_cached_data_second_impact(records_set_name_1)
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == data_set_nameeee:
			number_thingy[1] +=1
	array_mutex_process.unlock()
####################

####################
# JSH Ethereal Queue
func fifth_impact_of_creation_(data_set_name_4, sets_to_create_4):
	create_new_task("fifth_impact_right_now", data_set_name_4)
####################

####################
# JSH Ethereal Queue
func fifth_impact_right_now(data_set_nameeeeee):
	#print(" the task dilema 4 ")
	#	var records_set_name_2 = data_set_nameeeeee + "_"
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == data_set_nameeeeee:
			print(" fifth imnpact list of sets to create we plus one " , data_set_nameeeeee)
			number_thingy[1] +=1
	array_mutex_process.unlock()
####################

# send_datapoint_data()
# process_datapoint_transfer()
# finalize_datapoint_handling()

func sixth_impact_of_creation(data_set_name_6, sets_to_create_6):
	create_new_task("sixth_impact_right_now", data_set_name_6)


func sixth_impact_right_now(data_set_name_here):
	var data_set_name_here_ = data_set_name_here + "_"
	var container_name : String
	var data_point_path : String
	# lets take some data
	data_sending_mutex.lock()
	
	## it seems to be mixed?
	container_name = data_that_is_send[data_set_name_here_]["metadata"]["datapoint_path"]# = path_for_datapoint
	data_point_path = data_that_is_send[data_set_name_here_]["metadata"]["container_path"]# = container_name
	
	data_sending_mutex.unlock()
	# lets put in some data
	# mayve before that, we can find more data? whats is the type of container?
	# does it have main scene to set?
	var type_of_container = check_type_of_container(data_set_name_here_)
	var main_scene_to_set = check_scene_container(data_set_name_here_)
	mutex_for_container_state.lock()
	
	if current_containers_state.has(data_set_name_here):
		current_containers_state[data_set_name_here]["container"] = container_name
		current_containers_state[data_set_name_here]["datapoint_path"] = data_point_path
		if type_of_container != null:
			print(" les check stuff, what is it? ", type_of_container)
			current_containers_state[data_set_name_here]["container_type"] = type_of_container
			
		if main_scene_to_set != null:
			print(" les check stuff, what is it? ", main_scene_to_set)
			current_containers_state[data_set_name_here]["main_scene"] = main_scene_to_set
		#print(" current_containers_state : " , current_containers_state)
	## maybe it is multi kind of thingy?
	else:
		var set_name_minus_one = data_set_name_here.substr(0, data_set_name_here.length() -1)
		if current_containers_state.has(set_name_minus_one):
			print(" it is multi type stuff ")
	mutex_for_container_state.unlock()
	
	#if type_of_container == null:
	#	print(" les check stuff i guess it is null")
	#else:
	#	print(" les check stuff, what is it? ", type_of_container)
	if type_of_container == null:
		print(" type_of_container null ")
	elif type_of_container == "single":
		print(" type_of_container single ")
	elif type_of_container == "multi":
		print(" type_of_container multi ")
	
	
	
	array_mutex_process.lock()
	for number_thingy in list_of_sets_to_create:
		if number_thingy[0] == data_set_name_here:
			#print(" sixth imnpact list of sets to create we plus one " , data_set_name_here)
			number_thingy[1] +=1
	array_mutex_process.unlock()
	
	## lets first just put that container name, into a set name, in the thingy that we check in process delta

####################
#
# JSH Ethereal Records System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┓        ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣┫┏┓┏┏┓┏┓┏┫┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┛┗┗ ┗┗┛┛ ┗┻┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                      ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Records System
####################

# Check Records
# Create Records
# Load Records
# Move Records
# Change Records

####################
# Check Records
#               ,,                                                                                         ,,          
#   .g8"""bgd `7MM                       `7MM          `7MM"""Mq.                                        `7MM          
# .dP'     `M   MM                         MM            MM   `MM.                                         MM          
# dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'      MM   ,M9  .gP"Ya   ,p6"bo   ,pW"Wq.`7Mb,od8  ,M""bMM  ,pP"Ybd 
# MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y         MMmmdM9  ,M'   Yb 6M'  OO  6W'   `Wb MM' "',AP    MM  8I   `" 
# MM.           MM    MM 8M"""""" 8M       MM;Mm         MM  YM.  8M"""""" 8M       8M     M8 MM    8MI    MM  `YMMMa. 
# `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.       MM   `Mb.YM.    , YM.    , YA.   ,A9 MM    `Mb    MM  L.   I8 
#   `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.    .JMML. .JMM.`Mbmmd'  YMbmd'   `Ybmd9'.JMML.   `Wbmd"MML.M9mmmP' 
#
####################

# check if in active
# check if in cached
# check if in archived
# check if specific Records, somewhere, are ok
# if their parts have bare minimum to appear, or if they have too much


## needed functions#

	#active_r_s_mut.lock()
	#cached_r_s_mutex.lock()

## check if active has that set
## check if active set is empty
# -1 = missing, 0 = empty, 1 = it is here
func check_record_in_active(records_set_name):
	active_r_s_mut.lock()
	# -1 = dont have that key, it is empty
	var active_int : int = -1
	if active_record_sets.has(records_set_name):
		# 0 = has that key
		active_int = 0
		if !active_record_sets[records_set_name].is_empty():
			# 1 = has that key, not empty
			active_int = 1
	active_r_s_mut.unlock()
	return active_int


## check if cache has that set
## check if cached set is empty
func check_record_in_cached(records_set_name):
	cached_r_s_mutex.lock()
	# -1 = dont have that key, it is empty
	var cached_int : int = -1
	if cached_record_sets.has(records_set_name):
		# 0 = has that key
		cached_int = 0
		if !cached_record_sets[records_set_name].is_empty():
			# 1 = has that key, not empty
			cached_int = 1
	cached_r_s_mutex.unlock()
	return cached_int


## check max amount of that set on the scene
## check current amount of that set on scene
func check_set_limit(records_set_name):
	#var container_count_int = -1
	var currently_checked_set : int = -1
	var set_limit = BanksCombiner.dataSetLimits
	if set_limit.has(records_set_name):
		currently_checked_set = set_limit[records_set_name]
	return currently_checked_set


## check current containers amount
func check_current_set_container_count(record_set_name):
	active_r_s_mut.lock()
	var current_container_count : int = -1
	## if it got set
	if active_record_sets.has(record_set_name):
		## if it got metadata
		if active_record_sets[record_set_name].has("metadata"):
			## if it has container count
			if active_record_sets[record_set_name]["metadata"].has("container_count"):
				current_container_count = active_record_sets[record_set_name]["metadata"]["container_count"]
	active_r_s_mut.unlock()
	return current_container_count


## check set type, single, multi, duplicate
## 0 = single, 1 = multi, 2 = duplicate, -1 for now means we dont have data for it
func check_record_set_type(record_set_name):
	var currently_checked_set : int = -1
	var set_type = BanksCombiner.data_set_type
	if set_type.has(record_set_name):
		currently_checked_set = set_type[record_set_name]
	
	var set_type_string : String = ""
	if currently_checked_set == -1:
		print( " we didnt find it, lets put a 0 here ")
		currently_checked_set = 0
		set_type_string = "single"
	elif currently_checked_set == 0:
		print(" single ")
		set_type_string = "single"
	elif currently_checked_set == 1:
		print(" multi ")
		set_type_string = "multi"
	elif currently_checked_set == 2:
		print(" duplicate")
		set_type_string = "duplicate"
	
	return set_type_string


# containers
####################
# JSH Ethereal Engine check stuff before we proceed
func check_if_first_time(set_name_first, the_current_of_energy):
	mutex_containers.lock()
	print(" set_name_first  : " , set_name_first , " the_current_of_energy ", the_current_of_energy , " list_of_containers " , list_of_containers)
	if list_of_containers.has(set_name_first):
		print(" it have it already")
	else:
		list_of_containers[set_name_first] = {}
		list_of_containers[set_name_first]["status"] = the_current_of_energy
	
	list_of_containers
	mutex_containers.unlock()
####################

# records sets lists
####################
# JSH Ethereal Records System
func containers_states_checker():
	# check if we have any containers
	mutex_for_container_state.lock()
	if current_containers_state.size() > 0:
		print("checkerrr bigger list than 0 ")
		# lets add also there, new status, of what be done before
		# later if it is already in active state, and its own status, is the same, we dont need to check
		for data_sets_to_check in current_containers_state:
			print(" alkaida is calling fbi xd :  ", data_sets_to_check , ", " , current_containers_state[data_sets_to_check]["status"])
			var state_of_check_0 : int = -1
			var state_of_check_1 : int = -1
			var state_of_check_2 : int = -1
			var vector_now : Vector3i
			vector_now.x = state_of_check_0
			vector_now.y = state_of_check_1
			vector_now.z = state_of_check_2
			if !current_containers_state[data_sets_to_check].has("status_tree"):
				current_containers_state[data_sets_to_check]["status_tree"] = "pending"
				current_containers_state[data_sets_to_check]["three_i"] = vector_now
			if current_containers_state[data_sets_to_check]["status"] == -1:
				print(" we must reset the xyz thingy")
				current_containers_state[data_sets_to_check]["three_i"] = vector_now
			var set_name_plus = data_sets_to_check + "_"
			var container_name_from_data_set : String = ""
			var datapoint_node_now : Node
			var container_node_now : Node
			var data_array_now : Array = []
			var dictionary_size_now : int
			# first check if it exist in active record sets
			active_r_s_mut.lock()
			if active_record_sets.has(set_name_plus):
				var plus_records = set_name_plus + "records"
				current_containers_state[data_sets_to_check]["status_tree"] = "started_0"
				if active_record_sets[set_name_plus].has(plus_records):
					# we got active records set in that name
					current_containers_state[data_sets_to_check]["status_tree"] = "started_1"
					if active_record_sets[set_name_plus][plus_records].has("content"):
						if active_record_sets[set_name_plus][plus_records]["content"] is Array:
							print(" hmm " , active_record_sets[set_name_plus][plus_records]["content"])
							if active_record_sets[set_name_plus][plus_records]["content"] != []:
								if active_record_sets[set_name_plus][plus_records]["content"][0][0][3][0] is String:
									if active_record_sets[set_name_plus][plus_records]["content"][0][0][3][0] != "container":
										container_name_from_data_set = active_record_sets[set_name_plus][plus_records]["content"][0][0][5][0]
										current_containers_state[data_sets_to_check]["status_tree"] = "started_2"
									else:
										container_name_from_data_set = active_record_sets[set_name_plus][plus_records]["content"][0][0][6][0]
										current_containers_state[data_sets_to_check]["status_tree"] = "started_3"
								else:
									print(" FATAL KURWA ERROR, 1")
							else:
								print(" FATAL KURWA ERROR, 2",  active_record_sets[set_name_plus][plus_records]["content"])
						else:
							print(" FATAL KURWA ERROR, 3")
					else:
						print(" FATAL KURWA ERROR, VERY IMPORTANT, DUNNO WHY IT HAPPENED, OH MY ")
				else:
					print(" FATAL KURWA ERROR, 0")
				state_of_check_0 = 1
				current_containers_state[data_sets_to_check]["three_i"].x = state_of_check_0
				active_r_s_mut.unlock()
			else:
				active_r_s_mut.unlock()
				# if it should be not active, check if it has its cached version
				cached_r_s_mutex.lock()
				if cached_record_sets.has(set_name_plus):
					var plus_records = set_name_plus + "records"
					current_containers_state[data_sets_to_check]["status_tree"] = "cached_0"
					if cached_record_sets[set_name_plus].has(plus_records):
						current_containers_state[data_sets_to_check]["status_tree"] = "cached_1"
						if cached_record_sets[set_name_plus][plus_records]["content"][0][0][3][0] != "container":
							container_name_from_data_set = cached_record_sets[set_name_plus][plus_records]["content"][0][0][5][0]
							current_containers_state[data_sets_to_check]["status_tree"] = "cached_2"
						else:
							container_name_from_data_set = cached_record_sets[set_name_plus][plus_records]["content"][0][0][6][0]
							current_containers_state[data_sets_to_check]["status_tree"] = "cached_3"
					state_of_check_0 = 0
					current_containers_state[data_sets_to_check]["three_i"].x = state_of_check_0
					cached_r_s_mutex.unlock()
				else:
					cached_r_s_mutex.unlock()
			# now we have state of set having data of creation : 
			# state_of_check_0
			# 1 = active
			# 0 = cached
			
			
			#####################################################
			## split of that function needs to happen, there is some tree philosophy
			#####################################################
			
			if state_of_check_0 != -1:
				var container_name
				if container_name_from_data_set != "":
					container_name = container_name_from_data_set
				else:
					container_name = data_sets_to_check + "_container"
					# then check if it has entry in tree
				current_containers_state[data_sets_to_check]["container_name"] = container_name
					# check if the cached tree has entry
				tree_mutex.lock()
				if scene_tree_jsh.has("main_root"):
					if scene_tree_jsh["main_root"]["branches"].has(container_name):
						current_containers_state[data_sets_to_check]["status_tree"] = "started_4"
						if scene_tree_jsh["main_root"]["branches"][container_name].has("node"):
							print(" it has node, do we unload there ? nah it can go both ways")
							if is_instance_valid(scene_tree_jsh["main_root"]["branches"][container_name]["node"]):
								container_node_now = scene_tree_jsh["main_root"]["branches"][container_name]["node"]
							else:
								container_node_now = null
						else:
							container_node_now = null
							state_of_check_2 = -1
						if container_node_now:
							state_of_check_2 = 0
							current_containers_state[data_sets_to_check]["three_i"].z = state_of_check_2
							var container_name_for_trick = scene_tree_jsh["main_root"]["branches"][container_name]["name"]
							current_containers_state[data_sets_to_check]["status_tree"] = "started_5"
							var datapoint_path_now = scene_tree_jsh["main_root"]["branches"][container_name]["datapoint"]["datapoint_path"]
							datapoint_node_now = get_node(datapoint_path_now)
							if datapoint_node_now:
								# we got datapoint node for containers status first time?
								current_containers_state[data_sets_to_check]["status_tree"] = "started_6"
								state_of_check_2 = 1
								current_containers_state[data_sets_to_check]["three_i"].z = state_of_check_2
								if datapoint_node_now.has_method("check_state_of_dictionary_and_three_ints_of_doom"):
									var data_array_now_ = datapoint_node_now.check_state_of_dictionary_and_three_ints_of_doom()
									current_containers_state[data_sets_to_check]["status_tree"] = "started_7"
									if data_array_now_ != null:
										data_array_now = data_array_now_
										if data_array_now[0] is Dictionary:
											current_containers_state[data_sets_to_check]["status_tree"] = "started_8"
											state_of_check_2 = 2
											current_containers_state[data_sets_to_check]["three_i"].z = state_of_check_2
						state_of_check_1 = 1
						current_containers_state[data_sets_to_check]["three_i"].y = state_of_check_1
						tree_mutex.unlock()
					else:
						tree_mutex.unlock()
						# didnt find it on main tree, lets check cached tree
						cached_tree_mutex.lock()
						if cached_jsh_tree_branches.has(container_name):
							current_containers_state[data_sets_to_check]["status_tree"] = "cached_4"
							state_of_check_1 = 0
							current_containers_state[data_sets_to_check]["three_i"].y = state_of_check_1
							cached_tree_mutex.unlock()
						else:
							mutex_for_trickery.lock()
							menace_tricker_checker = 1
							mutex_for_trickery.unlock()
							cached_tree_mutex.unlock()
				else:
					current_containers_state[data_sets_to_check]["status_tree"] = "fatal_kurwa_error"
					tree_mutex.unlock()
			if state_of_check_1 != -1:
				if state_of_check_2 != -1:
					print(" we even got nodes to tinker with")
			print(" alkaida is calling fbi xd :  ", data_sets_to_check , ", " , current_containers_state[data_sets_to_check]["three_i"])
	mutex_for_container_state.unlock()
	mutex_for_trickery.lock()
	if menace_tricker_checker == 2:
		print(" check is finished and we didnt get interupted while doing so kurwa ")
		menace_tricker_checker = 3
	mutex_for_trickery.unlock()
####################

####################
# JSH Ethereal Records System
func the_basic_sets_creation():
	check_if_every_basic_set_is_loaded()
	if test_of_set_list_flow.size() > 0:
		print(" it is bigger than 0, we have sets to create ")
		#test_of_set_list_flow.pop_front()
####################

####################
# JSH Ethereal Records System
func get_every_basic_set():
# BanksCombiner.data_sets_names "base_"
# BanksCombiner.data_sets_names_0 "base"
	return BanksCombiner.data_sets_names_0
####################

####################
# JSH Ethereal Records System
func get_every_basic_set_():
# BanksCombiner.data_sets_names "base_"
# BanksCombiner.data_sets_names_0 "base"
	return BanksCombiner.data_sets_names
####################

var test_of_set_list_flow : Array = []

####################
# JSH Ethereal Records System
func check_if_every_basic_set_is_loaded():
	var set_to_pull_now = JSH_records_system.check_basic_set_if_loaded()
	if set_to_pull_now:
		test_of_set_list_flow.append(set_to_pull_now)
		print(" set to pull now is : " , set_to_pull_now)
	# first we gotta check records set manager
	# then if we found something new to whip out, we take it, and add to our tasker
####################


####################
# JSH Ethereal Records System
func container_finder(set_name):
	var wordly_word = set_name + BanksCombiner.data_names_0[0]
	active_r_s_mut.lock()
	var container_name_now = "akashic_records"
	if active_record_sets.has(set_name):
		if active_record_sets[set_name][wordly_word].has("content") and active_record_sets[set_name][wordly_word]["content"] != []:
		# it is content = [] so it is still empty
			active_record_sets[set_name][wordly_word]
			container_name_now = active_record_sets[set_name][wordly_word]["content"][0][0][6][0]#.duplicate(true)
	active_r_s_mut.unlock()
	var container_splitter = container_name_now.split("/")
	if container_splitter.size() > 1:
		container_name_now = container_splitter[0]
	return container_name_now
####################





####################
# JSH Ethereal Records System
func initialize_menu(record_type: String):
	## i guess we can split this baby further, to make it way, way easier for my eyes and mind and brain and soul hehe
	## we shall first check if active and cached had these sets
	## then we shall check, that if this set can appear, if it is already at the scene
	var records_set_name = record_type + "_"
	var use_active : bool = false
	var use_cached : bool = false
	var can_be_created : bool = false
	## new functions, just check it all at once
	var state_of_active_check = check_record_in_active(records_set_name)
	var state_of_cached_check = check_record_in_cached(records_set_name)
	var set_limit_check = check_set_limit(records_set_name)
	var current_container_count_check = check_current_set_container_count(records_set_name)
	var record_set_type_check = check_record_set_type(records_set_name)
	
	print("catch current_container_count_check " , current_container_count_check, " in set " , record_type)
	#var type_of_data : int
	print("catch initalize memories ! 0 : " , record_type)
	#print(" new checkers in initia menu : " ,state_of_active_check , " , ", state_of_cached_check, " , " , set_limit_check , " , " , current_container_count_check , " , " , record_set_type_check)
	
	## lets change it to simple trues and falses
	if state_of_active_check == 1:
		print("catch active is there ")
		use_active = true
		
	if state_of_cached_check == 1:
		print("catch cached have it ")
		use_cached = true
	
	if set_limit_check > current_container_count_check:
		print("catch we can still create ")
		can_be_created = true
	## to this point
	
	## now lets use some ands or whatever
	if can_be_created == true and use_active == false and use_cached == false:
		print("catch new checkers in initia menu new set must be created")
		## this one just add number to queue on its own
		create_record_from_script(record_type)
		#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
		
		
	elif can_be_created == true and use_active == true and use_cached == false:
		print("catch new checkers in initia menu it is in active, probably additional set can be created ", record_set_type_check)
		## for now lets just turn it off, need to make new recreator
		## first we need two new names, previous additional set name, and current additional set name
		## maybe we could just, i dunno, sent main name, and number?
		##
		## current_container_count_check
		## and
		##
		var additional_records_set_name = record_type + str(current_container_count_check)
		var aditional_cached = check_record_in_cached(additional_records_set_name)
		if aditional_cached == 1:
			print(" we had it in cache ")
			load_cached_record_to_active(additional_records_set_name)
			change_creation_set_name(record_type, additional_records_set_name)
			process_creation_further(additional_records_set_name, 1)
		else:
			## okay, i guess we have the name for record
			
			## but i think, we will just send
			## record_type
			## and
			## current_container_count_check
			## oh and a type of it, multi or duplicate
			## record_set_type_check
			print("catch some else ")
			## to the new recreator
			create_additional_record_set(record_type, current_container_count_check)
			active_record_sets[records_set_name]["metadata"]["container_count"] +=1
			## dunno if i need it here, probably that name change
			## well we change name atleast
			change_creation_set_name(record_type, additional_records_set_name)
			## then we abandon the part
			process_creation_further(additional_records_set_name, 1)
		
		
	elif can_be_created == true and use_active == false and use_cached == true:
		print("catch new checkers in initia menu it is in cached, we must move it around")
		load_cached_record_to_active(records_set_name)
		process_creation_further(record_type, 1)
		
	elif can_be_created == false:
		print("catch new checkers in initia menu we hit limit, cannot create more")
		process_creation_further(record_type, 7)
	
	## dunno what else can happen, 
		#
	#
	#var use_cache = false
	#var already_exists = false
	#
	#active_r_s_mut.lock()
	#cached_r_s_mutex.lock()
	### IF THAT RECORD IS IN ACTIVE, SO IT IS AT SCENE ALREADY
	#if active_record_sets.has(records_set_name):
		#print(" initalize memories ! 0A : " , record_type)
		#already_exists = true
		### IF IT HAS METADATA KEY
		#if active_record_sets[records_set_name].has("metadata"):
			#print(" initalize memories ! 0B : " , record_type)
			### IF CONTAINER COUNT CURRENTLY, EQUAL MAX AMOUNT OF THAT SET
			### IN FUTURE TO THINK OF SAVE FILES AND NEW CONSTRUCTS, WE MUST INCLUDE THE MAX AMOUNT IN RECORD ITSELF
			#if active_record_sets[records_set_name]["metadata"]["container_count"] == BanksCombiner.dataSetLimits[records_set_name]:
				#print(" initalize memories ! 0C : " , record_type)
				#active_r_s_mut.unlock()
				#cached_r_s_mutex.unlock()
				#
				#process_creation_further(record_type, 6)
				#return
			#
			### IF WE ALREADY HAVE JUST ONE SET PULLED, AND DIDNT HIT MAX
			#if active_record_sets[records_set_name]["metadata"]["container_count"] == 1:
				#var number_of_set = active_record_sets[records_set_name]["metadata"]["container_count"]
				#var additional_set_name = record_type + str(number_of_set)
				#var additional_set_name_ = additional_set_name + "_"
				### IF THE ACTIVE RECORDS SET DOES NOT HAVE YET, THAT ADDITIONAL THINGY
				#if !active_record_sets.has(additional_set_name_):
					### IF CACHED HAD IT, WE TAKE IT FROM HERE, AND CONTINUE
					#if cached_record_sets.has(additional_set_name_):
						##print(" initalize memories ! :  but cached had copy of that one? ")
						##active_record_sets[additional_set_name_] = cached_record_sets[additional_set_name_]
						##cached_record_sets.erase(additional_set_name_)
						#
						#
						#
						#if !cached_record_sets[additional_set_name_].is_empty():
							##print(" active records set fiasco ? 10")
							#active_record_sets[additional_set_name_] = cached_record_sets[additional_set_name_].duplicate(true)
							#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
							#cached_record_sets.erase(additional_set_name_)
							#active_r_s_mut.unlock()
							#cached_r_s_mutex.unlock()
							#change_creation_set_name(record_type, additional_set_name_)
							#process_creation_further(record_type, 1)
							#
							#return
						#else:
							#var new_data = recreator(number_of_set, active_record_sets[records_set_name], record_type, additional_set_name_)
							#active_record_sets[additional_set_name_] = new_data.duplicate(true)
							#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
							#active_r_s_mut.unlock()
							#cached_r_s_mutex.unlock()
							#change_creation_set_name(record_type, additional_set_name_)
							#process_creation_further(record_type, 1)
							#return 
						#
					## missing logic
					## if cached has it, take it, if not, then do as it was before
					### if active and cached does not have it
					### both didnt have that first one, we must create it again
					#else:
						### what do we need here, og record set name, additional set name, number of the set
						#var new_data = recreator(number_of_set, active_record_sets[records_set_name], record_type, additional_set_name_)
						#active_record_sets[additional_set_name_] = new_data.duplicate(true)
						#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
						#active_r_s_mut.unlock()
						#cached_r_s_mutex.unlock()
						#change_creation_set_name(record_type, additional_set_name_)
						#process_creation_further(record_type, 1)
						#return 
						#
						#
						#
						#
						#
			### IF ACTIVE RECORDS HAVE THAT SET, AND COUNTER COUNTER IS ALREADY OVER SINGULAR
			#if active_record_sets[records_set_name]["metadata"]["container_count"] > 1:
				##print(" active records set fiasco ? 5")
				#var number_of_set = active_record_sets[records_set_name]["metadata"]["container_count"]
				#var previous_additional_set_name = record_type + str(number_of_set -1)
				#var previous_additional_set_name_underscore = previous_additional_set_name + "_"
				#var additional_set_name = record_type + str(number_of_set)
				#var additional_set_name_ = additional_set_name + "_"
				#
				#
				### HERE TO CHANGE? PROBABLY
				### nah, if it does not have, we make new data, but we also need, to change name 
				#if !active_record_sets.has(additional_set_name_):
				##if !active_record_sets.has(additional_set_name_):
					### IF CACHED HAD IT, WE TAKE IT FROM HERE, AND CONTINUE
					#if cached_record_sets.has(additional_set_name_):
						##print(" initalize memories ! :  but cached had copy of that one? ")
						##active_record_sets[additional_set_name_] = cached_record_sets[additional_set_name_]
						##cached_record_sets.erase(additional_set_name_)
						#
						#
						#
						#if !cached_record_sets[additional_set_name_].is_empty():
							##print(" active records set fiasco ? 10")
							#active_record_sets[additional_set_name_] = cached_record_sets[additional_set_name_].duplicate(true)
							#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
							#cached_record_sets.erase(additional_set_name_)
							#active_r_s_mut.unlock()
							#cached_r_s_mutex.unlock()
							#change_creation_set_name(record_type, additional_set_name_)
							#process_creation_further(record_type, 1)
							#
							#return
						### if cached had it, but key is empty, we create it again but in future we will archive, and whip it out from file, so first we will check if we have a file
						#else:
							#var new_data = recreator(number_of_set, active_record_sets[previous_additional_set_name_underscore], previous_additional_set_name, additional_set_name_)
							#active_record_sets[additional_set_name_] = new_data.duplicate(true)
							#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
							#active_r_s_mut.unlock()
							#cached_r_s_mutex.unlock()
							#change_creation_set_name(record_type, additional_set_name_)
							#process_creation_further(record_type, 1)
							#
							#return
						#
					## missing logic
					## if cached has it, take it, if not, then do as it was before
					### if active and cached does not have it
					#else:
						#var new_data = recreator(number_of_set, active_record_sets[previous_additional_set_name_underscore], previous_additional_set_name, additional_set_name_)
						#active_record_sets[additional_set_name_] = new_data.duplicate(true)
						#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
						#active_r_s_mut.unlock()
						#cached_r_s_mutex.unlock()
						#change_creation_set_name(record_type, additional_set_name_)
						#process_creation_further(record_type, 1)
						#
						#return
					#
					#
					#
					### maybe we need to check cached again, like in == 1? here we just over one
				### active has that additional records set name, lets load it
				#else:
					##print(" active records set fiasco ? 7")
					#active_record_sets[additional_set_name_]["metadata"]["container_count"] +=1
					#active_r_s_mut.unlock()
					#cached_r_s_mutex.unlock()
					#change_creation_set_name(record_type, additional_set_name_)
					#process_creation_further(record_type, 1)
					#return
				#
				#
		#
		#
		#
		### IF ACTIVE RECORD IS THERE AS A KEY, BUT IS EMPTY, WE CHECK CACHE, COPY IT TO ACTIVE, AND LOAD IT
		#if active_record_sets[records_set_name].is_empty():
			#print(" initalize memories ! 0D : " , record_type)
			##print(" active records set fiasco ? 8")
			#if cached_record_sets.has(records_set_name):
				##print(" active records set fiasco ? 9")
				#if !cached_record_sets[records_set_name].is_empty():
					##print(" active records set fiasco ? 10")
					#active_record_sets[records_set_name] = cached_record_sets[records_set_name].duplicate(true)
					#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
					#cached_record_sets.erase(records_set_name)
					#active_r_s_mut.unlock()
					#cached_r_s_mutex.unlock()
					#
					#process_creation_further(record_type, 1)
					#
					#return
	#active_r_s_mut.unlock()
	#cached_r_s_mutex.unlock()
	#create_record_from_script(record_type)




# finding records sets by memory name
####################
# JSH Ethereal Records System
func find_record_set(record_type: String) -> Dictionary:
#	print(" check_possible_interactions check_possible_interactions find rec")
	match record_type:
		"base":
			return RecordsBank.records_map_0
		"menu":
			return RecordsBank.records_map_2
		"settings":
			return RecordsBank.records_map_3
		"keyboard":
			return RecordsBank.records_map_4
		"keyboard_left":
			return RecordsBank.records_map_5
		"keyboard_right":
			return RecordsBank.records_map_6
		"things_creation":
			return RecordsBank.records_map_7
		"singular_lines":
			return RecordsBank.records_map_8
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
####################

# the same but for instruction by memory name
####################
# JSH Memories Management
func find_instructions_set(record_type: String) -> Dictionary:
	match record_type:
		"base":
			return InstructionsBank.instructions_set_0
		"menu":
			return InstructionsBank.instructions_set_1
		"settings":
			return InstructionsBank.instructions_set_2
		"keyboard":
			return InstructionsBank.instructions_set_3
		"keyboard_left":
			return InstructionsBank.instructions_set_4
		"keyboard_right":
			return InstructionsBank.instructions_set_5
		"things_creation":
			return InstructionsBank.instructions_set_6
		"singular_lines":
			return InstructionsBank.instructions_set_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
####################

# the same as before, but for frames, scenes, memory
####################
# JSH Memories Management
func find_scene_frames(record_type: String) -> Dictionary:
	match record_type:
		"base":
			return ScenesBank.scenes_frames_0
		"menu":
			return ScenesBank.scenes_frames_1
		"settings":
			return ScenesBank.scenes_frames_2
		"keyboard":
			return ScenesBank.scenes_frames_3
		"keyboard_left":
			return ScenesBank.scenes_frames_4
		"keyboard_right":
			return ScenesBank.scenes_frames_5
		"things_creation":
			return ScenesBank.scenes_frames_6
		"singular_lines":
			return ScenesBank.scenes_frames_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
####################

# here are interactions! to punish mortals
####################
# JSH Memories Management
func find_interactions_list(record_type: String) -> Dictionary:
	#print(" so are we there?")
	match record_type:
		"base":
			#print(" maybe we somehow go to the base drop?")
			return ActionsBank.interactions_list_0
		"menu":
			#print(" so efforts were made, we are supposed to load interactions list 1 : ", ActionsBank.interactions_list_1)
			return ActionsBank.interactions_list_1
		"settings":
			return ActionsBank.interactions_list_2
		"keyboard":
			return ActionsBank.interactions_list_3
		"keyboard_left":
			return ActionsBank.interactions_list_4
		"keyboard_right":
			return ActionsBank.interactions_list_5
		"things_creation":
			return ActionsBank.interactions_list_6
		"singular_lines":
			return ActionsBank.interactions_list_7
		# Add more record sets as needed
		_:
			#print("Unknown record set: ", record_type)
			return {}
####################



####################
# JSH Ethereal Records System
func record_mistake(mistake_data: Dictionary):
	history_tracking.mutex.lock()
	mistake_data["timestamp"] = Time.get_ticks_msec()
	history_tracking.mistakes.append(mistake_data)
	history_tracking.mutex.unlock()
####################


# never really used, but it is still kinda there i guess, maybe one day i will, like use it for something, right now? threads
####################
# JSH Ethereal Records System
func get_record_type_id(record_type: String) -> int:
	match record_type:
		"base":
			return 0
		"menu":
			return 1
		_:
			return -1
####################

# total size of cached memory ram whatever
####################
# JSH Ethereal Records System
func get_cache_total_size() -> int:
	var total_size: int = 0
	cached_r_s_mutex.lock()
	for records_set in cached_record_sets:
		for record_type in cached_record_sets[records_set]:
			var data = cached_record_sets[records_set][record_type]
			total_size += get_dictionary_memory_size(data)
	#print("Total cache size in bytes: ", total_size)
	#print("Total cache size in MB: ", total_size / (1024.0 * 1024.0))
	cached_r_s_mutex.unlock()
	return total_size
####################

# here the size of dictionary is being checked
####################
# JSH Ethereal Records System
func get_dictionary_memory_size(dict: Dictionary) -> int:
	var serialized = var_to_bytes(dict)
	return serialized.size()
####################


# the functions of the past, that works, and i can use it if! i would need them :)
# finding highest number, in an array of ints
####################
# JSH Ethereal Records System
func find_highest_in_array(numbers: Array) -> int:
	return numbers.max()
####################


####################
# JSH Ethereal Records System
func new_function_for_creation_recovery(record_type_now, first_stage_of_creation_now, stage_of_creation_now):
	print(" fatal kurwa error 000 ", record_type_now , " , " , first_stage_of_creation_now, " , " , stage_of_creation_now)
	if load_queue_mutex.try_lock():
		print(" fatal kurwa error 00 load_queue_mutex ",)
	else:
		print(" fatal kurwa error 001 load_queue_mutex ",)
	array_with_no_mutex.append([record_type_now, first_stage_of_creation_now, stage_of_creation_now])
####################



####################
# Create Records
#                                                                                                           ,,          
#   .g8"""bgd                          mm               `7MM"""Mq.                                        `7MM          
# .dP'     `M                          MM                 MM   `MM.                                         MM          
# dM'       ``7Mb,od8 .gP"Ya   ,6"Yb.mmMMmm .gP"Ya        MM   ,M9  .gP"Ya   ,p6"bo   ,pW"Wq.`7Mb,od8  ,M""bMM  ,pP"Ybd 
# MM           MM' "',M'   Yb 8)   MM  MM  ,M'   Yb       MMmmdM9  ,M'   Yb 6M'  OO  6W'   `Wb MM' "',AP    MM  8I   `" 
# MM.          MM    8M""""""  ,pm9MM  MM  8M""""""       MM  YM.  8M"""""" 8M       8M     M8 MM    8MI    MM  `YMMMa. 
# `Mb.     ,'  MM    YM.    , 8M   MM  MM  YM.    ,       MM   `Mb.YM.    , YM.    , YA.   ,A9 MM    `Mb    MM  L.   I8 
#   `"bmmmd' .JMML.   `Mbmmd' `Moo9^Yo.`Mbmo`Mbmmd'     .JMML. .JMM.`Mbmmd'  YMbmd'   `Ybmd9'.JMML.   `Wbmd"MML.M9mmmP' 
#
# Create Records
####################


# create from file?
# create from consts?
# create from user inputs?
# create from lists of already connected files?
# create from already created records, recreate it, with change of something



func create_additional_record_set(record_type, current_container_count_check):
	#print(" so what do we have here ? : ", record_type , " and ", current_container_count_check)
	var set_name_to_work_on = record_type + "_"
	#var additional_set_name = record_type + str(current_container_count_check) + "_"
	
	
	active_r_s_mut.lock()
	var data_to_work_on_additional_set = active_record_sets[set_name_to_work_on].duplicate(true)
	active_r_s_mut.unlock()
	
	var datapoint_name_thing : String = ""
	var container_name_thing : String = ""
	
	## damn, but before we erase that instructions, we must find just one, for "set_the_scene"
	
	var entire_array_of_scene_to_set : Array = []
	
	var amounts_of_instructions = data_to_work_on_additional_set[set_name_to_work_on + "instructions"]["content"].size() - 1
	amounts_of_instructions = amounts_of_instructions + current_container_count_check
	
	for stuffff in data_to_work_on_additional_set[set_name_to_work_on + "instructions"]["content"]:
		var type_of_instruction = stuffff[0][1][0]
		if type_of_instruction == "set_the_scene":
			#print(" recreator 3.0a set the scene " , stuffff)
			entire_array_of_scene_to_set = stuffff
		#var scene_number_to_get = stuffff[1][2][0]
		#var scene_number_to_get_2 = stuffff[2][0][0]
	
	
	var interaction_name = entire_array_of_scene_to_set[0][0][0]
	
	var new_interaction_split = interaction_name.split("_")
	
	var new_interaction_name = new_interaction_split[0] + "_" + str(amounts_of_instructions)
	
	entire_array_of_scene_to_set[0][0][0] = new_interaction_name
	
	entire_array_of_scene_to_set[1][2][0] = str(current_container_count_check)
	
	entire_array_of_scene_to_set[2][0][0] = str(current_container_count_check)
	
	
	## damn instruction, not inter action, needs to change these words, as they are close to each other with letters
	
	## or maybe even sooner, we can erase instructions?
	data_to_work_on_additional_set[set_name_to_work_on + "instructions"] = {
		"header" = [new_interaction_name],
		"content" = [entire_array_of_scene_to_set]
	}
	
	#print(" recreator 3.0a ", data_to_work_on_additional_set[set_name_to_work_on + "instructions"] , " also " , amounts_of_instructions)
	
	## hmm we got 6 instructions, but we dont really erase all of them we just take one?
	
	## 6 + number of containers, can make it work nicely :)
	## but first we would need to do -1? as we start with 0?
	## first edit 6, works
	## second edit, we need 7
	## 5 + 1 = 6
	## 6 + 1 = 7, could also work, but its not my dream
	
	
	
	## hmm now we also need to take away scenes? so we only have one to update in datapoint :) 
	## like scene 0 for first version
	## scene 1 for second, first multiply
	## scene 2 for third, so second multiple
	
	
	data_to_work_on_additional_set[set_name_to_work_on + "scenes"]
	var scene_name_to_take = data_to_work_on_additional_set[set_name_to_work_on + "scenes"]["header"][current_container_count_check]
	var scene_array_to_take = data_to_work_on_additional_set[set_name_to_work_on + "scenes"]["content"][current_container_count_check]
	
	
	
	## or maybe even sooner, we can erase instructions?
	data_to_work_on_additional_set[set_name_to_work_on + "scenes"] = {
		"header" = [scene_name_to_take],
		"content" = [scene_array_to_take]
	}
	
	
	#print(" recreator 3.0a ", data_to_work_on_additional_set[set_name_to_work_on + "scenes"])
	
	#data_to_work_on_additional_set.erase([set_name_to_work_on + "instructions"])
	
	## maybe first we cound how many things there is in that record?
	var amount_of_things = data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"].size()
	#print(" recreator 2.0 amount_of_things " , amount_of_things)
	
	var container_informations
	#var datapoint_informations
	
	## maybe now is the time to figure out names of container, datapoint, their thing names?
	var first_counter : int = -1
	for stufff in data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"]:
		first_counter +=1
		#print(" recreator 2.0 find datapoint " , stufff[0][3][0])
		var thing_name_find = stufff[0][3][0]
		var thing_number_name_find = stufff[0][0][0]
		#print(" recreator 2.0 , can i like use counter too ? ", data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"][first_counter] )
		## as we found them, maybe we can already somehow erase it?
		## but it is array, we erase [0], and [1] becomes now [0]
		## and i know, there was a function, where we could, like
		## if [] is empty, erase? so maybe latter?
		if thing_name_find == "container":
			#print( " recreator 2.0 found container " , thing_number_name_find)
			container_name_thing = thing_number_name_find
			## lets cleanse this space
			container_informations = data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"][first_counter]
			data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"][first_counter] = []
		elif thing_name_find == "datapoint":
			#print(" recreator 2.0 found datapoint " , thing_number_name_find)
			datapoint_name_thing = thing_number_name_find
			## we empty that baby
			#datapoint_informations = data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"][first_counter]
			data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"][first_counter] = []
		if container_name_thing != "" and datapoint_name_thing != "":
			#print(" recreator 2.0 we found both, lets break from there")
			break
		# container
		# datapoint
	
	#print(" recreator 4.0 info ", container_informations[1][0][0])
	
	var container_name = container_informations[1][0][0]
	
	if datapoint_name_thing != "":
		data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"].erase([])
		amount_of_things -=1
	if container_name_thing != "":
		data_to_work_on_additional_set[set_name_to_work_on + "records"]["content"].erase([])
		amount_of_things -=1
	
	amount_of_things = amount_of_things * current_container_count_check
	## thing_2 is first
	## thing_5 is last
	## amount - stuff we deleted, was 6, now 4
	## thing_2 + 4 = thing_6
	## new first thing number is 6
	## amount times numbers of currentl containers
	## 4 x 1 = 4
	## 4 x 2 = 8
	## thing_5 + 4 = thing_9
	## 
	## thing_2 + 8 = thing_10
	## seems i remember what are numbers
	
	var second_counter : int = -1
	var counter_of_finish : int = 0
	## lets erase from headers, the datapoint and container
	for stufff_0 in data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"]:
		second_counter +=1
		#print(" we gotta erase them thingies")
		if stufff_0 == container_name_thing:
			#print(" recreator 2.0 lets erase container")
			data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"][second_counter] = ""
			counter_of_finish +=1
		elif stufff_0 == datapoint_name_thing:
			#print(" recreator 2.0 lets erase datapoint")
			data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"][second_counter] = ""
			counter_of_finish +=1
		if counter_of_finish == 2:
			#print(" recreator 2.0 i guess we done two things, lets break from there ")
			break
	
	
	
	if datapoint_name_thing != "":
		data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"].erase("")
	if container_name_thing != "":
		data_to_work_on_additional_set[set_name_to_work_on + "records"]["header"].erase("")
	
	## what will we need?
	continue_recreation(data_to_work_on_additional_set, datapoint_name_thing, container_name_thing, set_name_to_work_on, current_container_count_check, record_type, amount_of_things, container_name)
	
	
func continue_recreation(data_to_work_on_additional_set, datapoint_name_thing, container_name_thing, set_name_to_work_on, current_container_count_check, record_type, amount_of_things, container_name):
	## data_to_work_on_additional_set = dictionary
	## datapoint_name_thing = name of datapoint
	## container_name_thing = name of container
	## set_name_to_work_on = name of the set, like "base_"
	## current_container_count_check = current number of these sets on scene, if only one, 1, if we already have two, 2
	## record_type = like name, but "base" instead of "base_"
	## amount_of_things = the amount of things we had, before we started cleaning it 
	
	
	
	var just_thing : String = "thing_"
	var just_interaction : String = "interaction_"
	
	var just_path_now : String = container_name + "/" + just_thing
	
	var parts_to_change = BanksCombiner.data_names_3
	# BanksCombiner.data_names_3
	# recreator, needs records, scenes, interactions
	for part_now in parts_to_change:
		var part_name = set_name_to_work_on + part_now
		if data_to_work_on_additional_set.has(part_name):
			#print(" recreator 2.0, we can start work i guess " , part_name)


## from here we work on singular part of the record
## first keys are content and header
			for stuff in data_to_work_on_additional_set[part_name]:
				#print(" recreator 2.0 " , stuff)
				if data_to_work_on_additional_set[part_name].has(stuff):
					#print(" recreator 2.0 ")
					

## from here we will work on singular lines of texts, arrays, strings, packed string in array etc
					var counting_int_0 : int = -1
					for recreation_0 in data_to_work_on_additional_set[part_name][stuff]:
						counting_int_0 +=1
						#print(" recreator 2.0 ", recreation_0)
						if stuff == "header":
							#print(" recreator 2.0, we are in header " , recreation_0)
							if recreation_0 is String:
								#print(" recreator 2.0 header is a string?")
								
								if recreation_0.begins_with(just_thing):
									#print(" recreator 2.0a it begins with thing")
									var split_recreation_0 = recreation_0.split("_")
									var thing_name_split = split_recreation_0[0]
									var number_of_that_thing : int = int(split_recreation_0[1]) + amount_of_things
									
									var new_recreation_0 = thing_name_split + "_" + str(number_of_that_thing)
									#print(" new_recreation_0 : " , new_recreation_0)
									data_to_work_on_additional_set[part_name][stuff][counting_int_0] = new_recreation_0
									
								elif recreation_0.begins_with(just_interaction):
									#print(" recreator 2.0a it begings with interaction")
									#print(" recreator 2.0a it begins with thing")
									var split_recreation_0 = recreation_0.split("_")
									var interaction_name_split = split_recreation_0[0]
									var number_of_that_interaction : int = int(split_recreation_0[1]) + amount_of_things
									var new_recreation_0  = interaction_name_split + "_" + str(number_of_that_interaction)
									data_to_work_on_additional_set[part_name][stuff][counting_int_0] = new_recreation_0
									#print(" new_recreation_0 : " , new_recreation_0)
								## here is needed logic to split, add number
								## and i need to know what number
								## will use mortals paper and pen technology to think
								## lol
								## i hate numbers
								
								
						elif stuff == "content":
							#print(" recreator 2.0, we are in content " , recreation_0)
							
							## data_to_work_on_additional_set[part_name][stuff][counting_int_0]
							
							var counting_int_1 : int = -1
							
							for stuff_to_find in recreation_0:
								counting_int_1 +=1
								
								## data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1]
								
								
								#print(" recreator 2.0 we got stuff to change lol ", stuff_to_find)
								if stuff_to_find is String:
									print(" recreator 2.0a we found string 0")
								else:
									
									var counting_int_2 : int = -1
									
									for stuff_to_find_0 in stuff_to_find:
										counting_int_2 +=1
										
										## data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1][counting_int_2]
										
										
										#print(" recreator 2.0 one layer deeper")
										if stuff_to_find_0 is String:
											print(" recreator 2.0a we found string 1")
										else:
											
											
											var counting_int_3 : int = -1
											
											
											for stuff_to_find_1 in stuff_to_find_0:
												counting_int_3 +=1
												
												## data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1][counting_int_2][counting_int_3]
												
												#print(" recreator 2_0 two layer deeper")
												if stuff_to_find_1 is String:
													#print(" recreator 2.0a we found string 2")
													
													## here we need to also apply new logic
													## with numbers and stuff
													
													if stuff_to_find_1.begins_with(just_thing):
														if stuff_to_find_1 != datapoint_name_thing and stuff_to_find_1 != container_name_thing:
														
															#print(" recreator 2.0a it begins with thing")
															var split_recreation_0 = stuff_to_find_1.split("_")
															var thing_name_split = split_recreation_0[0]
															var number_of_that_thing : int = int(split_recreation_0[1]) + amount_of_things
															var new_stuff_to_find_1 = thing_name_split + "_" + str(number_of_that_thing)
															
															
															data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1][counting_int_2][counting_int_3] = new_stuff_to_find_1
														
													elif stuff_to_find_1.begins_with(just_interaction):
														#print(" recreator 2.0a it begings with interaction")
														#print(" recreator 2.0a it begins with thing")
														var split_recreation_0 = stuff_to_find_1.split("_")
														var interaction_name_split = split_recreation_0[0]
														var number_of_that_interaction : int = int(split_recreation_0[1]) + amount_of_things
														var new_stuff_to_find_1 = interaction_name_split + "_" + str(number_of_that_interaction)
														
														
														data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1][counting_int_2][counting_int_3] = new_stuff_to_find_1
													
													elif stuff_to_find_1.begins_with(just_path_now):
														#print(" path was found " , stuff_to_find_1)
														var first_path_split = stuff_to_find_1.split("/")
														var second_split_of_thing = first_path_split[1].split("_")
														var first_merge = first_path_split[0] + "/" + second_split_of_thing[0] + "_"
														
														var number_of_that_thing : int = int(second_split_of_thing[1]) + amount_of_things
														var new_path_now = first_merge + str(number_of_that_thing)
														#print(" path was found  and remake" , new_path_now)
														
														data_to_work_on_additional_set[part_name][stuff][counting_int_0][counting_int_1][counting_int_2][counting_int_3] = new_path_now
														
													
												else:
													print(" recreator 2.0a we could go deeper? ")
											
	#print(" recreator 2.0b , full data : ", data_to_work_on_additional_set)
	var additional_set_name = record_type + str(current_container_count_check) + "_"
	
	active_r_s_mut.lock()
	
	active_record_sets[additional_set_name] = {}
	
	# records "singular_lines_records": 
	active_record_sets[additional_set_name][additional_set_name + "records"] = data_to_work_on_additional_set[set_name_to_work_on + "records"]
	# scenes "singular_lines_scenes": 
	active_record_sets[additional_set_name][additional_set_name + "scenes"] = data_to_work_on_additional_set[set_name_to_work_on + "scenes"]
	# interactions "singular_lines_interactions": 
	active_record_sets[additional_set_name][additional_set_name + "interactions"] = data_to_work_on_additional_set[set_name_to_work_on + "interactions"]
	# instructions "singular_lines_instructions": 
	active_record_sets[additional_set_name][additional_set_name + "instructions"] = data_to_work_on_additional_set[set_name_to_work_on + "instructions"]
	#active_record_sets[additional_set_name] = data_to_work_on_additional_set[set_name_to_work_on + "records"]
	
	active_r_s_mut.unlock()
	
	
	## now we mutex lock active record set, add that additional set name stuff and here we go :)


func create_record_from_script(record_type):
	
	var type_of_data : int
	#print(" create record set from script " , record_type)
	#var records_set_name = record_type + "_"
	#var use_cache = false
	#var already_exists = false
	
	#print("initalize memories ! 01 we went further ")
	var datapoint_node
	var records : Dictionary
	var current_data_pack_loaded
	var records_part : String
	var records_name : String
	#	print(" initialize menu lets check that records_part :  ", records_part)
	records_part = ""
	#	print(" initialize menu now i tried cleaning it records_part : ", records_part)
	match record_type:
		"base":
			current_data_pack_loaded = BanksCombiner.combination_0
			records_part = "base_"
		"menu":
			current_data_pack_loaded = BanksCombiner.combination_1
			records_part = "menu_"
		"settings":
			current_data_pack_loaded = BanksCombiner.combination_2
			records_part = "settings_"
		"keyboard":
			current_data_pack_loaded = BanksCombiner.combination_3
			records_part = "keyboard_"
		"keyboard_left":
			current_data_pack_loaded = BanksCombiner.combination_4
			records_part = "keyboard_left_"
		"keyboard_right":
			current_data_pack_loaded = BanksCombiner.combination_5
			records_part = "keyboard_right_"
		# Add more record sets as needed
		"things_creation":
			current_data_pack_loaded = BanksCombiner.combination_6
			records_part = "things_creation_"
		"singular_lines":
			current_data_pack_loaded = BanksCombiner.combination_7
			records_part = "singular_lines_"
		_:
			#print("Unknown record set to find in banks combiner : ", record_type)
			return {}
	for data_types in current_data_pack_loaded:
		#print("data_types : ", data_types[0])
		type_of_data = data_types[0]
		# get records by its type :)
		match type_of_data:
			0:
				#print(" zero ?")
				records = find_record_set(record_type)
				records_name = records_part + "records" # 0 = "records" , 1 = "instructions" 2 = "scenes"  3 = "interactions"
			1:
				#print(" one ? ")
				records = find_instructions_set(record_type)
				records_name = records_part + "instructions"
			2: 
				#print(" two ? ")
				records = find_scene_frames(record_type)
				records_name = records_part + "scenes"
			3:
				#print(" three ? ")
				records = find_interactions_list(record_type)
				records_name = records_part + "interactions"
		load_record_set(records_part, records_name, type_of_data, records)
	## the outcome from creation
	#print(" initialize menu, finish ")
	
	#active_record_sets[records_set_name]["metadata"]["container_count"] +=1
	
	process_creation_further(record_type, 1)









# Your example usage would now look like this:
####################
# JSH Ethereal Records System
func process_creation_request(set_name: String) -> Dictionary:
	var result = {
		"status": CreationStatus.ERROR,
		"message": "",
		"timestamp": Time.get_ticks_msec()
	}
	# Check if creation is possible
	if not is_creation_possible():
		result.status = CreationStatus.LOCKED
		result.message = "Creation system is not active"
		return result
	# Attempt creation
	var creation_result = whip_out_set_by_its_name(set_name)
	match creation_result:
		CreationStatus.SUCCESS:
			result.status = CreationStatus.SUCCESS
			result.message = "Set created successfully"
		CreationStatus.ERROR:
			record_mistake({
				"type": "creation_error",
				"set_name": set_name,
				"error": "Creation failed"
			})
			result.message = "Failed to create set"
		_:
			result.message = "Unexpected creation status"
	return result
####################







# prepare akashic records init
####################
# JSH Ethereal Records System
func prepare_akashic_records_init():
	#print(" init version prepare akashic_records ")
	#print(" timer check  first we need a screen, and light state : ", first_start_check)
	first_start_check = "started"
	#print(" timer check  state now : ", first_start_check)
	var main_sets_names = BanksCombiner.dataSetLimits
	var main_sets_names_just_names = BanksCombiner.data_sets_names_0
	var main_sets_names_with_underscore = BanksCombiner.data_sets_names
	array_of_startup_check.append(first_start_check)
	array_of_startup_check.append([["akashic_records"],["base"],["menu"]])
	
	# lets first check breaks and handles
	# the stuff i never check, why would i
	#var message_now_mutex = breaks_and_handles_check()
	var stuck_status = check_thread_status()
	# check if mutexes are true or false or null
	# check what threads we got already, how many we should have?
	before_time_blimp(0, 0)
	
	
	array_of_startup_check.append(main_sets_names)
	array_of_startup_check.append(main_sets_names_just_names)
	array_of_startup_check.append(main_sets_names_with_underscore)
	# the basic_pack_of_records
	
	
	if stuck_status == "error":
		print(" timer check omething went wrong, use a timer")
####################





####################
# JSH Ethereal Records System
func load_record_set(records_part: String, record_type: String, type_of_data : int, records : Dictionary) -> void:
	# dataSetLimits and data_sets_names in BanksCombiner
	var max_nunmber_of_thingy = BanksCombiner.dataSetLimits[records_part]
	var current_number_of_that_set : int = 0
	if !active_record_sets.has(records_part): # added that ! xD
		current_number_of_that_set = 1
	var list_of_reliquaries : Array = [] # list of sacred relics—each one unique
	var codices : Array = [] # Ancient manuscripts that hold wisdom
	var current_record_line : Array = []
	
	
	for current_record_to_process in records:
		var another_array_damn : Array = []
		var string_splitter
		for current_part in records[current_record_to_process]:
			string_splitter = current_part[0].split("|")
			var string_to_be_splitted
			var tomes_of_knowledge : Array = []
			for stringy_string in string_splitter:
				string_to_be_splitted = stringy_string.split(",")
				tomes_of_knowledge.append(string_to_be_splitted)
			current_record_line.append(string_splitter[0])
			another_array_damn.append(tomes_of_knowledge)
		codices.append(another_array_damn)
		list_of_reliquaries.append(current_record_line[0])
		current_record_line.clear()
		
	var string_header : String = "header"
	var string_content : String = "content"
	var records_processed : Dictionary = {} #{list_of_reliquaries, codices}
	records_processed[string_header] =  list_of_reliquaries
	records_processed[string_content] = codices
	


	if active_record_sets.has(records_part):# and active_record_sets.has(record_type):
		if active_record_sets[records_part].has(record_type):
			return
	
	if not active_record_sets.has(records_part):
		active_record_sets[records_part] = {
			"metadata": {
				"timestamp": Time.get_ticks_msec(),
				"container_count": current_number_of_that_set,
				"max_containers": max_nunmber_of_thingy
			}
		}
		
	
	if records.size() > 0:
		active_record_sets[records_part][record_type] = records_processed
		#current_record_set = record_type
####################




####################
# JSH Ethereal Records System
#                                      ,,                                                          ,,          
# `7MMF'                             `7MM      `7MM"""Mq.                                        `7MM          
#   MM                                 MM        MM   `MM.                                         MM          
#   MM         ,pW"Wq.   ,6"Yb.   ,M""bMM        MM   ,M9  .gP"Ya   ,p6"bo   ,pW"Wq.`7Mb,od8  ,M""bMM  ,pP"Ybd 
#   MM        6W'   `Wb 8)   MM ,AP    MM        MMmmdM9  ,M'   Yb 6M'  OO  6W'   `Wb MM' "',AP    MM  8I   `" 
#   MM      , 8M     M8  ,pm9MM 8MI    MM        MM  YM.  8M"""""" 8M       8M     M8 MM    8MI    MM  `YMMMa. 
#   MM     ,M YA.   ,A9 8M   MM `Mb    MM        MM   `Mb.YM.    , YM.    , YA.   ,A9 MM    `Mb    MM  L.   I8 
# .JMMmmmmMMM  `Ybmd9'  `Moo9^Yo.`Wbmd"MML.    .JMML. .JMM.`Mbmmd'  YMbmd'   `Ybmd9'.JMML.   `Wbmd"MML.M9mmmP' 
# Load Records
####################

# load into active
# from cached
# from archived
# from files

# loading cached data! the newest chicken we have! maybe it is egg already?! as we just need name of data set, that is in active record sets
####################
# JSH Ethereal Records System
func load_cached_data(data_set: String):
	var type_of_data : int
	var records_set_name = data_set
	active_r_s_mut.lock()
	var cached_data_new = active_record_sets[records_set_name].duplicate(true)
	active_r_s_mut.unlock()
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var counter_to_know : int = 0
	var first_line : Array = []
	var lines_parsed : Array = []
	for data_type in BanksCombiner.combination_new_gen_0:
		counter_to_know = 0
		type_of_data = int(data_type[0])
		var type_num = data_type[0]
		var data_name = records_set_name + BanksCombiner.data_names_0[type_num]
		var file_data = cached_data_new[data_name]["content"]
		var size_of_data = file_data.size()
		for record in file_data:
			counter_to_know +=1
			for lines in record:
				if lines == record[0]:
					first_line = record[0]
				else:
					lines_parsed.append(lines)
			match type_of_data:
				0:
					# First
					thing_name = first_line[0][0]
					# Second
					coords_to_place = first_line[1][0]
					# Third
					direction_to_place = first_line[2][0]
					# Fourth
					thing_type_file = first_line[3][0]
					# Fifth
					shape_name = first_line[4][0]
					# Sixth
					root_name = first_line[5][0]
					# Seventh
					pathway_dna = first_line[6][0]
					# Eight
					group_number = first_line[7][0]
				1:
					pass
					#print("file loading? 1")
				2:
					pass
					#print("file loading? 2 ")
				3:
					pass
					#print("file loading? 3 " )
			match type_of_data:
				0:
					#print( "  thing_name : " , thing_name, " thing_type_file :" , thing_type_file, " metadata_parts : " , first_line, " second_line :" , lines_parsed[0],  " group_number : " , group_number, " shape_name : " , shape_name, "information_lines : " , lines_parsed)
					analise_data(thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
				1:
					print("instruction stuff:")
				2: 
					print(" scenes and frames analise : ")
				3: 
					print("so we will need to add them to datapoint")
					if counter_to_know - 666 == size_of_data:
						var container_node_path = first_line[1][0]
						var container_node = get_node(container_node_path)
						var datapoint_node = container_node.get_datapoint()
						var scene_number: int = 0
						datapoint_node.move_things_around(scene_number)
			first_line.clear()
			lines_parsed.clear()
####################








####################
# Move Records
#                                                                                                   ,,          
# `7MMM.     ,MMF'                              `7MM"""Mq.                                        `7MM          
#   MMMb    dPMM                                  MM   `MM.                                         MM          
#   M YM   ,M MM  ,pW"Wq.`7M'   `MF'.gP"Ya        MM   ,M9  .gP"Ya   ,p6"bo   ,pW"Wq.`7Mb,od8  ,M""bMM  ,pP"Ybd 
#   M  Mb  M' MM 6W'   `Wb VA   ,V ,M'   Yb       MMmmdM9  ,M'   Yb 6M'  OO  6W'   `Wb MM' "',AP    MM  8I   `" 
#   M  YM.P'  MM 8M     M8  VA ,V  8M""""""       MM  YM.  8M"""""" 8M       8M     M8 MM    8MI    MM  `YMMMa. 
#   M  `YM'   MM YA.   ,A9   VVV   YM.    ,       MM   `Mb.YM.    , YM.    , YA.   ,A9 MM    `Mb    MM  L.   I8 
# .JML. `'  .JMML.`Ybmd9'     W     `Mbmmd'     .JMML. .JMM.`Mbmmd'  YMbmd'   `Ybmd9'.JMML.   `Wbmd"MML.M9mmmP' 
# Move Records
####################

# move from active to cached/ archived
# from cached to active/ archived
# from archived to cached/ active



func load_cached_record_to_active(records_set_name):
	
	#mutex lock cached and active
	active_r_s_mut.lock()
	cached_r_s_mutex.lock()
	active_record_sets[records_set_name] = cached_record_sets[records_set_name].duplicate(true)
	active_record_sets[records_set_name]["metadata"]["container_count"] +=1
	cached_record_sets.erase(records_set_name)
	active_r_s_mut.unlock()
	cached_r_s_mutex.unlock()

# here we make deep copy dictionary of json####################
####################
# JSH Ethereal Records System
func deep_copy_dictionary(original: Dictionary) -> Dictionary:
	# First, convert to JSON string (this breaks all references)
	var json_string = JSON.stringify(original)
	# Then parse back to dictionary (creates entirely new data structure)
	var parsed = JSON.parse_string(json_string)
	return parsed
####################



# here we are cleaning cache from oldest file
####################
# JSH Ethereal Records System
func clean_oldest_dataset() -> void:
	var oldest_time = Time.get_ticks_msec()
	var oldest_set = ""
	for timestamp_key in cache_timestamps:
		if cache_timestamps[timestamp_key] < oldest_time:
			oldest_time = cache_timestamps[timestamp_key]
			oldest_set = timestamp_key.split("_")[0]
	if oldest_set != "":
		#print("Removing oldest dataset: ", oldest_set)
		cached_r_s_mutex.lock()
		cached_record_sets.erase(oldest_set + "_")
		cached_r_s_mutex.unlock()
		# Clean related timestamps
		var to_remove = []
		for timestamp_key in cache_timestamps:
			if timestamp_key.begins_with(oldest_set):
				to_remove.append(timestamp_key)
		for key in to_remove:
			cache_timestamps.erase(key)
####################

####################
# JSH Ethereal Records System
func process_to_unload_records(container_name_to_unload):
	var parts = container_name_to_unload.split("_")
	if parts.size() < 2:
		return
	var records_sets_name
	if parts.size() > 2:
		records_sets_name = parts[0] + "_" + parts[1]
	else:
		records_sets_name = parts[0]
	var counter_for_rec_ty : int = 0
	active_r_s_mut.lock()
	if active_record_sets[records_sets_name + "_" ].has("metadata"):
		active_record_sets[records_sets_name + "_" ]["metadata"]["container_count"] = 0
		active_r_s_mut.unlock()
		for records_types in BanksCombiner.combination_0:
			var record_to_unloadin = records_sets_name + "_" + BanksCombiner.data_names_0[counter_for_rec_ty]
			counter_for_rec_ty +=1
			unload_record_set(records_sets_name , record_to_unloadin)
		active_r_s_mut.lock()
		active_record_sets[records_sets_name + "_" ].erase("metadata")
		active_r_s_mut.unlock()
	else:
		active_r_s_mut.unlock()
####################


# here we are unloading sets to cache, adding stamp of time so 4d is here already
# we also check the size, check if we can even cache it or we need to clean previous data
# current limit is like 50 mb
####################
# JSH Ethereal Records System
func unload_record_set(records_sets_name : String, record_type: String) -> void:
	records_sets_name = records_sets_name + "_"
	active_r_s_mut.lock()
	if active_record_sets.has(records_sets_name):
		if active_record_sets[records_sets_name].has(record_type):
			var data = active_record_sets[records_sets_name][record_type]
			var meta_data = active_record_sets[records_sets_name]["metadata"]
			active_r_s_mut.unlock()
			cache_data(records_sets_name, record_type, data, meta_data)
			active_r_s_mut.lock()
			active_record_sets[records_sets_name].erase(record_type)
			active_r_s_mut.unlock()
		else:
			active_r_s_mut.unlock()
	else:
		active_r_s_mut.unlock()
####################

# here we actually cache that data
####################
# JSH Ethereal Records System
func cache_data(records_sets_name: String, record_type: String, data, meta_data) -> void:
	var current_cache_size = get_cache_total_size()
	var new_data_size = get_dictionary_memory_size(data)
	var max_size_bytes = max_cache_size_mb * 1024 * 1024
	if current_cache_size + new_data_size > max_size_bytes:
		clean_oldest_dataset()
	current_cache_size = get_cache_total_size()
	cached_r_s_mutex.lock()
	if current_cache_size + new_data_size <= max_size_bytes:
		if !cached_record_sets.has(records_sets_name):
			active_r_s_mut.lock()
			cached_record_sets[records_sets_name] = { # current_cache_size
				"metadata": active_record_sets[records_sets_name]["metadata"].duplicate(true)
			}
			active_r_s_mut.unlock()
		cached_record_sets[records_sets_name][record_type] = data.duplicate(true)
		cached_record_sets[records_sets_name]["metadata"][str(record_type)] = {
			"size": new_data_size,
			"time_of_cache" : Time.get_ticks_msec()
		}
		cache_timestamps[records_sets_name + record_type] = Time.get_ticks_msec()
	else:
		print("Cache limit reached, cannot store new data")
	cached_r_s_mutex.unlock()
####################






####################
# Change Records
#               ,,                                                                                                      ,,          
#   .g8"""bgd `7MM                                                  `7MM"""Mq.                                        `7MM          
# .dP'     `M   MM                                                    MM   `MM.                                         MM          
# dM'       `   MMpMMMb.   ,6"Yb.  `7MMpMMMb.  .P"Ybmmm .gP"Ya        MM   ,M9  .gP"Ya   ,p6"bo   ,pW"Wq.`7Mb,od8  ,M""bMM  ,pP"Ybd 
# MM            MM    MM  8)   MM    MM    MM :MI  I8  ,M'   Yb       MMmmdM9  ,M'   Yb 6M'  OO  6W'   `Wb MM' "',AP    MM  8I   `" 
# MM.           MM    MM   ,pm9MM    MM    MM  WmmmP"  8M""""""       MM  YM.  8M"""""" 8M       8M     M8 MM    8MI    MM  `YMMMa. 
# `Mb.     ,'   MM    MM  8M   MM    MM    MM 8M       YM.    ,       MM   `Mb.YM.    , YM.    , YA.   ,A9 MM    `Mb    MM  L.   I8 
#   `"bmmmd'  .JMML  JMML.`Moo9^Yo..JMML  JMML.YMMMMMb  `Mbmmd'     .JMML. .JMM.`Mbmmd'  YMbmd'   `Ybmd9'.JMML.   `Wbmd"MML.M9mmmP' 
#                                             6'     dP                                                                             
#                                             Ybmmmd'                                                                               
# Change Records
####################


# if an array is empty, use the main array?
# i mean recreator 2.0, where we take entire record, we find the stuff that start with "Thing" we check it number _0 and change it to _10 if we had that many things in it
# so we store data better






func add_container_count(records_set_name):
	active_r_s_mut.lock()
	
	if active_record_sets.has(records_set_name):
		if active_record_sets[records_set_name].has("metadata"):
			if active_record_sets[records_set_name]["metadata"].has("container_count"):
				active_record_sets[records_set_name]["metadata"]["container_count"] +=1
			else:
				print(" metadata has no container count ")
		else:
			print(" set has no metadata ")
	else:
		print(" we dont have that set ")
	active_r_s_mut.unlock()


####################
# JSH Ethereal Records System
func recreator(number_to_add, data_to_process, data_set_name, new_name_for_set):
	
	
	
	
	var initial_number_to_add : int = int(number_to_add)
	print(" recreator whats wrong")
	print(" new_name_for_set : " , new_name_for_set)
	var processed_data : Dictionary
	var data_to_work_on = data_to_process.duplicate(true)
	var container_path = data_set_name + "_container/thing_"
	var patterns = ["thing_" , container_path ]
	var number_we_wanna_add : int
	var container_name_to_free
	var data_type_name_combined_first = data_set_name + "_" + BanksCombiner.data_names_0[0]
	var tasks_to_be_done : int = 0
	var datapoint_name
	var datapoint_container_name
	for container_to_find in data_to_work_on[data_type_name_combined_first]["content"]:
		if container_to_find[0][3][0] == "container":
			container_name_to_free = container_to_find[0][0][0]
			container_to_find.clear()
			break
	data_to_work_on[data_type_name_combined_first]["content"].erase([])
	for data_types in BanksCombiner.data_names_0:
		var data_type_name_combined = data_set_name + "_" + data_types
		print(data_set_name + "_" + data_types)
		for data_to_be_parsed_1 in data_to_work_on[data_type_name_combined]: 
			if data_to_be_parsed_1 == "header":
				if BanksCombiner.data_names_0[0] == data_types:
					number_we_wanna_add = data_to_work_on[data_type_name_combined][data_to_be_parsed_1].size()
					var counter_for_header_strings : int = 0
					for container_name_to_find in data_to_work_on[data_type_name_combined][data_to_be_parsed_1]:
						if container_name_to_find == container_name_to_free:
							container_name_to_find = ""
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1][counter_for_header_strings] = ""
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1].erase("")
							counter_for_header_strings +=1
							break
			var counter_new_0 : int = 0
			for data_to_be_parsed_2 in data_to_work_on[data_type_name_combined][data_to_be_parsed_1]:
				if data_to_be_parsed_2 is String:
					for pattern in patterns:
						if data_to_be_parsed_2.begins_with(pattern):
							var string_to_change = data_to_be_parsed_2.split("_")
							var size_of_array = string_to_change.size() -1
							string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
							string_to_change = "_".join(string_to_change)
							data_to_work_on[data_type_name_combined][data_to_be_parsed_1][counter_new_0] = string_to_change
				if data_to_be_parsed_2 is Array:
					print(" recreator data_types : " , data_types)
					if data_types == "instructions":
						print(" recreator_check : 0 : ", data_to_be_parsed_2[0][1][0])
						print(" recreator_check : 0 : ", data_to_be_parsed_2[2][0][0])
						if data_to_be_parsed_2[0][1][0] == "set_the_scene":
							print(" recreator_check : 0 :  we found that set the scene " , number_to_add , " for   " , new_name_for_set)
							data_to_be_parsed_2[2][0][0][0] = str(number_to_add)
							#break
					if initial_number_to_add == 1:
						if data_types == "scenes":
							print(" recreator_check : 10 : ", data_to_be_parsed_2[0][0], " and number_to_add : " , number_to_add)
							print(" recreator_check : 11 : ", data_to_be_parsed_2)
							var scene_number = data_to_be_parsed_2[0][0][0].substr(6, data_to_be_parsed_2[0][0][0].length()) #scene)
							print(" recreator_check : 12 : ", scene_number)
							number_to_add = scene_number
							print(" recreator_check : 14 number_to_add " , number_to_add)
						if data_types == "interactions":
							number_to_add = initial_number_to_add
							print(" recreator_check : 15 number_to_add " , number_to_add)
					else:
						break
					print(" recreator data_types : continuation : " , data_types)
					if data_to_be_parsed_2.size() > 1:
						var counter_new_1 : int = 0
						var counter_helper : int = 0
						for data_to_be_parsed_3 in data_to_be_parsed_2:
							if data_to_be_parsed_3 is String:
								for pattern in patterns:
									if data_to_be_parsed_3.begins_with(pattern):
										var string_to_change = data_to_be_parsed_3.split("_")
										var size_of_array = string_to_change.size() -1
										string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
										string_to_change = "_".join(string_to_change)
										data_to_be_parsed_3 = string_to_change
										counter_helper +=1
							if data_to_be_parsed_3 is Array:
								if data_to_be_parsed_3.size() > 1:
									var counter_new_2 : int = 0
									for data_to_be_parsed_4 in data_to_be_parsed_3:
										if data_to_be_parsed_4[0] is String:
											for pattern in patterns:
												if data_to_be_parsed_4[0].begins_with(pattern):
													var string_to_change = data_to_be_parsed_4[0].split("_")
													var size_of_array = string_to_change.size() -1
													string_to_change[size_of_array] = str(int(string_to_change[size_of_array]) + number_we_wanna_add)
													string_to_change = "_".join(string_to_change)
													data_to_be_parsed_4[0] = string_to_change
										counter_new_2 +=1
							counter_new_1 +=1
				counter_new_0 +=1
				
	
	for container_to_find in data_to_work_on[data_type_name_combined_first]["content"]:
		if container_to_find[0][3][0] == "datapoint":
			datapoint_name = container_to_find[0][0][0] # datapoint_name datapoint_container_name
			datapoint_container_name = container_to_find[0][5][0]
			
			
			
			break
	for data_types in BanksCombiner.data_names_0:
		var data_type_name_combined = data_set_name + "_" + data_types
		var data_type_name_combined_new = new_name_for_set + data_types
		print(data_set_name + "_" + data_types)
		for data_to_be_parsed_1 in data_to_work_on[data_type_name_combined]: 
			processed_data[data_type_name_combined_new] = data_to_work_on[data_type_name_combined].duplicate(true)
	processed_data["metadata"] = {
				"timestamp": Time.get_ticks_msec(),
				"datapoint_name": datapoint_name,
				"datapoint_container_name": datapoint_container_name
			} # # datapoint_name datapoint_container_name
	print(" recreator : ", processed_data)
	return processed_data
	
	
####################







































####################
#
# JSH Scene Tree System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓         ┏┳┓        ┏┓        
#       888  `"Y8888o.   888ooooo888     ┗┓┏┏┓┏┓┏┓   ┃ ┏┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┗ ┛┗┗    ┻ ┛ ┗ ┗   ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                              ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Scene Tree System
#
####################

# Check Branch/ Leaf
# Add Branch/ Leaf
# Remove Branch/ Leaf
# Hide Branch/ Leaf
# Move Branch/ Leaf

####################
# Check Branch/ Leaf
#              ,,                                                                                     ,,             AW                                       ,...
#  .g8"""bgd `7MM                       `7MM          `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
#.dP'     `M   MM                         MM            MM    Yb                                      MM            MV        MM                            dM`   
#dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'      MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
#MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y         MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
#MM.           MM    MM 8M"""""" 8M       MM;Mm         MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
#`Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.       MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#  `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.    .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                                                                                               MV                                                
#                                                                                                              AW                                                 
# Check Branch/ Leaf
####################


func check_if_container_available(container):
	#print()
	tree_mutex.lock()
	
	if scene_tree_jsh["main_root"]["branches"].has(container):
		tree_mutex.unlock()
		print(" lets check the structure ")# , scene_tree_jsh["main_root"]["branches"][container])
		return true
	else:
		tree_mutex.unlock()
		return false
		#[new_path_splitter[0]]["children"].has(new_path_splitter[1]):
	
	tree_mutex.unlock()


func check_if_datapoint_available(container):
	tree_mutex.lock()
	
	if scene_tree_jsh["main_root"]["branches"][container].has("datapoint"):
		tree_mutex.unlock()
		#print(" lets check the structure " , scene_tree_jsh["main_root"]["branches"][container]["datapoint"]["datapoint_path"])
		return true
	else:
		tree_mutex.unlock()
		return false
	
	tree_mutex.unlock()



func check_if_datapoint_node_available(container):
	tree_mutex.lock()
	
	var datapoint_path = scene_tree_jsh["main_root"]["branches"][container]["datapoint"]["datapoint_path"]
	
	#if scene_tree_jsh["main_root"]["branches"][container]["datapoint"].has("datapoint"):
	#	tree_mutex.unlock()
	#	print(" lets check the structure " , scene_tree_jsh["main_root"]["branches"][container]["datapoint"]["datapoint_path"])
	#	return true
	#else:
	#	tree_mutex.unlock()
	#	return false
	
	
	tree_mutex.unlock()
	return datapoint_path

####################
# JSH Scene Tree
func build_pretty_print(node: Node, prefix: String = "", is_last: bool = true) -> String:
	var output = ""
	# Build the current line
	output += prefix
	output += "┖╴" if is_last else "┠╴"
	output += node.name + "\n"
	# Handle children
	var children = node.get_children()
	for i in range(children.size()):
		var child = children[i]
		var child_prefix = prefix + ("   " if is_last else "┃  ")
		var child_is_last = i == children.size() - 1
		output += build_pretty_print(child, child_prefix, child_is_last)
	return output
####################


####################
# JSH Scene Tree
func find_branch_to_unload(thing_path):
	var new_path_splitter = str(thing_path).split("/")
	tree_mutex.lock()
	if scene_tree_jsh["main_root"]["branches"][new_path_splitter[0]]["children"].has(new_path_splitter[1]):
		var branch_part_to_cache = scene_tree_jsh["main_root"]["branches"][new_path_splitter[0]]["children"][new_path_splitter[1]].duplicate(true)
		var branch_name_to_cache = new_path_splitter[0]
		var child_name_to_cache = new_path_splitter[1]
		tree_mutex.unlock()
		cache_branch(branch_name_to_cache, child_name_to_cache, branch_part_to_cache)
		tree_mutex.lock()
		scene_tree_jsh["main_root"]["branches"][new_path_splitter[0]]["children"].erase(new_path_splitter[1])
		tree_mutex.unlock()
	else:
		tree_mutex.unlock()
	array_counting_mutex.lock()
	# if has branch name
	if array_for_counting_finish.has(new_path_splitter[0]):
		if array_for_counting_finish[new_path_splitter[0]].has(new_path_splitter[1]):
			print(" cache branch we can unload that node ", new_path_splitter[1])
			array_for_counting_finish[new_path_splitter[0]].erase(new_path_splitter[1])
		else:
			print(" cache branch that node does not exist in that container", new_path_splitter[0])
	else:
		print(" cache branch that container does not exist")
	array_counting_mutex.unlock()
####################






####################
# JSH Scene Tree
func check_tree_branches():
	tree_mutex.lock()
	if scene_tree_jsh.has("main_root"):
		#print(" i guess we have something in it")
		if scene_tree_jsh.has("branches"):
			tree_mutex.unlock()
			return true
		else:
			tree_mutex.unlock()
			return false
	else:
		tree_mutex.unlock()
		return null
	tree_mutex.unlock()
####################


# Modified print_tree_structure function
####################
# JSH Scene Tree
func print_tree_structure(branch: Dictionary, indent: int = 0):
	tree_mutex.lock()
	var indent_str = "  ".repeat(indent)
	var status = branch.get("status", "pending")  # Default to pending if no status
	print("%s%s (%s) %s" % [
		indent_str, 
		branch["name"], 
		branch["type"],
		status_symbol[status]
	])
	if branch.has("metadata"):
		var metadata = branch["metadata"]
		if metadata.get("has_collision", false):
			print("%s  └─ Has Collision" % indent_str)
		if metadata.get("has_area", false):
			print("%s  └─ Has Area" % indent_str)
	if branch.has("branches"):
		for child in branch["branches"].values():
			tree_mutex.unlock()
			print_tree_structure(child, indent + 1)
	elif branch.has("children"):
		for child in branch["children"].values():
			tree_mutex.unlock()
			print_tree_structure(child, indent + 1)
	tree_mutex.unlock()
####################

####################
# JSH Scene Tree
func jsh_tree_get_node(node_path_get_node: String) -> Node:
	var path_parts = node_path_get_node.split("/")
	tree_mutex.lock()
	var current = scene_tree_jsh["main_root"]["branches"]
	for part in path_parts:
		if current.has(part):
			current = current[part]
			if path_parts[-1] == part:
				#print(" current : " , current["node"])
				tree_mutex.unlock()
				return current["node"]
			else:
				current = current["children"]
	tree_mutex.unlock()
	return null
####################





####################
# JSH Ethereal Engine check stuff before we proceed
func containers_list_creator():
	# check if we have any containers
	mutex_for_container_state.lock()
	if current_containers_state.size() > 0:
		print(" fatal kurwa error : ", current_containers_state)
		print("checkerrr bigger list than 0 ")
		# lets add also there, new status, of what be done before
		# later if it is already in active state, and its own status, is the same, we dont need to check
		for data_sets_to_check in current_containers_state: 
			var three_iii : Vector3i
			var current_state_0 : int = -1
			var current_state_1 : int = -1
			var current_state_2 : int = -1
			three_iii.x = current_state_0
			three_iii.y = current_state_1
			three_iii.z = current_state_2
			var new_information_0 = null
			print(" first we check basics")
			var three_ii
			if current_containers_state[data_sets_to_check].has("three_i"):
				three_ii = current_containers_state[data_sets_to_check]["three_i"]
				three_iii.x = 0
			else:
				three_ii = null
				three_iii.x = -2
			var current_status
			if current_containers_state[data_sets_to_check].has("status"):
				print(" allah akbar, three_ii ", three_ii, current_containers_state[data_sets_to_check]["status"])
				current_status = current_containers_state[data_sets_to_check]["status"]
				three_iii.x = 1
			else:
				current_status = null
				three_iii.x = -2
			var current_container_to_check
			if current_containers_state[data_sets_to_check].has("container_name"):
				current_container_to_check = current_containers_state[data_sets_to_check]["container_name"]
				three_iii.x = 2
			else:
				current_container_to_check = null
				three_iii.x = -2
			# check if tree has that container
			if current_container_to_check != null:
				if current_status != null:
					check_if_first_time(current_container_to_check, current_status)
					three_iii.x = -3
			print(" fatal kurwa error 0 : ", current_container_to_check , ", 1 : " , current_status , ", 2 : " , three_ii)
			if current_container_to_check == null:
				if current_status == null:
					if three_ii == null:
						print(" FATAL KURWA ERROR WE MUST DO SOMETHING")
						three_iii.x -4
			mutex_containers.lock()
			if list_of_containers.has(current_container_to_check):
				print("three_ii tree check 011 normal human first check, if it is, not if it isnt ")
				three_iii.y = 0
				# so that container exist, so we can check more things
				# if status exist there? we can check if it is to load, or to unload
				if list_of_containers[current_container_to_check].has("status"):
					print(" three_ii tree check 013 status? : ", list_of_containers[current_container_to_check]["status"])
					three_iii.y = 1
				# we can check previous three_i check
				if list_of_containers[current_container_to_check].has("three_i"):
					print(" three_ii tree check 014 ")
					list_of_containers[current_container_to_check]["three_i"] = three_iii
					three_iii.y = 2
				else:
					print(" three_ii tree check 015 we dont have it there, yet, lets add something to it")
					list_of_containers[current_container_to_check]["three_i"] = three_iii
			else:
				print("three_ii tree check 0112 three_ii what i maybe trully need more?")
				three_iii.y = -2
			mutex_containers.unlock()
			tree_mutex.lock()
			if scene_tree_jsh.has("main_root"):
				print(" three_ii tree check 00 ")
				three_iii.z = 0
				if scene_tree_jsh["main_root"].has("branches"):
					print(" three_ii tree check 01")
					if scene_tree_jsh["main_root"]["branches"].has(current_container_to_check):
						three_iii.z = 1
						print(" three_ii tree check 02")
					else:
						print(" three_ii tree check 00, we didnt find that container in tree, maybe it will appear, lets add new list of add to queue")
						new_information_0 = container_finder(data_sets_to_check)
						three_iii.z = -2
						print(" new_information_0  : " , new_information_0, " and previous info : " , current_container_to_check)
						if current_container_to_check != new_information_0:
							print(" new_information_0 they are not the same how lol ")
							
							check_if_first_time(new_information_0, current_status)
							three_iii.z = -3
			tree_mutex.unlock()
			mutex_containers.lock()
			for container_to_check in list_of_containers:
				print(" three_ii :" , container_to_check)
				print()
				print(list_of_containers[container_to_check])
				print()
				if new_information_0 != null:
					if list_of_containers[container_to_check].has("connected_containers"):
						# IF NOT HAVE THAT CONTAINER CONNECTED TO THAT CONTAINER, CONNECT THEM
						if !list_of_containers[container_to_check]["connected_containers"].has(new_information_0):
							connect_containers(container_to_check, new_information_0)
					# IF IT DOES NOT HAVE ANY CONNECTED CONTAINERS AT ALL 
					else:
						connect_containers(current_container_to_check, new_information_0)
			mutex_containers.unlock()
			print(" three_ii ",scene_tree_jsh)
			print(" what we even wanted with these three ? three_ii : " , three_ii , " , ", current_status , " , " , current_container_to_check)
			if current_containers_state[data_sets_to_check]["status"] == 1:
				print(" taskkkkl should load = 1 ")
				if three_ii.x == -1:
					print(" allah akbar, run again? 0 ")
					mutex_for_trickery.lock()
					menace_tricker_checker = 1
					mutex_for_trickery.unlock()
				else:
					print(" it has container? ")
				if three_ii.y == -1:
					print(" allah akbar, run again? 1 ")
					mutex_for_trickery.lock()
					menace_tricker_checker = 1
					mutex_for_trickery.unlock()
				if three_ii.z == -1:
					print(" allah akbar, run again 2")
					mutex_for_trickery.lock()
					menace_tricker_checker = 1
					mutex_for_trickery.unlock()
				if three_ii.z == 0:
					# hmm it meant it has anything, and it was container node too?
					print(" allah akbar, run again 3")
					mutex_for_trickery.lock()
					menace_tricker_checker = 1
					mutex_for_trickery.unlock()
					
				if three_ii.z == 1:
					# hmm, that meant we have also datapoint node
					print(" allah akbar, run again 4")
					mutex_for_trickery.lock()
					menace_tricker_checker = 1
					mutex_for_trickery.unlock()
				if three_ii.z == 2:
					continue
			else:
				print(" taskkkkl means unload ?")
				var three_i_update = current_containers_state[data_sets_to_check]["three_i"]
				three_i_update.x = -1
				three_i_update.y = -1
				three_i_update.z = -1
	print(" allah akbar, end : list_of_containers ", list_of_containers)
	mutex_for_container_state.unlock()
####################







####################
# JSH Ethereal Engine Repair
func validate_container_state(container_name):
	var required_nodes = ["datapoint", "container"]
	var missing_nodes = []
	
	tree_mutex.lock()
	if scene_tree_jsh["main_root"]["branches"].has(container_name):
		var container = scene_tree_jsh["main_root"]["branches"][container_name]
		
		for node_type in required_nodes:
			if !container.has(node_type) or !is_instance_valid(container[node_type]["node"]):
				missing_nodes.append(node_type)
	tree_mutex.unlock()
	
	if missing_nodes.size() > 0:
		attempt_container_repair(container_name, missing_nodes)
####################


####################
# JSH Scene Tree
func capture_tree_state() -> Dictionary:
	var root = get_tree().get_root()
	tree_data.structure = capture_node_structure(root)
	tree_data.snapshot = build_pretty_print(root)
	tree_data.timestamp = Time.get_unix_time_from_system()
	return tree_data
####################

####################
# JSH Scene Tree
func capture_node_structure(node: Node) -> Dictionary:
	var data = {
		"name": node.name,
		"class": node.get_class(),
		"path": str(node.get_path()),
		"children": []
	}
	for child in node.get_children():
		data.children.append(capture_node_structure(child))
		tree_data.node_count += 1
	return data
####################


####################
# Add Branch/ Leaf
#                    ,,        ,,                                                      ,,             AW                                       ,...
#      db          `7MM      `7MM      `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
#     ;MM:           MM        MM        MM    Yb                                      MM            MV        MM                            dM`   
#    ,V^MM.     ,M""bMM   ,M""bMM        MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
#   ,M  `MM   ,AP    MM ,AP    MM        MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
#   AbmmmqMA  8MI    MM 8MI    MM        MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
#  A'     VML `Mb    MM `Mb    MM        MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#.AMA.   .AMMA.`Wbmd"MML.`Wbmd"MML.    .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                                                                                MV                                                
#                                                                                               AW                                                 
# Add Branch/ Leaf
####################



# scene tree start up, creating the main root node info there
####################
# JSH Scene Tree
func start_up_scene_tree():
	tree_mutex.lock()
	scene_tree_jsh = TreeBlueprints.SCENE_TREE_BLUEPRINT.duplicate(true)
	var name_to_add = self.name
	scene_tree_jsh["main_root"]["name"] = name_to_add
	scene_tree_jsh["main_root"]["type"] = self.get_class()
	scene_tree_jsh["main_root"]["metadata"]["creation_time"] = Time.get_ticks_msec()
	scene_tree_jsh["main_root"]["node"] = self
	scene_tree_jsh["main_root"]["status"] = "active"
	tree_mutex.unlock()
####################







####################
# JSH Etheric Queue
func recreator_of_singular_thing(data_set):
	var cached_data_new = data_set.duplicate(true) 
	var thing_name
	var coords_to_place
	var direction_to_place
	var thing_type_file
	var shape_name
	var root_name
	var pathway_dna
	var group_number
	var first_line : Array = []
	var lines_parsed : Array = []
	for lines in cached_data_new:
		if lines == cached_data_new[0]:
			first_line = cached_data_new[0]
		else:
			lines_parsed.append(lines)
	thing_name = first_line[0][0]
	coords_to_place = first_line[1][0]
	direction_to_place = first_line[2][0]
	thing_type_file = first_line[3][0]
	shape_name = first_line[4][0]
	root_name = first_line[5][0]
	pathway_dna = first_line[6][0]
	group_number = first_line[7][0]
	#print(" the thingy dingy  : " , thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
	analise_data(thing_name, thing_type_file, first_line, lines_parsed[0], group_number, shape_name, lines_parsed)
	first_line.clear()
	lines_parsed.clear()
####################


####################
# JSH Etheric Queue
func recreate_missing_nodes(array_of_recreation):
	var container_name = array_of_recreation[0]
	var path_of_missing_node = array_of_recreation[1]
	var splitted_path_for_main_thingy = path_of_missing_node.split("/")
	var node_we_look_for_now : String
	var set_name_we_look_for : String
	if splitted_path_for_main_thingy.size() > 1:
		node_we_look_for_now = splitted_path_for_main_thingy[1]
		print(" that thingy is bigger than 1, so it is not container ? " , node_we_look_for_now)
	active_r_s_mut.lock()
	for current_activ_rec in active_record_sets:
		for current_avail_rec in active_record_sets[current_activ_rec][current_activ_rec + "records"]["header"]:
			print("current_avail_rec " , current_avail_rec)
			if node_we_look_for_now == current_avail_rec:
				print(" we found that thing " )
				if scene_tree_jsh["main_root"]["branches"].has(container_name):
					if scene_tree_jsh["main_root"]["branches"][container_name]["children"].has(node_we_look_for_now):
						print_tree_pretty()
						print(" the tree has that branch?")
						print_tree_structure(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], 0)
						disable_all_branches_reset_counters(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], container_name)
						print_tree_structure(scene_tree_jsh["main_root"]["branches"][container_name]["children"][node_we_look_for_now], 0)
						var path_for_node_to_unload = container_name + "/" + node_we_look_for_now
						array_counting_mutex.lock()
						if array_for_counting_finish[container_name].has(node_we_look_for_now):
							array_for_counting_finish[container_name][node_we_look_for_now]["node"] = []
						array_counting_mutex.unlock()
						for singular_thingies in active_record_sets[current_activ_rec][current_activ_rec + "records"]["content"]:
							print(" singular_thingies : " , singular_thingies[0][0][0])
							if singular_thingies[0][0][0] == node_we_look_for_now:
								print(" we found active records part : " , singular_thingies)
								unload_node_branch(path_for_node_to_unload, singular_thingies)
								return
				return
	active_r_s_mut.unlock()
####################


####################
# JSH Etheric Queue
func unload_node_branch(path_for_node_to_unload, recreation_of_node_data):
	var node_to_unload_now = jsh_tree_get_node(path_for_node_to_unload)
	if node_to_unload_now:
		print(" node_to_unload_now : " , node_to_unload_now)
		node_to_unload_now.queue_free()
	print_tree_pretty()
	recreator_of_singular_thing(recreation_of_node_data)
####################


####################
# JSH Scene Tree System
func attempt_container_repair(container_name, missing_nodes):
	active_r_s_mut.lock()
	var records_set_name = container_name.split("_")[0] + "_"
	
	if active_record_sets.has(records_set_name):
		var records = active_record_sets[records_set_name]
		# Attempt to recreate missing nodes from records
		for node_type in missing_nodes:
			recreate_node_from_records(container_name, node_type, records) 
	active_r_s_mut.unlock()
####################


####################
# JSH Scene Tree System
func recreate_node_from_records(container_name: String, node_type: String, records: Dictionary):
	print("Attempting to recreate %s for container %s" % [node_type, container_name])
	
	var records_set_name = container_name + "records"
	var node_data = null
	
	# Find the original node data in records
	if records.has(records_set_name):
		for record in records[records_set_name]["content"]:
			if record[0][3][0] == node_type:  # Check node type
				node_data = record[0]
				break
	
	if node_data:
		match node_type:
			"datapoint":
				var data_point = Node3D.new()
				data_point.set_script(DataPointScript)
				data_point.setup_main_reference(self)
				
				# Recreate with original parameters
				var version = node_data[4][0]  # Version from records
				var setup_data = node_data[5]  # Setup data from records
				data_point.power_up_data_point(node_data[0][0], int(version), setup_data)
				
				# Add to scene tree
				var node_path = node_data[6][0]
				tasked_children(data_point, node_path)
				
				# Update tree data
				tree_mutex.lock()
				scene_tree_jsh["main_root"]["branches"][container_name]["datapoint"] = {
					"datapoint_name": node_data[0][0],
					"datapoint_path": node_path,
					"node": data_point
				}
				tree_mutex.unlock()
				
			"container":
				var container = Node3D.new()
				container.set_script(ContainterScript)
				container.name = node_data[0][0]
				
				if container.has_method("container_initialize"):
					container.container_initialize(node_data[5])
				
				var node_path = node_data[6][0]
				tasked_children(container, node_path)
				
				tree_mutex.lock()
				scene_tree_jsh["main_root"]["branches"][container_name]["node"] = container
				scene_tree_jsh["main_root"]["branches"][container_name]["status"] = "active"
				tree_mutex.unlock()
			
			_:
				print("Unknown node type for recreation: ", node_type)
		
		# Log recovery attempt
		log_error_state("node_recreation", {
			"container": container_name,
			"node_type": node_type,
			"success": true
		})
	else:
		print("Failed to find data for node recreation")
		log_error_state("node_recreation_failed", {
			"container": container_name,
			"node_type": node_type,
			"reason": "no_data_found"
		})
####################



####################
# JSH Scene Tree System
func tasked_children(node_to_be_added, node_to_be_added_path):
	var splitted_path = node_to_be_added_path.split("/")
	var container_name = splitted_path[0]
	var node_to_be_added_name = splitted_path[-1]
	var parent_path = "/".join(splitted_path.slice(0, -1)) 
	if splitted_path.size() == 1:
		var node_type : int = 0
		mutex_nodes_to_be_added.lock()
		nodes_to_be_added.append([node_type, node_to_be_added_name, node_to_be_added])
		mutex_nodes_to_be_added.unlock()
	elif splitted_path.size() == 2:
		var node_type : int = 1
		mutex_nodes_to_be_added.lock()
		nodes_to_be_added.append([node_type, parent_path, node_to_be_added_name, node_to_be_added])
		mutex_nodes_to_be_added.unlock()
	else:
		var parent_name = splitted_path[1]
		var node_type : int = 2
		mutex_nodes_to_be_added.lock()
		nodes_to_be_added.append([node_type, parent_path, node_to_be_added_name, node_to_be_added, container_name])
		mutex_nodes_to_be_added.unlock()
####################



####################
# JSH Scene Tree System
func process_active_records_for_tree(active_records: Dictionary, set_name_to_process : String, container_name_here : String):
	#print(" the task dilema 12 0")
	var records_set_name = set_name_to_process + "records"
	active_r_s_mut.lock()
	for record in active_records[set_name_to_process][records_set_name]["content"]:
		var node_data = record[0]
		var node_name = node_data[0][0]
		var node_path_p_a_r_f_t = node_data[6][0]
		var node_type = node_data[3][0]
		var godot_type = match_node_type(node_type)
		if node_type != "container" and node_type != "datapoint":
			array_counting_mutex.lock()


			if !array_for_counting_finish[container_name_here].has("metadata"):
				var counter_before : int = 0
				var counter_after : int = 0
				var inty_bolean : int = 0
				array_for_counting_finish[container_name_here]["metadata"] = {
					"counter_before" = counter_before,
					"counter_after" = counter_after,
					"process_to_send" = inty_bolean
				}
			
			array_counting_mutex.unlock()



			array_counting_mutex.lock()
			
			
			if !array_for_counting_finish[container_name_here].has(node_name):
				array_for_counting_finish[container_name_here][node_name] = {
					"node" = [],
					"type" = node_type,
					"g_type" = godot_type
				}
				
				
			array_counting_mutex.unlock()
			
			
		array_counting_mutex.lock()
		if !array_for_counting_finish[container_name_here].has("metadata"):
			var counter_before : int = 0
			var counter_after : int = 0
			var inty_bolean : int = 0
			array_for_counting_finish[container_name_here]["metadata"] = {
				"counter_before" = counter_before,
				"counter_after" = counter_after,
				"process_to_send" = inty_bolean
			}
		array_counting_mutex.unlock()


		if node_type == "datapoint":
			array_counting_mutex.lock()
			array_for_counting_finish[container_name_here]["metadata"]["datapoint_path"] = node_path_p_a_r_f_t
			array_for_counting_finish[container_name_here]["metadata"]["datapoint_name"] = node_name
			array_counting_mutex.unlock()
		if node_type == "container":
			array_counting_mutex.lock()
			array_for_counting_finish[container_name_here]["metadata"]["container_path"] = node_path_p_a_r_f_t
			array_for_counting_finish[container_name_here]["metadata"]["container_name"] = node_name
			array_counting_mutex.unlock()
		var new_type_thingy = godot_type + "|" + node_type
		#print(" the task dilema 12 1")
		the_pretender_printer(node_name, node_path_p_a_r_f_t, new_type_thingy, node_type)
		#print(" the task dilema 12 2")
		array_counting_mutex.lock()
		array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=1
		array_counting_mutex.unlock()
				# Add collision nodes based on type
		if node_type in ["flat_shape", "model", "cursor", "screen", "circle"]:
			array_counting_mutex.lock()
			array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=4
			array_counting_mutex.unlock()
			# Static body and shape
			var static_body_name = "collision_" + node_name
			var static_body_path = node_path_p_a_r_f_t + "/" + static_body_name
			the_pretender_printer(static_body_name, static_body_path, "StaticBody3D", "collision")
			var shape_name = "shape_" + node_name
			var shape_path = static_body_path + "/" + shape_name
			the_pretender_printer(shape_name, shape_path, "CollisionShape3D", "collision")
			# Area and its shape
			var area_name = "aura_" + node_name
			var area_path = node_path_p_a_r_f_t + "/" + area_name
			the_pretender_printer(area_name, area_path, "Area3D", "area")
			var area_shape_name = "collision_aura_" + node_name
			var area_shape_path = area_path + "/" + area_shape_name
			the_pretender_printer(area_shape_name, area_shape_path, "CollisionShape3D", "collision")
		# Special handling for buttons
		elif node_type == "button":
			array_counting_mutex.lock()
			array_for_counting_finish[container_name_here]["metadata"]["counter_before"] +=6
			array_counting_mutex.unlock()
			var text_name = "text_" + node_name
			var text_path = node_path_p_a_r_f_t + "/" + text_name
			the_pretender_printer(text_name, text_path, "Label3D", "text")
			var shape_name = "shape_" + node_name
			var shape_path = node_path_p_a_r_f_t + "/" + shape_name
			the_pretender_printer(shape_name, shape_path, "MeshInstance3D", "button")
			# Collision for shape
			var collision_shape_name = "collision_" + shape_name
			var collision_shape_path = shape_path + "/" + collision_shape_name
			the_pretender_printer(collision_shape_name, collision_shape_path, "StaticBody3D", "collision")
			var shape_collision_name = "shape_" + shape_name
			var shape_collision_path = collision_shape_path + "/" + shape_collision_name
			the_pretender_printer(shape_collision_name, shape_collision_path, "CollisionShape3D", "collision")
			# Area for shape
			var area_name = "aura_" + shape_name
			var area_path = shape_path + "/" + area_name
			the_pretender_printer(area_name, area_path, "Area3D", "area")
			var area_collision_name = "collision_aura_" + shape_name
			var area_collision_path = area_path + "/" + area_collision_name
			the_pretender_printer(area_collision_name, area_collision_path, "CollisionShape3D", "collision")
	#print(" process active record for tree dilema finish")
	active_r_s_mut.unlock()
####################

####################
# JSH Scene Tree System
func match_node_type(type: String) -> String:
	match type:
		"flat_shape", "model", "cursor", "screen", "circle":
			return "MeshInstance3D"
		"text":
			return "Label3D"
		"button":
			return "Node3D" 
		"connection":
			return "MeshInstance3D"
		"text_mesh":
			return "MeshInstance3D"
		"datapoint":
			return "Node3D"
		"container":
			return "Node3D"
		_:
			return "Node3D"
####################


####################
# JSH Scene Tree
func the_pretender_printer(node_name: String, node_path_jsh_tree: String, godot_node_type, node_type: String = "Node3D"):
	#print("  the task dilema 12 1 0")
	tree_mutex.lock()
	if !scene_tree_jsh.has("main_root"):
		scene_tree_jsh = TreeBlueprints.SCENE_TREE_BLUEPRINT.duplicate(true)
		scene_tree_jsh["main_root"]["name"] = "main"
		scene_tree_jsh["main_root"]["type"] = "Node3D"
		scene_tree_jsh["main_root"]["status"] = "active"
		scene_tree_jsh["main_root"]["node"] = self
	var path_parts = node_path_jsh_tree.split("/")
	var current_branch = scene_tree_jsh["main_root"]["branches"]
	#print("  the task dilema 12 1 1")
	cached_tree_mutex.lock()
	var cached_current_branch = cached_jsh_tree_branches
	cached_tree_mutex.unlock()
	# Track the full path as we build it
	var current_full_path = ""
	# Handle path traversal
	for i in range(path_parts.size()):
		var part = path_parts[i]
		current_full_path = current_full_path + "/" + part if current_full_path else part
		if !current_branch.has(part):
			if cached_current_branch.has(part):
				print(" the cached branch has that one ")
				current_branch[part] = cached_current_branch[part]
				cached_current_branch.erase(part)
			else:
				var new_branch = TreeBlueprints.BRANCH_BLUEPRINT.duplicate(true)
				new_branch["name"] = part
				new_branch["type"] = godot_node_type
				new_branch["jsh_type"] = node_type
				new_branch["status"] = "pending"
				new_branch["node"] = null
				new_branch["metadata"] = {
					"creation_time": Time.get_ticks_msec(),
					"full_path": current_full_path,
					"parent_path": current_full_path.get_base_dir(),
					"has_collision": false,
					"has_area": false
				}
				if node_type == "datapoint":
					scene_tree_jsh["main_root"]["branches"][path_parts[0]]["datapoint"] = {
						"datapoint_name" = new_branch["name"],
						"datapoint_path" = new_branch["metadata"]["full_path"]
					}
				current_branch[part] = new_branch
		if i < path_parts.size() - 1:
			if !current_branch[part].has("children"):
				current_branch[part]["children"] = {}
			current_branch = current_branch[part]["children"]
			if cached_current_branch.has(part):
				if cached_current_branch[part].has("children"):
					print(" the cached branch had them children")
					cached_current_branch = cached_current_branch[part]["children"]
	tree_mutex.unlock()
####################


####################
# Remove Branch/ Leaf
#                                                                                                                   ,,             AW                                       ,...
#`7MM"""Mq.                                                         `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
#  MM   `MM.                                                          MM    Yb                                      MM            MV        MM                            dM`   
#  MM   ,M9  .gP"Ya `7MMpMMMb.pMMMb.  ,pW"Wq.`7M'   `MF'.gP"Ya        MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
#  MMmmdM9  ,M'   Yb  MM    MM    MM 6W'   `Wb VA   ,V ,M'   Yb       MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
#  MM  YM.  8M""""""  MM    MM    MM 8M     M8  VA ,V  8M""""""       MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
#  MM   `Mb.YM.    ,  MM    MM    MM YA.   ,A9   VVV   YM.    ,       MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#.JMML. .JMM.`Mbmmd'.JMML  JMML  JMML.`Ybmd9'     W     `Mbmmd'     .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                                                                                                             MV                                                
#                                                                                                                            AW                                                 
# Remove Branch/ Leaf
####################


####################
# JSH Projections System
func unload_container(container_to_unload):
	
	
	# BanksCombiner.container_set_name
	
	var data_sets_names = null
	
	if BanksCombiner.container_set_name.has(container_to_unload):
		data_sets_names = BanksCombiner.container_set_name[container_to_unload]
	
	print(" container_to_unload : " , container_to_unload)
	cache_tree_branch_fully(container_to_unload)
	process_to_unload_records(container_to_unload)
	array_counting_mutex.lock()
	# if has branch name
	if array_for_counting_finish.has(container_to_unload):
		print(" cache branch entire contionaeir now lololo")
		array_for_counting_finish.erase(container_to_unload)
	else:
		print(" cache branch that container does not exist")
	array_counting_mutex.unlock()
	
	if data_sets_names != null:
		print("unloading philantrophy we got something in it ")
		if data_sets_names is String:
			print(" just singular action , ", data_sets_names )
		elif data_sets_names is Array:
			print("unloading philantrophy more than one set in that container ", data_sets_names)
	
####################



####################
# JSH Scene Tree System
func unload_nodes(array_of_thingiess_that_shall_remain):
	var counter_1 : int = 0
	var counter_2 : int = 0
	var data_point_node = array_of_thingiess_that_shall_remain[1][0]
	var data_point
	var children_finder = array_of_thingiess_that_shall_remain[0][0].get_children()
	for children in children_finder:
		var thing_to_something : int = 0
		thing_to_something = 0
		for nodes_to_remain in array_of_thingiess_that_shall_remain:
			if str(children.name) == str(nodes_to_remain[0]):
				thing_to_something = 1
				break
		match thing_to_something:
			0:
				counter_1 +=1
				print("this thing shall be unloaded :)")
				print(" children  ", children)
				find_branch_to_unload(children.get_path())
				children.queue_free()
			1:
				counter_2 +=1
				if data_point_node == str(children.name):
					data_point = children
	if counter_1 <=1:
		pass
####################
	#else:
	#	data_point.update_layer_0_after_freeing()


####################
# JSH Scene Tree
func cache_tree_branch_fully(container_to_unload):
	cached_tree_mutex.lock()
	print(" new function to cache tree branch fully ", container_to_unload)
	if !cached_jsh_tree_branches.has(container_to_unload):
		print(" new function, it doesnt have that branch ", container_to_unload)
		tree_mutex.lock()
		if scene_tree_jsh["main_root"]["branches"].has(container_to_unload):
			print(" the main scene tree thingy got that container in it rn ")
			tree_mutex.unlock()
			disable_all_branches(scene_tree_jsh["main_root"]["branches"][container_to_unload])
			tree_mutex.lock()
			cached_jsh_tree_branches[container_to_unload] = scene_tree_jsh["main_root"]["branches"][container_to_unload]
			scene_tree_jsh["main_root"]["branches"].erase(container_to_unload)
			tree_mutex.unlock()
		else:
			tree_mutex.unlock()
	cached_tree_mutex.unlock()
####################

####################
# JSH Scene Tree
func cache_branch(branch_name, child_name, branch_part):
	print(" cache branch : ", branch_name, child_name)
	cached_tree_mutex.lock()
	if !cached_jsh_tree_branches.has(branch_name):
		tree_mutex.lock()
		cached_jsh_tree_branches[branch_name] = {
			"name" = scene_tree_jsh["main_root"]["branches"][branch_name]["name"],
			"type" = scene_tree_jsh["main_root"]["branches"][branch_name]["type"],
			"jsh_type" = scene_tree_jsh["main_root"]["branches"][branch_name]["jsh_type"],
			"parent" = scene_tree_jsh["main_root"]["branches"][branch_name]["parent"],
			"status" = "disabled",
			"node" = null,
			"metadata" = scene_tree_jsh["main_root"]["branches"][branch_name]["metadata"],
			"children" = {}
		}
		tree_mutex.unlock()
	if cached_jsh_tree_branches.has(branch_name):
		if !cached_jsh_tree_branches[branch_name]["children"].has(child_name):
			disable_all_branches(branch_part)
			tree_mutex.lock()
			cached_jsh_tree_branches[branch_name]["children"][child_name] = branch_part
			tree_mutex.unlock()
	cached_tree_mutex.unlock()
####################

####################
# Hide Branch/ Leaf
#                ,,        ,,                                                              ,,             AW                                       ,...
#`7MMF'  `7MMF'  db      `7MM              `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
#  MM      MM              MM                MM    Yb                                      MM            MV        MM                            dM`   
#  MM      MM  `7MM   ,M""bMM  .gP"Ya        MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
#  MMmmmmmmMM    MM ,AP    MM ,M'   Yb       MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
#  MM      MM    MM 8MI    MM 8M""""""       MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
#  MM      MM    MM `Mb    MM YM.    ,       MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#.JMML.  .JMML..JMML.`Wbmd"MML.`Mbmmd'     .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                                                                                    MV                                                
#                                                                                                   AW                                                 
# Hide Branch/ Leaf
####################

####################
# Move Branch/ Leaf
#                                                                                              ,,             AW                                       ,...
#`7MMM.     ,MMF'                              `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
#  MMMb    dPMM                                  MM    Yb                                      MM            MV        MM                            dM`   
#  M YM   ,M MM  ,pW"Wq.`7M'   `MF'.gP"Ya        MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
#  M  Mb  M' MM 6W'   `Wb VA   ,V ,M'   Yb       MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
#  M  YM.P'  MM 8M     M8  VA ,V  8M""""""       MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
#  M  `YM'   MM YA.   ,A9   VVV   YM.    ,       MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#.JML. `'  .JMML.`Ybmd9'     W     `Mbmmd'     .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                                                                                        MV                                                
#                                                                                                       AW                                                 
# Move Branch/ Leaf
####################


####################
# Change Branch/ Leaf
#               ,,                                                                                                  ,,             AW                                       ,...
#   .g8"""bgd `7MM                                                  `7MM"""Yp,                                    `7MM            ,M'     `7MMF'                          .d' ""
# .dP'     `M   MM                                                    MM    Yb                                      MM            MV        MM                            dM`   
# dM'       `   MMpMMMb.   ,6"Yb.  `7MMpMMMb.  .P"Ybmmm .gP"Ya        MM    dP `7Mb,od8 ,6"Yb.  `7MMpMMMb.  ,p6"bo  MMpMMMb.     AW         MM         .gP"Ya   ,6"Yb.   mMMmm  
# MM            MM    MM  8)   MM    MM    MM :MI  I8  ,M'   Yb       MM"""bg.   MM' "'8)   MM    MM    MM 6M'  OO  MM    MM    ,M'         MM        ,M'   Yb 8)   MM    MM    
# MM.           MM    MM   ,pm9MM    MM    MM  WmmmP"  8M""""""       MM    `Y   MM     ,pm9MM    MM    MM 8M       MM    MM    MV          MM      , 8M""""""  ,pm9MM    MM    
# `Mb.     ,'   MM    MM  8M   MM    MM    MM 8M       YM.    ,       MM    ,9   MM    8M   MM    MM    MM YM.    , MM    MM   AW           MM     ,M YM.    , 8M   MM    MM    
#   `"bmmmd'  .JMML  JMML.`Moo9^Yo..JMML  JMML.YMMMMMb  `Mbmmd'     .JMMmmmd9  .JMML.  `Moo9^Yo..JMML  JMML.YMbmd'.JMML  JMML.,M'         .JMMmmmmMMM  `Mbmmd' `Moo9^Yo..JMML.  
#                                             6'     dP                                                                       MV                                                
#                                             Ybmmmd'                                                                        AW                                                 
# Change Branch/ Leaf
####################


####################
# JSH Etheric Queue
func the_finisher_for_nodes(data_to_be_parsed):
	var path_of_node_jsh = data_to_be_parsed[0][0]
	var node_name_jsh_checker = data_to_be_parsed[0][1]
	var node_to_be_checker = data_to_be_parsed[0][2]
	jsh_tree_get_node_status_changer(path_of_node_jsh, node_name_jsh_checker, node_to_be_checker)
####################




####################
# JSH Etheric Queue
func disable_all_branches_reset_counters(branch_to_disable, container_name_for_array):
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	var process_branch = func traverse_branch(branch: Dictionary):
		if branch["metadata"].has("full_path") and branch["metadata"]["full_path"] != null:
			all_containers.append(branch["name"])
			if branch["status"] == "active":
				array_counting_mutex.lock()
				array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
				array_counting_mutex.unlock()
			branch["status"] = "disabled"
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				if branch["children"][child_name]["status"] == "active":
					array_counting_mutex.lock()
					array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
					array_counting_mutex.unlock()
				branch["children"][child_name]["status"] = "disabled"
	# Children finder
	var process_children = func traverse_branch(branch: Dictionary):
		if branch.has("metadata"):# we must complete the evaluation evolution and ovulation of this game
			all_nodes.append(branch["metadata"]["full_path"])
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				if branch["children"][child_name]["status"] == "active":
					array_counting_mutex.lock()
					array_for_counting_finish[container_name_for_array]["metadata"]["counter_after"] -=1
					array_counting_mutex.unlock()
				branch["children"][child_name]["status"] = "disabled"
	process_branch.call(branch_to_disable)
	var current_branches = branches_to_process.duplicate(false)
	# Process branches until none left
	while branches_to_process.size() > 0:
		var current_branch = branches_to_process[0]  # Get first branch
		process_branch.call(current_branch)        # Process it
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically
####################

# and here we process that data
####################
# JSH Etheric Queue
func jsh_tree_get_node_status_changer(node_path_jsh_tree_status: String, node_name: String, node_to_check: Node):
	var path_parts_jsh_status_node = node_path_jsh_tree_status.split("/")
	tree_mutex.lock()
	var current = scene_tree_jsh["main_root"]["branches"]
	tree_mutex.unlock()
	var name_of_container = path_parts_jsh_status_node[0]
	var name_of_current_thing = path_parts_jsh_status_node[path_parts_jsh_status_node.size() - 1]
	tree_mutex.lock()
	array_counting_mutex.lock()
	for part in path_parts_jsh_status_node:
		if current.has(part):
			current = current[part]
			if path_parts_jsh_status_node[-1] == part:
				if node_to_check:
					current["status"] = "active"
					current["node"] = node_to_check
					if array_for_counting_finish.has(name_of_container):
						if array_for_counting_finish[name_of_container].has(name_of_current_thing):
							array_for_counting_finish[name_of_container][name_of_current_thing]["node"] = node_to_check
						array_for_counting_finish[path_parts_jsh_status_node[0]]["metadata"]["counter_after"] +=1
						if array_for_counting_finish[name_of_container]["metadata"]["datapoint_name"] == name_of_current_thing:
							array_for_counting_finish[name_of_container]["metadata"]["datapoint_node"] = node_to_check
						if array_for_counting_finish[name_of_container]["metadata"]["container_path"] == name_of_current_thing:
							array_for_counting_finish[name_of_container]["metadata"]["container_node"] = node_to_check
						# here we get all the nodes, so we can send further, dictionary with all them nodes
						if array_for_counting_finish[name_of_container]["metadata"]["counter_before"] == array_for_counting_finish[name_of_container]["metadata"]["counter_after"]:
							create_new_task("newer_even_function_for_dictionary", name_of_container)
					else:
						print(" dilemafiasco i guess it could like, not find somehow that container? how ?")
				else: # here i guess, the node doest exist? which should not be possible in current sceneario, where we get it on main thread, and task is made after that?
					print(" dilemafiasco new way to check node from proces we are but we didnt get node? on if:")
			else: # we didnt find it yet, so we dig further
				current = current["children"]
		else:
			print(" dilemafiasco the new one? ")
	tree_mutex.unlock()
	array_counting_mutex.unlock()
####################



####################
# JSH Ethereal Engine check stuff before we proceed
func connect_containers(container_name_0, container_name_1):
	print(" two containers to connect " , container_name_0 , " and : " , container_name_0)
	var container_data_0
	var container_data_1
	mutex_containers.lock()
	if list_of_containers.has(container_name_0):
		# it has that container
		if list_of_containers[container_name_0].has("connected_containers"):
			container_data_0 = list_of_containers[container_name_0]
		else:
			# it needs connected containers, connection
			list_of_containers[container_name_0]["connected_containers"] = {}
			list_of_containers[container_name_0]["connected_containers"][container_name_1] = {}
	if list_of_containers.has(container_name_1):
		if list_of_containers[container_name_1].has("connected_containers"):
			container_data_1 = list_of_containers[container_name_1]
		else:
			list_of_containers[container_name_1]["connected_containers"] = {}
			list_of_containers[container_name_1]["connected_containers"][container_name_0] = {}
	mutex_containers.unlock()
####################



# container_path
####################
# JSH Scene Tree
func disable_all_branches(branch_to_disable):
	var all_containers : Array = []
	var all_nodes : Array = []
	var branches_to_process : Array = []
	var just_container : Array = []
	var process_branch = func traverse_branch(branch: Dictionary):
		tree_mutex.lock()
		if branch["metadata"].has("full_path") and branch["metadata"]["full_path"] != null:
			all_containers.append(branch["name"])
			branch["status"] = "disabled"
			branch["node"] = null
		if branch.has("children"):
			for child_name in branch["children"]:
				branches_to_process.append(branch["children"][child_name])
				branch["children"][child_name]["status"] = "disabled"
				branch["children"][child_name]["node"] = null 
		tree_mutex.unlock()
	process_branch.call(branch_to_disable)
	var current_branches = branches_to_process.duplicate(false)
	# Process branches until none left
	while branches_to_process.size() > 0:
		tree_mutex.lock()
		var current_branch = branches_to_process[0]  # Get first branch
		tree_mutex.unlock()
		process_branch.call(current_branch)        # Process it
		tree_mutex.lock()
		branches_to_process.remove_at(0)            # Remove it and array shifts automatically
		tree_mutex.unlock()
####################















































































####################
#
# JSH Ethereal Multi Threads System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┳┳┓  ┓ •  ┏┳┓┓        ┓   ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┃┃┃┓┏┃╋┓   ┃ ┣┓┏┓┏┓┏┓┏┫┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┛ ┗┗┻┗┗┗   ┻ ┛┗┛ ┗ ┗┻┗┻┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                                  ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Multi Threads System
#
####################


####################
# JSH Task System
func test_single_core():
	prepare_akashic_records()
####################

####################
# JSH Task System
func test_multi_threaded():
	var function_name = "prepare_akashic_records"
	create_new_task_empty(function_name)
####################


####################
# JSH Hidden Veil
func check_thread_status():
	var basic_state : String
	if thread_pool == null:
		print(" thread_stats error first")
		return "error"
	else:
		basic_state = "working"
	var thread_stats = thread_pool.get_thread_stats()
	var total_threads = OS.get_processor_count()
	var executing_threads = 0
	var stuck_threads = 0

	#if thread_stats:
		#print(" thread_stats " , thread_stats)
	#else:
		#print( " thread_stats error " , thread_stats)

	for thread_id in thread_stats:
		var state = thread_stats[thread_id]
		if state["status"] == "executing":
			executing_threads += 1
		if state["is_stuck"]:
			stuck_threads += 1
	return basic_state
####################

####################
# JSH Hidden Veil
func check_thread_status_type():
	var basic_state : String
	if thread_pool == null:
		return "error"
	else:
		basic_state = "working"
	var thread_stats = thread_pool.get_thread_stats()
	var total_threads = OS.get_processor_count()
	var executing_threads = 0
	var stuck_threads = 0
	print("\nThread Pool Status:")
	for thread_id in thread_stats:
		var state = thread_stats[thread_id]
		if state["status"] == "executing":
			executing_threads += 1
		if state["is_stuck"]:
			stuck_threads += 1
		print("Thread %s:" % thread_id)
		print("  Status: %s (for %dms)" % [
			state["status"],
			state["time_in_state_ms"]
		])
		print("  Tasks Completed: %d" % state["tasks_completed"])
		
		if state["current_task"]:
			print("  Current Task: %s" % state["current_task"].target_method)
			print("  Task Args: %s" % str(state["current_task"].target_argument))
	print("\nSummary:")
	print("Total Threads: %d" % total_threads)
	print("Executing: %d" % executing_threads)
	print("Stuck: %d" % stuck_threads)
	return total_threads
####################

####################
# was
# JSH Ethereal Engine Repair
# is
# JSH Multi Threads
func multi_threads_start_checker():
	print(" preparer_of_data : " , preparer_of_data)
	if preparer_of_data.size() == 3:
		
		print(" we have main, thread and delta ")
		if preparer_of_data[0] == preparer_of_data[2]:
			print(" these are main core ")
			if preparer_of_data[0] != preparer_of_data[1]:
				print(" it is different thread")
				return true
			else:
				return false
		else:
			return false
	else:
		return false
####################


####################
# JSH Ethereal Engine Repair
var preparer_of_data : Array = []
####################



####################
# JSH Ethereal Engine Repair
func prepare_akashic_records():
	
	var thread_id = OS.get_thread_caller_id()
	preparer_of_data.append(thread_id)
	print(" threads dilema : " , thread_id)

####################

# creating new tasks, also punishing mortals 
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

# to call functions() without anything(something)
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

####################
# JSH Multi Threads
func check_three_tries_for_threads(threads_0, threads_1, threads_2):
	var thread_test : int = -1
	if threads_0 == threads_1 and threads_0 == threads_2:
		thread_test = 2
		return thread_test
	if threads_1 == threads_2:
		thread_test = 1
		return thread_test
	else:
		thread_test = 0
		return thread_test
	return thread_test
####################


####################
# was
# JSH Ethereal Engine tests
# is
# JSH Multi Threads
func validate_thread_system() -> Dictionary:
	var thread_check = check_thread_status()
	return {
		"status": "operational" if thread_check == "working" else "error",
		"total_threads": OS.get_processor_count(),
		"active_threads": thread_pool.get_active_threads() if thread_pool else 0,
		"initialization_time": Time.get_ticks_msec()
	}
####################


















####################
#
# JSH Ethereal Files Management System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓ ┓         ┓  ┏┓•┓     ┳┳┓                    ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣ ╋┣┓┏┓┏┓┏┓┏┓┃  ┣ ┓┃┏┓┏  ┃┃┃┏┓┏┓┏┓┏┓┏┓┏┳┓┏┓┏┓╋  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┗┛┗┛┗┗ ┛ ┗ ┗┻┗  ┻ ┗┗┗ ┛  ┛ ┗┗┻┛┗┗┻┗┫┗ ┛┗┗┗ ┛┗┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                                        ┛               ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Ethereal Files Management System
#
####################

# Create Files
# Check Files
# Load Files
# Modify Files


####################
# Create Files                                                                                        
#                                                                  ,,    ,,                  
#   .g8"""bgd                          mm               `7MM"""YMM db  `7MM                  
# .dP'     `M                          MM                 MM    `7       MM                  
# dM'       ``7Mb,od8 .gP"Ya   ,6"Yb.mmMMmm .gP"Ya        MM   d `7MM    MM  .gP"Ya  ,pP"Ybd 
# MM           MM' "',M'   Yb 8)   MM  MM  ,M'   Yb       MM""MM   MM    MM ,M'   Yb 8I   `" 
# MM.          MM    8M""""""  ,pm9MM  MM  8M""""""       MM   Y   MM    MM 8M"""""" `YMMMa. 
# `Mb.     ,'  MM    YM.    , 8M   MM  MM  YM.    ,       MM       MM    MM YM.    , L.   I8 
#   `"bmmmd' .JMML.   `Mbmmd' `Moo9^Yo.`Mbmo`Mbmmd'     .JMML.   .JMML..JMML.`Mbmmd' M9mmmP' 
# Create Files
####################




# creating file, what to put in, where,name
####################
# JSH Files Management
func file_creation(file_content,  path_for_file, name_for_file):
	var file = FileAccess.open( path_for_file + "/" + name_for_file + ".txt", FileAccess.WRITE)
	if file:
		for line in file_content:
			file.store_line(line)  # [0] because each line is in its own array
####################

# file creation, here we have functions from second, maybe third chicken
# now we have nice eggs
####################
# JSH Files Management
func create_file(array_with_data: Array, lines_amount: int, name_for_file: String):

	var file = FileAccess.open(path + "/" + name_for_file + ".txt", FileAccess.WRITE)
	if file:
		# We'll loop from 0 to lines_amount-1 to write each line
		for line in range(lines_amount):
			file.store_line(array_with_data[line][0]) 
		file_path = path + "/" + name_for_file + ".txt"
####################

####################
# JSH Files Management
func save_file_list_text(scan_results: Dictionary, output_file: String, target_directory: String):
	var file = FileAccess.open(output_file, FileAccess.WRITE)
	if not file:
		print("❌ Error: Could not create file_list.txt")
		return

	file.store_line("📂 File List for " + target_directory + "\n") # Fixed scope issue
	
	for subdir in scan_results["directories"]:
		file.store_line("📁 " + subdir)

	for file_data in scan_results["files"]:
		file.store_line("📄 " + file_data["name"] + " - " + str(file_data["size"]) + " bytes")
	
	file.close()
	print("✅ File list saved to: " + output_file)
####################








# and this
####################
# JSH Files Management
func create_default_settings(file_path_c_d_s):
	var settings_data = []
	for entry in SettingsBank.settings_file_blue_print_0[0]:
		settings_data.append(entry)
	create_file(settings_data, settings_data.size(), "settings")
####################


####################
# JSH Files Management
func save_file_list_json(scan_results: Dictionary, output_file: String = "user://file_list.json"):
	var file = FileAccess.open(output_file, FileAccess.WRITE)
	if file:
		var json_data = JSON.stringify(scan_results, "\t")  # Pretty JSON format
		file.store_string(json_data)
		file.close()
		print("✅ File list saved to: " + output_file)
####################



####################
# Check Files
#               ,,                                                ,,    ,,                  
#   .g8"""bgd `7MM                       `7MM          `7MM"""YMM db  `7MM                  
# .dP'     `M   MM                         MM            MM    `7       MM                  
# dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'      MM   d `7MM    MM  .gP"Ya  ,pP"Ybd 
# MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y         MM""MM   MM    MM ,M'   Yb 8I   `" 
# MM.           MM    MM 8M"""""" 8M       MM;Mm         MM   Y   MM    MM 8M"""""" `YMMMa. 
# `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.       MM       MM    MM YM.    , L.   I8 
#   `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA.    .JMML.   .JMML..JMML.`Mbmmd' M9mmmP' 
# Check Files
####################


# so this one
####################
# JSH Files Management
func find_or_create_eden_directory():
	var available_dirs = scan_available_storage()
	# Try to find existing Eden folder
	for dir in available_dirs:
		if DirAccess.dir_exists_absolute(dir + "/Eden"):
			return dir + "/Eden"
	# If not found, create in first available directory
	var target_dir = available_dirs[0] + "/Eden"
	DirAccess.make_dir_recursive_absolute(target_dir)
	return target_dir
####################
	
# finding files in lists of files, missing files thingy? or was it integrity stuff
####################
# JSH Files Management
func file_finder(file_name, path_to_file, list_of_files, type_of_data):
	var counter_liste = list_of_files.size()
	var counter_times : int = 0
	for file in list_of_files:
		if file == file_name:
			file_path = path_to_file + "/" + file
####################

#checks if it is a first run, checks for an akashic_records.txt file
####################
# JSH Files Management
func check_folder(folder_path):
	var space_existence = DirAccess.open(folder_path)
	if space_existence:
		check_folder_content(space_existence)
		directory_existence = true
	else:
		pass
####################

# checking folder content
####################
# JSH Files Management
func check_folder_content(directory):  # Take DirAccess as parameter
	files_content = directory.get_files()      # Get array of files
	folders_content = directory.get_directories()  # Get array of folders
	# Check if we have any files
	if files_content.size() > 0:
		files_existence = true
	else:
		files_existence = false
	# Check if we have any folders
	if folders_content.size() > 0:
		folders_existence = true
	else:
		folders_existence = false
####################


# here we check existence of settings file and also sending it to class file
####################
# JSH Files Management
func check_settings_file():
	var settings_exists = FileAccess.file_exists("user://settings.txt")
	###### i want it on top :
	scan_available_storage()
	var file_data_of_settings = SettingsBank.settings_file_blue_print_0
	var data_of_settings_cleaned : Array = []
	for entry in file_data_of_settings[0]:
		var cleansed = entry[0].split("|")
		data_of_settings_cleaned.append(cleansed)
	# here we are after cleaning settings thingy, the D eden is : data_of_settings_cleaned[0][1] = lets see now : D:/Eden so here we got string! just string :(
	var path_for_directory = data_of_settings_cleaned[0][1]
	var path_for_user_data = "user://" # + data_of_settings_cleaned[1][1]
	var path_for_database = data_of_settings_cleaned[1][1]
	var settings_file_name = data_of_settings_cleaned[2][1]
	var default_directory = DirAccess.dir_exists_absolute(path_for_directory)
	#### first interpretation of some data
	# Check if directory exists first
	if default_directory == true:
		print("the directory exist, we can send there file, hmm, damn, i wanted to do it different way, like use res? but lets just do it my way, it even finds")
	else:
		scan_available_storage()
	### my first additional check of data
	if available_directiories is Array:
		print(" available directories is an Array, but is it empty?")
		if available_directiories.is_empty():
			print(" it is empty " , available_directiories)
		else:
			print(" it is not empty ", available_directiories)
	## here we immediately were checking as it was Array, but maybe it was not Array
	if available_directiories[0]:
		data_of_settings_cleaned.append(["available_directiory" , available_directiories[0]])
	#return false
	if !DirAccess.dir_exists_absolute(path_for_user_data + path_for_database):
	#	# Create directory
		DirAccess.make_dir_recursive_absolute(path_for_user_data + path_for_database)
	if !FileAccess.file_exists(path_for_user_data + settings_file_name):
		var file = FileAccess.open(path_for_user_data + settings_file_name, FileAccess.WRITE)
		if file:
			for line in data_of_settings_cleaned:
				file.store_line(line[0] + " : " + line[1])
		SettingsBank.load_settings_file(path_for_user_data + settings_file_name)
	## so what this is supposed to do, check settings file
	print(" settings file history|file_exist|user://settings.txt ", settings_exists)
	check_settings_data.append(check_settings_data)
	##
	if settings_exists:
		# File exists, we can try to open it
		var file = FileAccess.open("user://settings.txt", FileAccess.READ)
		print(" settings file history|if user folder had |settings.txt:", settings_exists)
		check_settings_data.append(settings_exists)
	# var check_settings_data : Array = []
		check_settings_data.append(file)
	# a global variant of this function
	### the main feature of entire function, one var, just file
		if file:
			print("Successfully opened settings file")
			SettingsBank.load_settings_file("user://settings.txt")
			return true
		else:
			print("File exists but couldn't open it")
			# whatever it was we appended it already
			return false
	else:
		print("No settings file found in user://")
		# well we appended that var already
	### here is simple return system file = var on top of function
	return check_settings_data
####################

####################
# JSH Files Management
func scan_eden_directory(directory: String = "D:/Eden", indent: int = 0) -> Dictionary:
	var dir = DirAccess.open(directory)
	var scan_results = {
		"files": [],  # ✅ Keep this as an Array
		"directories": [],  # ✅ Keep this as an Array
		"subdirectories": {},  # ✅ Store subdir data properly
		"status": "pending"
	}

	if dir:
		scan_results["status"] = "completed"
		
		for subdir in dir.get_directories():
			#print("  ".repeat(indent) + "📁 " + subdir)
			scan_results["directories"].append(subdir)
			scan_results["subdirectories"][subdir] = scan_eden_directory(directory.path_join(subdir), indent + 1)  # ✅ Store subdirs inside a separate Dictionary

		for file in dir.get_files():
			#print("  ".repeat(indent) + "📄 " + file)
			scan_results["files"].append(file)  # ✅ Now correctly appending to "files" Array

	else:
		scan_results["status"] = "failed"
		print("❌ Could not open directory: " + directory)
	
	return scan_results
####################


####################
# JSH Files Management
func scan_available_storage():
	#print("Scanning available storage...")
	# For Windows: Check drives A-Z
	if OS.get_name() == "Windows":
		for ascii in range(65, 91):  # A-Z in ASCII
			var drive = char(ascii) + ":/"
			var dir = DirAccess.open(drive)
			if dir != null:
				#print("Found drive: ", drive)
				available_directiories.append(drive)
				#print(" available_directiories : " , available_directiories)
	# For Android: Check common storage paths
	elif OS.get_name() == "Android":
		var common_paths = [
			"/storage/emulated/0/",  # Internal storage
			"/sdcard/",              # Common symlink to internal storage
			"/storage/"              # Parent directory for all storage
		]
		for path_s_a_s in common_paths:
			var dir = DirAccess.open(path)
			if dir != null:
				#print("Found storage: ", path)
				# List all storage devices in /storage/
				if path_s_a_s == "/storage/":
					var contents = dir.get_directories()
					for storage in contents:
						print("Storage device found: /storage/" + storage)
	return available_directiories
####################




####################
# JSH Files Management
func scan_res_directory(directory: String = "res://", indent: int = 0) -> Dictionary:
	var dir = DirAccess.open(directory)
	var scan_results = {
		"files": [],
		"directories": [],
		"status": "pending"
	}
	if dir:
		scan_results["status"] = "completed"
		for subdir in dir.get_directories():
			#print("  ".repeat(indent) + "📁 " + subdir)
			scan_results["directories"].append(subdir)
			scan_results[subdir] = scan_res_directory(directory.path_join(subdir), indent + 1)  # Recursive call
		for file in dir.get_files():
			#print("  ".repeat(indent) + "📄 " + file)
			scan_results["files"].append(file)
	else:
		scan_results["status"] = "failed"
	scan_result = scan_results
	return scan_results

####################

####################
# JSH Files Management
func scan_directory_with_sizes(directory: String, indent: int = 0) -> Dictionary:
	var dir = DirAccess.open(directory)
	var scan_results = {
		"files": [],         # Stores file names & sizes
		"directories": [],   # Stores folder names
		"status": "pending"
	}
	
	if dir:
		scan_results["status"] = "completed"
		
		# Scan subdirectories
		for subdir in dir.get_directories():
			scan_results["directories"].append(subdir)
			scan_results[subdir] = scan_directory_with_sizes(directory.path_join(subdir), indent + 1)

		# Scan files and get sizes
		for file in dir.get_files():
			var full_path = directory.path_join(file)
			var file_size = 0  # Default size

			var file_access = FileAccess.open(full_path, FileAccess.READ)
			if file_access:
				file_size = file_access.get_length()
				file_access.close()  # Close file after reading size
			
			var file_entry = {
				"name": file,
				"size": file_size
			}
			
			scan_results["files"].append(file_entry)  # Store file with size
	
	else:
		scan_results["status"] = "failed"
	
	return scan_results
####################


####################
# JSH Hidden Veil
func get_data_structure_size(data) -> int:
	# Early return for null data
	if data == null:
		return 0
	match typeof(data):
		TYPE_DICTIONARY:
			var total_size = 0
			for key in data:
				# Add key size
				total_size += var_to_bytes(key).size()
				# Add value size recursively
				if data[key] != null:
					total_size += get_data_structure_size(data[key])
			return total_size
		TYPE_ARRAY:
			var total_size = 0
			for item in data:
				if item != null:
					total_size += get_data_structure_size(item)
			return total_size
		TYPE_OBJECT:
			# Handle special cases like Nodes
			if data is Node:
				return 8  # Base pointer size
			return var_to_bytes(data).size()
		TYPE_STRING:
			return data.length() * 2  # Approximate UTF-16 size
		TYPE_INT:
			return 4
		TYPE_FLOAT:
			return 8
		TYPE_VECTOR2, TYPE_VECTOR2I:
			return 8
		TYPE_VECTOR3, TYPE_VECTOR3I:
			return 12
		_:
			# Default fallback using var_to_bytes
			return var_to_bytes(data).size()
####################

# Helper function to safely get property
####################
# JSH Hidden Veil
func get_jsh(property_name: String):
	if property_name in self:
		return self[property_name]
	return null
####################

####################
# JSH Hidden Veil
func check_memory_state():
	var current_time = Time.get_ticks_msec()
	var sizes = {}
	# Check arrays
	for array_name in memory_metadata["arrays"].keys():
		if get_jsh(array_name) != null:
			var array_size = get_data_structure_size(get_jsh(array_name))
			sizes[array_name] = array_size
			if array_size > memory_metadata["cleanup_thresholds"]["array_max"]:
				clean_array(array_name)
	# Check dictionaries
	for dict_name in memory_metadata["dictionaries"].keys():
		if get_jsh(dict_name) != null:
			var dict_size = get_data_structure_size(get_jsh(dict_name))
			sizes[dict_name] = dict_size
			# Convert to MB
			var size_mb = dict_size / (1024 * 1024)
			if size_mb > memory_metadata["cleanup_thresholds"]["dict_max_mb"]:
				clean_dictionary(dict_name)
	print("\nMemory State:")
	for name in sizes:
		print("%s: %s bytes" % [name, sizes[name]])
	return sizes
####################



####################
# Load Files
#                                      ,,                 ,,    ,,                  
# `7MMF'                             `7MM      `7MM"""YMM db  `7MM                  
#   MM                                 MM        MM    `7       MM                  
#   MM         ,pW"Wq.   ,6"Yb.   ,M""bMM        MM   d `7MM    MM  .gP"Ya  ,pP"Ybd 
#   MM        6W'   `Wb 8)   MM ,AP    MM        MM""MM   MM    MM ,M'   Yb 8I   `" 
#   MM      , 8M     M8  ,pm9MM 8MI    MM        MM   Y   MM    MM 8M"""""" `YMMMa. 
#   MM     ,M YA.   ,A9 8M   MM `Mb    MM        MM       MM    MM YM.    , L.   I8 
# .JMMmmmmMMM  `Ybmd9'  `Moo9^Yo.`Wbmd"MML.    .JMML.   .JMML..JMML.`Mbmmd' M9mmmP' 
# Load Files
####################





#
# hmm i think i didnt use these, we done it different way
#
####################
# JSH Files Management
func setup_settings():
	# 1. Check for directory
	var eden_path = find_or_create_eden_directory()
	# 2. Check/Create akashic_records folder
	var akashic_path = eden_path + "/akashic_records"
	if !DirAccess.dir_exists_absolute(akashic_path):
		DirAccess.make_dir_recursive_absolute(akashic_path)
	# 3. Check/Create settings file
	var settings_file_path = akashic_path + "/settings.txt"
	if !FileAccess.file_exists(settings_file_path):
		create_default_settings(settings_file_path)
	# 4. Load settings into SettingsBank
	SettingsBank.load_settings_file(settings_file_path)
####################


####################
# Modify Files
#                                 ,,    ,,      ,...                        ,,    ,,                  
# `7MMM.     ,MMF'              `7MM    db    .d' ""             `7MM"""YMM db  `7MM                  
#   MMMb    dPMM                  MM          dM`                  MM    `7       MM                  
#   M YM   ,M MM  ,pW"Wq.    ,M""bMM  `7MM   mMMmm`7M'   `MF'      MM   d `7MM    MM  .gP"Ya  ,pP"Ybd 
#   M  Mb  M' MM 6W'   `Wb ,AP    MM    MM    MM    VA   ,V        MM""MM   MM    MM ,M'   Yb 8I   `" 
#   M  YM.P'  MM 8M     M8 8MI    MM    MM    MM     VA ,V         MM   Y   MM    MM 8M"""""" `YMMMa. 
#   M  `YM'   MM YA.   ,A9 `Mb    MM    MM    MM      VVV          MM       MM    MM YM.    , L.   I8 
# .JML. `'  .JMML.`Ybmd9'   `Wbmd"MML..JMML..JMML.    ,V         .JMML.   .JMML..JMML.`Mbmmd' M9mmmP' 
#                                                    ,V                                               
#                                                 OOb"                                                
# Modify Files
####################








####################
# Modify Files                                                                                        
#               ,,                                              ,,    ,,                  
#   .g8"""bgd `7MM                                   `7MM"""YMM db  `7MM                  
# .dP'     `M   MM                                     MM    `7       MM                  
# dM'       `   MM  .gP"Ya   ,6"Yb.  `7MMpMMMb.        MM   d `7MM    MM  .gP"Ya  ,pP"Ybd 
# MM            MM ,M'   Yb 8)   MM    MM    MM        MM""MM   MM    MM ,M'   Yb 8I   `" 
# MM.           MM 8M""""""  ,pm9MM    MM    MM        MM   Y   MM    MM 8M"""""" `YMMMa. 
# `Mb.     ,'   MM YM.    , 8M   MM    MM    MM        MM       MM    MM YM.    , L.   I8 
#   `"bmmmd'  .JMML.`Mbmmd' `Moo9^Yo..JMML  JMML.    .JMML.   .JMML..JMML.`Mbmmd' M9mmmP' 
#                                                                                                                                                                                
# Modify Files
####################


####################
# JSH Hidden Veil
func clean_array(array_name: String):
	match array_name:
		"stored_delta_memory":
			# Keep only last 100 entries
			if stored_delta_memory.size() > 100:
				stored_delta_memory = stored_delta_memory.slice(-100)
		"blimp_of_time":
			if blimp_of_time.size() > 50:
				blimp_of_time = blimp_of_time.slice(-50)
		"array_with_no_mutex":
			# Clean old errors
			var current_time = Time.get_ticks_msec()
			array_with_no_mutex = array_with_no_mutex.filter(
				func(error): return current_time - error.time < 300000 # 5 minutes
			)
####################

####################
# JSH Hidden Veil
func clean_dictionary(dict_name: String):
	match dict_name:
		"cached_record_sets":
			# Clean old cached records
			var current_time = Time.get_ticks_msec()
			for key in cached_record_sets.keys():
				if current_time - cached_record_sets[key].get("timestamp", 0) > 3600000: # 1 hour
					cached_record_sets.erase(key)
		"dictionary_of_mistakes":
			# Clean resolved errors
			for key in dictionary_of_mistakes.keys():
				if dictionary_of_mistakes[key].get("status") == "resolved":
					dictionary_of_mistakes.erase(key)
####################






















####################
#
# JSH Data Splitter
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┳┓       ┏┓  ┓•      
#       888  `"Y8888o.   888ooooo888     ┃┃┏┓╋┏┓  ┗┓┏┓┃┓╋╋┏┓┏┓
#       888      `"Y88b  888     888     ┻┛┗┻┗┗┻  ┗┛┣┛┗┗┗┗┗ ┛ 
#       888 oo     .d8P  888     888                ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Data Splitter
#
####################


# Use it like:
####################
# was
# JSH Ethereal Engine Repair
# is
# JSH Data Splitter
func data_splitter_some_function():
	var content = "your content"
	var analysis = data_splitter.analyze_file_content(content)
####################

# just idea, now we have node parser
####################
# JSH Ethereal Engine Repair
func zippy_unzipper_data_center():
	print(" the load and unload of zip file is needed ")
	print(" lets do it three letters system of words ")
	print(" the gateway of repeats ")
	print(" one big zip file ")
####################


























####################
#
# JSH Hidden Veil
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┓┏• ┓ ┓      ┓┏  •┓  ┏┓         
#       888  `"Y8888o.   888ooooo888     ┣┫┓┏┫┏┫┏┓┏┓  ┃┃┏┓┓┃  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┛┗┗┗┻┗┻┗ ┛┗  ┗┛┗ ┗┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888                             ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Hidden Veil
#
####################


####################
# JSH Hidden Veil
func call_some_thingy():
	print()
	var data_pooint_node_now = get_node("keyboard_right_container/thing_53")
	data_pooint_node_now.process_delta_fake()
####################

####################
# JSH Hidden Veil
		#print(" last_delta_to_forget : ", last_delta_to_forget)
	
	#print(" this is blimp of each tick : ", each_blimp_time)
	#print(" time of each turn delta ")
#var turn_delta_time_0 : 
####################

####################
# JSH Hidden Veil
	# check mutex state before each turn now? or not each turn?
	# var message_of_delta = breaks_and_handles_check()
	# print(" message_of_delta : " , message_of_delta)
				## we checked nodes up to that point
				# now we check if we even have the basic set of things to work with
				#if array_of_startup_check.size() == 0:
					#prepare_akashic_records_init()
				# readiness : { 
				#"mutex_state": [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true], 
				#"thread_state": "working", 
				#"records_ready": true }
				#  delta, turn 0 : 
				#{ "mutexes": true, 
				#"threads": true, 
				#"records": true }
				#var shall_execute : int = 0
				#mutex_for_trickery.lock()
				#if menace_tricker_checker == 1:
					#shall_execute = 1
					##menace_tricker_checker = 2
				#if menace_tricker_checker == 2:
					#shall_execute = 2
				#if menace_tricker_checker == 2:
					#shall_execute = 3
				#if shall_execute == 0:
					#menace_tricker_checker = 2
				#mutex_for_trickery.unlock()
				#print(" shall_execute : " , shall_execute)
				## this is just checking if we have more than 0 sets to do
				# here we can check if we have anything to do
#array_mutex_process.unlock()
			#call_some_thingy()
			#print_tree_pretty()
			#print_tree_structure(scene_tree_jsh["main_root"]["branches"]["keyboard_right_container"], 0)
			#print(array_for_counting_finish)
				#turn_number_process += 1
			   # turn_number_process += 1
								#print(" just adde dnode 0 : ", just_added_node)
									#print(" just adde dnode 1 : ", just_added_node)
									#print(" just adde dnode 2 : ", just_added_node)
							#print(" we would move stuff ", node_to_operate)
							#print(" we would rotate stuff ", node_to_operate)
							#print(" here we would change text i guess ")
								#print(" the container exist")
							#print(" we would unload just a node")
							#print(" can i atleast print that thing? ", data_to_process)
								#print(" well we did get a node?")
							#print()
							#print()
										#print( " we got that node, and it has that function, ", function_data)
							#node_to_call_now.call(function_name, function_data)
				#menace_tricker_checker = 2
			#print(shall_execute)
					#print(" - the first start data : " , array_of_startup_check)
####################


####################
# JSH Hidden Veil
func _process(delta):
	#print(" list_of_sets_to_create : " , list_of_sets_to_create)
	# handle camera before any turn takes place
	camera.process(delta)
	camera.process_roll(delta)
	each_blimp_of_delta()
	#print(" THAT IS A START ",data_that_is_send)
	
	
	#print_tree_structure(scene_tree_jsh["main_root"]["branches"]["keyboard_container"], 0)
	#print(" dictionary stuff : " , array_for_counting_finish)
	var data_point_node = get_node("settings_container/thing_19")
	if data_point_node:
		#print(" we got that node")
		var data = data_point_node.check_state_of_dictionary_and_three_ints_of_doom()
		print(" data : " , data)
	
	
	
	#var delta_handles_state = breaks_and_handles_check_issue()
	
	
	
	
	#print(" delta message of mutexes ", delta_handles_state)
	#print(" delta issue 0")
	##############################################
	## do we take time blimp here to? with delta time for each of 0 to 9 turns so 10 in total ?
	
	# Check if any mouse buttons are currently held down
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pass
		#print("Left mouse button is held")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		pass
		#print("Right mouse button is held")
	#print(" delta issue 3 " , turn_number_process)
	#process_turn_system()
	process_system()
####################

# Process turn with proper return status
####################
# JSH Hidden Veil
func process_turn_0(delta: float) -> Dictionary:
	var result = {
		"status": CreationStatus.ERROR,
		"message": "",
		"delta_time": delta,
		"processed_sets": 0
	}
	# Validate delta
	if delta <= 0:
		result.message = "Invalid delta time"
		return result
	# Check turn number
	if turn_number_process != 0:
		result.message = "Wrong turn number"
		return result
	# Try to process
	turn_number_process += 1
	# Mutex handling with proper cleanup
	array_mutex_process.lock()
	# Check if we have sets to create
	if list_of_sets_to_create.size() > 0:
		var process_result = process_stages()
		if process_result:
			result.status = CreationStatus.SUCCESS
			result.processed_sets = list_of_sets_to_create.size()
		else:
			result.message = "Process stages failed"
	else:
		result.message = "No sets to create"
		result.status = CreationStatus.PENDING
	array_mutex_process.unlock()
	result.delta_time = delta
	return result
####################

func process_system():
	process_system_0()
	process_system_1()
	process_system_2()
	process_system_3()
	process_system_4()
	process_system_5()
	process_system_6()
	process_system_7()
	process_system_8()


#func process_turn_system():
	#match turn_number_process:
		#0:
			##print_tree_pretty()
			##if active_record_sets.has("base_"):
			##print_tree_structure(scene_tree_jsh["main_root"]["branches"]["singular_lines_container"], 0)
			##	print(" it has base ", active_record_sets["base_"])
			##print(" delta issue 01")
			##
			#turn_number_process += 1
			#
			#var try_turn_0 = array_mutex_process.try_lock()
			#if try_turn_0:
				#array_mutex_process.unlock()
			#else:
				#array_mutex_process.unlock()
				#return
			##
			#array_mutex_process.lock()
			#if list_of_sets_to_create.size() > 0:
				#array_mutex_process.unlock()
				#process_stages()
			#else:
				#array_mutex_process.unlock()
			#ready_for_once()
			##breaks_and_handles_check()
			##print("check_stuff_again : ", check_stuff_again)
			###print_tree_pretty()
			##var readiness = check_system_readiness()
			##if readiness.mutex_state && readiness.thread_state:
				### Safe to proceed with creation
				###process_pre_delta_check()
				##var check = check_if_all_systems_are_green()
				##print(" my own check in ready : " , first_run_numbers)
				##print(" nodes and scripts check : ", check)
				#### check if process delta is the same core like in ready
				##if preparer_of_data.size() == 2:
					##prepare_akashic_records()
				##var ready_two
				##var multi_thread_start = multi_threads_start_checker()
				##var message_of_handles = breaks_and_handles_check()
				##print(" message_of_handles : " , message_of_handles)
				##if multi_thread_start == true:
					###print(" we can start creation ")
					##ready_two = ready_for_once()
					##
					###var just_one_try : int = 0
					###func ready_for_once():
						###if just_one_try == 0:
							###create_new_task("three_stages_of_creation", "base")
							###create_new_task("three_stages_of_creation", "menu")
							###return true
						###else:
							###return false
					##
				###print(" difference of threads id with main core : " , multi_thread_start)
				##if ready_two == true:
					##print(" first stage of creation was called ")
				##
				##
				##
				### from create task three stages of creation? we can create
				###array_mutex_process.lock()
				###if list_of_sets_to_create.size() > 0:
					###array_mutex_process.unlock()
					###process_stages()
				###else:
					###array_mutex_process.unlock()
			##else:
				### Log state for debugging
				##print("System not ready: ", readiness)
			##delta_turn_0 = delta
			#pass
		#1:
			##
			#turn_number_process += 1
			##
			##if system_readiness.records:
			##	process_pending_sets()
			#
			#var try_turn_1 = mutex_nodes_to_be_added.try_lock()
			#if try_turn_1:
				#mutex_nodes_to_be_added.unlock()
			#else:
				#mutex_nodes_to_be_added.unlock()
				#return
			#
			#mutex_nodes_to_be_added.lock()
			#if nodes_to_be_added.size() > 0:
				#for i in range(min(max_nodes_added_per_cycle, nodes_to_be_added.size())):
					#var data_to_process = nodes_to_be_added.pop_front()
					#var data_type = data_to_process[0]
					#match data_type:
						#0:
							#var container_to_add = data_to_process[2]
							#var container_name = data_to_process[1]
							#add_child(container_to_add)
							#var just_added_node = get_node(container_name)
							#if just_added_node:
								#var data_to_be_checked : Array = []
								#data_to_be_checked.append([container_name, container_name, just_added_node])
								#create_new_task("the_finisher_for_nodes", data_to_be_checked)
							#else:
								#nodes_to_be_added.append(data_to_process)
								#print(" ERROR container was not found ")
						#1:
							#var parent_path = data_to_process[1]
							#var node_name = data_to_process[2]
							#var main_node_to_add = data_to_process[3]
							#var combined_path = parent_path + "/" + node_name
							#var container = get_node(parent_path)
							#if container:
								#container.add_child(main_node_to_add)
								#var just_added_node = get_node(combined_path)
								#if just_added_node:
									#var data_to_be_checked : Array = []
									#data_to_be_checked.append([combined_path, node_name, just_added_node])
									#create_new_task("the_finisher_for_nodes", data_to_be_checked)
								#else:
									#print("ERROR main node not found")
									#nodes_to_be_added.append(data_to_process)
								#
							#else:
								#print("ERROR container for main node not found")
								#nodes_to_be_added.append(data_to_process)
						#2:
							#var parent_path = data_to_process[1]
							#var node_name = data_to_process[2]
							#var main_node_to_add = data_to_process[3]
							#var container_name = data_to_process[4]
							#var combined_path = parent_path + "/" + node_name
							#var container = get_node(parent_path)
							#if container:
								#container.add_child(main_node_to_add)
								#var just_added_node = get_node(combined_path)
								#if just_added_node:
									#var data_to_be_checked : Array = []
									#data_to_be_checked.append([combined_path, node_name, just_added_node])
									#create_new_task("the_finisher_for_nodes", data_to_be_checked)
								#else:
									#print(" ERROR sub node not found ")
									#nodes_to_be_added.append(data_to_process)
								#
							#else:
								#print(" ERROR main node for sub node not found ")
								#nodes_to_be_added.append(data_to_process)
			#mutex_nodes_to_be_added.unlock()
			#pass
		#2:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_2 = mutex_data_to_send.try_lock()
			#if try_turn_2:
				#mutex_data_to_send.unlock()
			#else:
				#mutex_data_to_send.unlock()
				#return
			#
			#
			#mutex_data_to_send.lock()
			#if data_to_be_send.size() > 0:
				#for i in range(min(max_data_send_per_cycle, data_to_be_send.size())):
					#var data_to_be_send_rn = data_to_be_send.pop_front()
					#var current_type_of_data = data_to_be_send_rn[0]
					#var datapoint_path_cur = data_to_be_send_rn[1]
					#match current_type_of_data:
						#"instructions_analiser":
							#var container_path_rn = data_to_be_send_rn[2]
							#var container_node_rn = get_node(container_path_rn)
							#if container_node_rn:
								#var datapoint_node_rn = get_node(datapoint_path_cur)
								#if datapoint_node_rn:
									#var array_of_data_for_threes : Array = []
									#array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn, container_node_rn])
									#create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
								#else:
									#print(" we didnt find the datapoint we must append stuff ")
									#data_to_be_send.append(data_to_be_send_rn)
							#else:
								#print(" we didnt get container, we must append ")
								#data_to_be_send.append(data_to_be_send_rn)
						#"scene_frame_upload":
							#var container_path_rn = data_to_be_send_rn[2]
							#var container_node_rn = get_node(container_path_rn)
							#if container_node_rn:
								#var datapoint_node_rn = get_node(datapoint_path_cur)
								#if datapoint_node_rn:
									#var array_of_data_for_threes : Array = []
									#array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn, container_node_rn])
									#create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
								#else:
									#print(" we didnt find the datapoint we must append stuff ")
									#data_to_be_send.append(data_to_be_send_rn)
							#else:
								#print(" we didnt get container, we must append ")
								#data_to_be_send.append(data_to_be_send_rn)
						#"interactions_upload":
							#var datapoint_node_rn = get_node(datapoint_path_cur)
							#if datapoint_node_rn:
								#var array_of_data_for_threes : Array = []
								#array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn])
								#create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
							#else:
								#print(" we didnt got that datapoint, we gotta apend")
								#data_to_be_send.append(data_to_be_send_rn)
			#mutex_data_to_send.unlock()
			#pass
		#3:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_3 = movmentes_mutex.try_lock()
			#if try_turn_3:
				#movmentes_mutex.unlock()
			#else:
				#movmentes_mutex.unlock()
				#return
			#
			#movmentes_mutex.lock()
			#if things_to_be_moved.size() > 0:
				#for i in range(min(max_movements_per_cycle, things_to_be_moved.size())):
					##print()
					#var data_to_process = things_to_be_moved.pop_front()
					#var data_type = data_to_process[0]
					#var node_to_operate = data_to_process[1]
					#var data_for_operation = data_to_process[2]
					#match data_type:
						#"move":
							#node_to_operate.position = data_for_operation
						#"rotate":
							#node_to_operate.rotation.x -= deg_to_rad(data_for_operation)
						#"write":
							#for child in node_to_operate.get_children():
								#if child is Label3D:
									#child.text = data_for_operation
			#movmentes_mutex.unlock()
			#pass
		#4:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_4 = mutex_for_unloading_nodes.try_lock()
			#if try_turn_4:
				#mutex_for_unloading_nodes.unlock()
			#else:
				#mutex_for_unloading_nodes.unlock()
				#return
			#
			#mutex_for_unloading_nodes.lock()
			#if nodes_to_be_unloaded.size() > 0:
				#for i in range(min(max_nodes_to_unload_per_cycle, nodes_to_be_unloaded.size())):
					#var data_to_process = nodes_to_be_unloaded.pop_front()
					#var data_type = data_to_process[0]
					#var path_of_the_node = data_to_process[1]
					#match data_type:
						#"container":
							#print(" we would unload container")
							#var container_to_unload = get_node_or_null(path_of_the_node)
							#if container_to_unload:
								#
								#var sub_path_of_the_node = path_of_the_node.substr(0, path_of_the_node.length() -10)
								#print("taskkkk sub_path_of_the_node ", sub_path_of_the_node)
								#container_to_unload.queue_free()
								#create_new_task("unload_container", path_of_the_node)
							#else:
								#print(" we didnt find that container")
						#"just_node":
							#var node_to_unload = get_node_or_null(path_of_the_node)
							#if node_to_unload:
								#node_to_unload.queue_free()
								#create_new_task("find_branch_to_unload", path_of_the_node)
							#else:
								#print(" i guess we didnt get node unfortunatelly ?")
			#mutex_for_unloading_nodes.unlock()
			#pass
		#5:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_5 = mutex_function_call.try_lock()
			#if try_turn_5:
				#mutex_function_call.unlock()
			#else:
				#mutex_function_call.unlock()
				#return
			#
			#mutex_function_call.lock()
			#if functions_to_be_called.size() > 0:
				#for i in range(min(max_functions_called_per_cycle, functions_to_be_called.size())):
					#var data_to_process = functions_to_be_called.pop_front()
					#var type_of_functi = data_to_process[0]
					#var node_to_call = data_to_process[1]
					#var function_name = data_to_process[2]
					#match type_of_functi:
						#"single_function":
							#if node_to_call and node_to_call.has_method(function_name):
								#node_to_call.call(function_name)
						#"call_function_get_node":
							#var function_data = data_to_process[3]
							#var node_to_call_now = get_node_or_null(node_to_call)
							#if node_to_call_now and node_to_call_now.has_method(function_name):
								#node_to_call_now.call(function_name, function_data)
						#"call_function_single_get_node":
							#var node_to_call_now = get_node_or_null(node_to_call)
							#if node_to_call_now and node_to_call_now.has_method(function_name):
								#node_to_call_now.call(function_name)
						#"get_nodes_call_function":
							#if data_to_process.size() > 3:
								#var function_data = data_to_process[3]
								#for nodes in node_to_call:
									#var current_node_to_call = get_node_or_null(nodes)
									#if current_node_to_call and current_node_to_call.has_method(function_name):
										#current_node_to_call.call(function_name, function_data)
							#else:
								#print(" parallel reality somehow it is small size?")
			#mutex_function_call.unlock()
			#pass
		#6:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_6 = mutex_additionals_call.try_lock()
			#if try_turn_6:
				#mutex_additionals_call.unlock()
			#else:
				#mutex_additionals_call.unlock()
				#return
			#
			#mutex_additionals_call.lock()
			#if additionals_to_be_called.size() > 0:
				#for i in range(min(max_additionals_per_cycle, additionals_to_be_called.size())):
					#print(" we got magic to do ", additionals_to_be_called)
					#var data_to_process = additionals_to_be_called.pop_front()
					#var type_of_data = data_to_process[0]
					#var what_data = data_to_process[1]
					#var amount_of_times = data_to_process[2]
					#if amount_of_times != 0:
					#
						#match type_of_data:
							#"add_container":
								#print(" we got magic to do we got containers to add")
								#if BanksCombiner.container_set_name.has(what_data):
									#print(" we got magic to do set name found ")
									#var set_name = BanksCombiner.container_set_name[what_data]
									#var is_it_loading = check_if_already_loading_one(set_name)
									#if is_it_loading == true:
										#print(" we got magic to do it is being loaded")
										#additionals_to_be_called.append(data_to_process)
									#elif is_it_loading == false:
										#print(" we got magic to do we can start loading it now")
										#three_stages_of_creation(set_name)
										#amount_of_times -=1
										#additionals_to_be_called.append([type_of_data, what_data, amount_of_times])
								#else:
									#print(" we got magic to do set name not found ")
									#additionals_to_be_called.append(data_to_process)
							#_:
								#additionals_to_be_called.append(data_to_process)
			#mutex_additionals_call.unlock()
			#var start_finished_counting : int = int_of_stuff_finished
			#var start_now_counting : int = int_of_stuff_started
			#before_time_blimp(start_finished_counting, start_now_counting)
			## check states of containers, and created data already
			#var shall_execute : int = 0
			#mutex_for_trickery.lock()
			#if menace_tricker_checker == 1:
				#shall_execute = 1
			#if menace_tricker_checker == 2:
				#shall_execute = 2
			#if menace_tricker_checker == 2:
				#shall_execute = 3
			#mutex_for_trickery.unlock()
			## FATAL ERROR MODE
			#if shall_execute == 3:
				#unlock_stuck_mutexes()
				#containers_states_checker()
				#containers_list_creator()
				#var message_now_mutex = breaks_and_handles_check()
				#check_currently_being_created_sets()
				#handle_random_errors() # array_with_no_mutex
				##mutex_for_container_state.lock()
				##mutex_containers.lock()
				##print(" process delta ")
				##print(" process delta outcome : list_of_containers " , list_of_containers)
				##print(" process delta ")
				##print(" process delta outcome : current_containers_state : ", current_containers_state)
				##print("  process delta ")
				##print(" process delta mutex chck : ", message_now_mutex)
				##print(" process delta array with no protection : " , array_with_no_mutex)
				##mutex_containers.unlock()
				##mutex_for_container_state.unlock()
				## The pattern shows tasks starting but not finishing (2 started, 0 finished)
			#if some_kind_of_issue == 1:
				#print(" Task completion check - Started: ", start_now_counting, " Finished: ", start_finished_counting)
				## Check container states
				#containers_states_checker()
				#containers_list_creator()
				## Check mutexes
				#var mutex_states = breaks_and_handles_check()
				## Check creation progress
				#check_currently_being_created_sets()
				## Handle any errors
				#handle_random_errors()
				#
				## Debug output
				##mutex_for_container_state.lock()
				#mutex_containers.lock()
				##print(" - Process state check:")
				##print(" - Containers: ", list_of_containers)
				#var container_size = list_of_containers.size()
				##print(" - also container size : " , container_size)
				#if container_size == 0:
					##print(" - potential first container not appearing from task, better to abort the mission, and restart the creation")
					#check_system_health()
					##print(" - task_status : " , task_status)
				##print(" - Container states: ", current_containers_state)
				##print(" - Mutex states: ", mutex_states)
				##print(" - Unhandled errors: ", array_with_no_mutex)
				##print(" - stuck_status: ", stuck_status)
				#mutex_containers.unlock()
				##mutex_for_container_state.unlock()
				#
				#var stuck_status = check_thread_status()
				#if stuck_status > 0:
					##print("0010110 it seems some threads are stuck ?")
					#shall_execute = 3
				#else:
					#print("0010110 no thread seems to be stuck ")
					## Check memory state periodically
				#
			#var current_time = Time.get_ticks_msec()
			#if current_time - memory_metadata["last_cleanup"] > memory_metadata["cleanup_thresholds"]["time_between_cleanups"]:
				#var memory_state = check_memory_state()
				#print(" memory_state : " , memory_metadata)
				#memory_metadata["last_cleanup"] = current_time
			#pass
		#7:
			##
			#turn_number_process += 1
			##
			#
			#var try_turn_7 = mutex_messages_call.try_lock()
			#if try_turn_7:
				#mutex_messages_call.unlock()
			#else:
				#mutex_messages_call.unlock()
				#return
				#
			#mutex_messages_call.lock()
			#if messages_to_be_called.size() > 0:
				#for i in range(min(max_messages_per_cycle, messages_to_be_called.size())):
					#print(" we got magic to do ", messages_to_be_called)
					#var data_to_process = messages_to_be_called.pop_front()
					#var type_of_message = data_to_process[0]
					#var message_to_send = data_to_process[1]
					#var receiver = data_to_process[2]
					#
					##var datapoint_to_check
					##if datapoint_to_check == true:
					#
					#match type_of_message:
						#"singular_lines_text":
							#print(" we got magic to do we got containers to add")
							#var container_to_check = check_if_container_available(receiver)
							#print(" container_to_check : " , container_to_check)
							#if container_to_check == false:
								#messages_to_be_called.append(data_to_process)
							#elif container_to_check == true:
								#print(" container_to_check was found ")
								#var datapoint_to_check = check_if_datapoint_available(receiver)
								#
								#if datapoint_to_check == false:
									#messages_to_be_called.append(data_to_process)
								#elif datapoint_to_check == true:
									#
									#
									#var datapoint_path_check = check_if_datapoint_node_available(receiver)
									#var datapoint_node = get_node(datapoint_path_check)
									#
									#if datapoint_node:
										#print(" we got that datapoint to send message")
										#datapoint_node.receive_a_message(message_to_send)
										#
										#
									#else:
										#print(" no node available yet")
										#messages_to_be_called.append(data_to_process)
								##messages_to_be_called.append(data_to_process)
								##var container_missing : String = "singular_lines_container"
								##var type_of_message = "singular_lines_text"
								##main_node.eight_dimensional_magic(type_of_message, the_label_message, container_missing)
						#_:
							#print(" didnt find it ")
			#
			#mutex_messages_call.unlock()
			#
			#
			#pass
		#8:
			##
			#turn_number_process += 1
			##
			#pass
		#9:
			##print(" delta issue 2")
			##
			#turn_number_process = 0
			##
			#pass



## here we process queue, if it has anything, and also do first things, like that text bracet stuff
func process_system_0():

			
	var try_turn_0 = array_mutex_process.try_lock()
	if try_turn_0:
		array_mutex_process.unlock()
	else:
		array_mutex_process.unlock()
		return
	#
	array_mutex_process.lock()
	if list_of_sets_to_create.size() > 0:
		array_mutex_process.unlock()
		process_stages()
	else:
		array_mutex_process.unlock()
	ready_for_once()
	
	
	
	var try_turn_00 = mutex_actions.try_lock()
	if try_turn_00:
		mutex_actions.unlock()
	else:
		mutex_actions.unlock()
		return
		
	mutex_actions.lock()
	if actions_to_be_called.size() > 0:
		for i in range(min(max_actions_per_cycle, actions_to_be_called.size())):
			print(" we got magic to do ", actions_to_be_called)
			var data_to_process = actions_to_be_called.pop_front()
			var type_of_action = data_to_process[0]
			var datapoint_node = data_to_process[1]
			var additional_node = data_to_process[2]
			
			#var datapoint_to_check
			#if datapoint_to_check == true:
			
			match type_of_action:
				"update_text_cursor_after":
					if datapoint_node is Node:
						datapoint_node.update_text_cursor_after(additional_node)
					else:
						print(" conductor, we got a problem ")
						actions_to_be_called.append(data_to_process)
	mutex_actions.unlock()


## here we add nodes to a scene tree
func process_system_1():
	var try_turn_1 = mutex_nodes_to_be_added.try_lock()
	if try_turn_1:
		mutex_nodes_to_be_added.unlock()
	else:
		mutex_nodes_to_be_added.unlock()
		return
	
	mutex_nodes_to_be_added.lock()
	if nodes_to_be_added.size() > 0:
		for i in range(min(max_nodes_added_per_cycle, nodes_to_be_added.size())):
			var data_to_process = nodes_to_be_added.pop_front()
			var data_type = data_to_process[0]
			match data_type:
				0:
					var container_to_add = data_to_process[2]
					var container_name = data_to_process[1]
					add_child(container_to_add)
					var just_added_node = get_node(container_name)
					if just_added_node:
						var data_to_be_checked : Array = []
						data_to_be_checked.append([container_name, container_name, just_added_node])
						create_new_task("the_finisher_for_nodes", data_to_be_checked)
					else:
						nodes_to_be_added.append(data_to_process)
						print(" ERROR container was not found ")
				1:
					var parent_path = data_to_process[1]
					var node_name = data_to_process[2]
					var main_node_to_add = data_to_process[3]
					var combined_path = parent_path + "/" + node_name
					var container = get_node(parent_path)
					if container:
						container.add_child(main_node_to_add)
						var just_added_node = get_node(combined_path)
						if just_added_node:
							var data_to_be_checked : Array = []
							data_to_be_checked.append([combined_path, node_name, just_added_node])
							create_new_task("the_finisher_for_nodes", data_to_be_checked)
						else:
							print("ERROR main node not found")
							nodes_to_be_added.append(data_to_process)
						
					else:
						print("ERROR container for main node not found")
						nodes_to_be_added.append(data_to_process)
				2:
					var parent_path = data_to_process[1]
					var node_name = data_to_process[2]
					var main_node_to_add = data_to_process[3]
					var container_name = data_to_process[4]
					var combined_path = parent_path + "/" + node_name
					var container = get_node(parent_path)
					if container:
						container.add_child(main_node_to_add)
						var just_added_node = get_node(combined_path)
						if just_added_node:
							var data_to_be_checked : Array = []
							data_to_be_checked.append([combined_path, node_name, just_added_node])
							create_new_task("the_finisher_for_nodes", data_to_be_checked)
						else:
							print(" ERROR sub node not found ")
							nodes_to_be_added.append(data_to_process)
						
					else:
						print(" ERROR main node for sub node not found ")
						nodes_to_be_added.append(data_to_process)
	mutex_nodes_to_be_added.unlock()


## here we send data to a datapoint
func process_system_2():
	
	var try_turn_2 = mutex_data_to_send.try_lock()
	if try_turn_2:
		mutex_data_to_send.unlock()
	else:
		mutex_data_to_send.unlock()
		return
	
	
	mutex_data_to_send.lock()
	if data_to_be_send.size() > 0:
		for i in range(min(max_data_send_per_cycle, data_to_be_send.size())):
			#print(" the await two point o stuff ")
			var data_to_be_send_rn = data_to_be_send.pop_front()
			var current_type_of_data = data_to_be_send_rn[0]
			var datapoint_path_cur = data_to_be_send_rn[1]
			match current_type_of_data:
				"instructions_analiser":
					var container_path_rn = data_to_be_send_rn[2]
					var container_node_rn = get_node(container_path_rn)
					if container_node_rn:
						var datapoint_node_rn = get_node(datapoint_path_cur)
						if datapoint_node_rn:
							var array_of_data_for_threes : Array = []
							array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn, container_node_rn])
							create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
							#task_to_send_data_to_datapoint(array_of_data_for_threes)
							
							
						else:
							print(" we didnt find the datapoint we must append stuff ")
							data_to_be_send.append(data_to_be_send_rn)
					else:
						print(" we didnt get container, we must append ")
						data_to_be_send.append(data_to_be_send_rn)
				"scene_frame_upload":
					var container_path_rn = data_to_be_send_rn[2]
					var container_node_rn = get_node(container_path_rn)
					if container_node_rn:
						var datapoint_node_rn = get_node(datapoint_path_cur)
						if datapoint_node_rn:
							var array_of_data_for_threes : Array = []
							array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn, container_node_rn])
							create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
							#task_to_send_data_to_datapoint(array_of_data_for_threes)
							
							
						else:
							print(" we didnt find the datapoint we must append stuff ")
							data_to_be_send.append(data_to_be_send_rn)
					else:
						print(" we didnt get container, we must append ")
						data_to_be_send.append(data_to_be_send_rn)
				"interactions_upload":
					var datapoint_node_rn = get_node(datapoint_path_cur)
					if datapoint_node_rn:
						var array_of_data_for_threes : Array = []
						array_of_data_for_threes.append([current_type_of_data, data_to_be_send_rn[3].duplicate(true), data_to_be_send_rn[4].duplicate(true), datapoint_node_rn])
						create_new_task("task_to_send_data_to_datapoint", array_of_data_for_threes)
						#task_to_send_data_to_datapoint(array_of_data_for_threes)
						
						
					else:
						print(" we didnt got that datapoint, we gotta apend")
						data_to_be_send.append(data_to_be_send_rn)
	mutex_data_to_send.unlock()


## here we rotate, move, and change text of things
## maybe unnecesserily
func process_system_3():
	
	var try_turn_3 = movmentes_mutex.try_lock()
	if try_turn_3:
		movmentes_mutex.unlock()
	else:
		movmentes_mutex.unlock()
		return
	
	movmentes_mutex.lock()
	if things_to_be_moved.size() > 0:
		for i in range(min(max_movements_per_cycle, things_to_be_moved.size())):
			#print()
			var data_to_process = things_to_be_moved.pop_front()
			var data_type = data_to_process[0]
			var node_to_operate = data_to_process[1]
			var data_for_operation = data_to_process[2]
			match data_type:
				"move":
					node_to_operate.position = data_for_operation
				"rotate":
					node_to_operate.rotation.x -= deg_to_rad(data_for_operation)
				"write":
					for child in node_to_operate.get_children():
						if child is Label3D:
							child.text = data_for_operation
	movmentes_mutex.unlock()


## here we unload nodes and containers of things
func process_system_4():
	var try_turn_4 = mutex_for_unloading_nodes.try_lock()
	if try_turn_4:
		mutex_for_unloading_nodes.unlock()
	else:
		mutex_for_unloading_nodes.unlock()
		return
	
	mutex_for_unloading_nodes.lock()
	if nodes_to_be_unloaded.size() > 0:
		for i in range(min(max_nodes_to_unload_per_cycle, nodes_to_be_unloaded.size())):
			var data_to_process = nodes_to_be_unloaded.pop_front()
			var data_type = data_to_process[0]
			var path_of_the_node = data_to_process[1]
			match data_type:
				"container":
					print(" we would unload container")
					var container_to_unload = get_node_or_null(path_of_the_node)
					if container_to_unload:
						
						
						## check if we are adding that container to scene
						## check if we have more than one container of that type loading
						##
						var possibility_to_unload_now = check_if_we_are_adding_container(path_of_the_node)
						var possiblity_to_unload_container = check_magical_array(path_of_the_node)
						
						
						
						print(" unloading stuff we must learn abortion hehe ", possibility_to_unload_now , " and " , possiblity_to_unload_container)
						
						if possibility_to_unload_now == false or possiblity_to_unload_container == false:
							nodes_to_be_unloaded.append(data_to_process)
							mutex_for_unloading_nodes.unlock()
							return
							
							
						var sub_path_of_the_node = path_of_the_node.substr(0, path_of_the_node.length() -10)
						print("taskkkk sub_path_of_the_node ", sub_path_of_the_node)
						container_to_unload.queue_free()
						## here we were, i think unloading active record set, tree stuff too, and similar
						create_new_task("unload_container", path_of_the_node)
						## here we add it to list, and check things
						create_new_task("handle_unload_task", path_of_the_node)
						#handle_unload_task(path_of_the_node)
					else:
						print(" abortion we didnt find that container")
				"just_node":
					var node_to_unload = get_node_or_null(path_of_the_node)
					if node_to_unload:
						node_to_unload.queue_free()
						create_new_task("find_branch_to_unload", path_of_the_node)
					else:
						print(" i guess we didnt get node unfortunatelly ?")
	mutex_for_unloading_nodes.unlock()


## here we call functions
func process_system_5():
	var try_turn_5 = mutex_function_call.try_lock()
	if try_turn_5:
		mutex_function_call.unlock()
	else:
		mutex_function_call.unlock()
		return
	
	mutex_function_call.lock()
	if functions_to_be_called.size() > 0:
		for i in range(min(max_functions_called_per_cycle, functions_to_be_called.size())):
			var data_to_process = functions_to_be_called.pop_front()
			var type_of_functi = data_to_process[0]
			var node_to_call = data_to_process[1]
			var function_name = data_to_process[2]
			match type_of_functi:
				"single_function":
					if node_to_call and node_to_call.has_method(function_name):
						node_to_call.call(function_name)
				"call_function_get_node":
					var function_data = data_to_process[3]
					var node_to_call_now = get_node_or_null(node_to_call)
					if node_to_call_now and node_to_call_now.has_method(function_name):
						node_to_call_now.call(function_name, function_data)
				"call_function_single_get_node":
					var node_to_call_now = get_node_or_null(node_to_call)
					if node_to_call_now and node_to_call_now.has_method(function_name):
						node_to_call_now.call(function_name)
				"get_nodes_call_function":
					if data_to_process.size() > 3:
						var function_data = data_to_process[3]
						for nodes in node_to_call:
							var current_node_to_call = get_node_or_null(nodes)
							if current_node_to_call and current_node_to_call.has_method(function_name):
								current_node_to_call.call(function_name, function_data)
					else:
						print(" parallel reality somehow it is small size?")
	mutex_function_call.unlock()


## here we are adding more than one container of a thing, like them singular lines
func process_system_6():
	
	var try_turn_6 = mutex_additionals_call.try_lock()
	if try_turn_6:
		mutex_additionals_call.unlock()
	else:
		mutex_additionals_call.unlock()
		return
	
	mutex_additionals_call.lock()
	if additionals_to_be_called.size() > 0:
		for i in range(min(max_additionals_per_cycle, additionals_to_be_called.size())):
			print(" we got magic to do ", additionals_to_be_called)
			var data_to_process = additionals_to_be_called.pop_front()
			var type_of_data = data_to_process[0]
			var what_data = data_to_process[1]
			var amount_of_times = data_to_process[2]
			if amount_of_times != 0:
			
				match type_of_data:
					"add_container":
						print(" we got magic to do we got containers to add")
						if BanksCombiner.container_set_name.has(what_data):
							print(" we got magic to do set name found ")
							var set_name = BanksCombiner.container_set_name[what_data]
							var is_it_loading = check_if_already_loading_one(set_name)
							if is_it_loading == true:
								print(" we got magic to do it is being loaded")
								additionals_to_be_called.append(data_to_process)
							elif is_it_loading == false:
								print(" we got magic to do we can start loading it now")
								three_stages_of_creation(set_name)
								amount_of_times -=1
								additionals_to_be_called.append([type_of_data, what_data, amount_of_times])
						else:
							print(" we got magic to do set name not found ")
							additionals_to_be_called.append(data_to_process)
					"change_visibilty":
						print(" here we can change its visibility ", data_to_process)
						var container_to_make_visible = get_node(what_data)
						if container_to_make_visible:
							container_to_make_visible.visible = true
						else:
							additionals_to_be_called.append(data_to_process)
					_:
						additionals_to_be_called.append(data_to_process)
	mutex_additionals_call.unlock()

		
	var current_time = Time.get_ticks_msec()
	if current_time - memory_metadata["last_cleanup"] > memory_metadata["cleanup_thresholds"]["time_between_cleanups"]:
		var memory_state = check_memory_state()
		print(" memory_state : " , memory_metadata)
		memory_metadata["last_cleanup"] = current_time


## here we send data to a datapoint, from datapoint
## right now it is just settings text
func process_system_7():
	var try_turn_7 = mutex_messages_call.try_lock()
	if try_turn_7:
		mutex_messages_call.unlock()
	else:
		mutex_messages_call.unlock()
		return
		
	mutex_messages_call.lock()
	if messages_to_be_called.size() > 0:
		for i in range(min(max_messages_per_cycle, messages_to_be_called.size())):
			print(" we got magic to do ", messages_to_be_called)
			var data_to_process = messages_to_be_called.pop_front()
			var type_of_message = data_to_process[0]
			var message_to_send = data_to_process[1]
			var receiver = data_to_process[2]
			
			#var datapoint_to_check
			#if datapoint_to_check == true:
			
			match type_of_message:
				"singular_lines_text":
					print(" we got magic to do we got containers to add " , data_to_process)
					var container_to_check = check_if_container_available(receiver)
					print(" container_to_check : " , container_to_check)
					if container_to_check == false:
						messages_to_be_called.append(data_to_process)
					elif container_to_check == true:
						print(" container_to_check was found ")
						var datapoint_to_check = check_if_datapoint_available(receiver)
						
						if datapoint_to_check == false:
							messages_to_be_called.append(data_to_process)
						elif datapoint_to_check == true:
							
							
							var datapoint_path_check = check_if_datapoint_node_available(receiver)
							var datapoint_node = get_node(datapoint_path_check)
							
							if datapoint_node:
								print(" we got that datapoint to send message")
								datapoint_node.receive_a_message(message_to_send)
								
								
							else:
								print(" no node available yet")
								messages_to_be_called.append(data_to_process)
				"load_a_file":
					print(" we got magic to do we got containers to add " , data_to_process)
					var container_to_check = check_if_container_available(receiver)
					print(" container_to_check : " , container_to_check)
					if container_to_check == false:
						messages_to_be_called.append(data_to_process)
					elif container_to_check == true:
						print(" container_to_check was found ")
						var datapoint_to_check = check_if_datapoint_available(receiver)
						
						if datapoint_to_check == false:
							messages_to_be_called.append(data_to_process)
						elif datapoint_to_check == true:
							
							
							var datapoint_path_check = check_if_datapoint_node_available(receiver)
							var datapoint_node = get_node(datapoint_path_check)
							
							if datapoint_node:
								print(" we got that datapoint to send message")
								var diction_check = datapoint_node.check_dictionary_from_datapoint()
								print(" main check now : " ,diction_check)
								if !diction_check.is_empty():
									print(" main check not is empty")
									datapoint_node.initialize_loading_file(message_to_send)
								else:
									print(" main check is empty")
									messages_to_be_called.append(data_to_process)
							else:
								print(" no node available yet")
								messages_to_be_called.append(data_to_process)
				_:
					print(" didnt find it ")
	
	mutex_messages_call.unlock()

func process_system_8():
	var try_turn_8 = mutex_for_container_state.try_lock()
	if try_turn_8:
		mutex_for_container_state.unlock()
	else:
		mutex_for_container_state.unlock()
		return
	
	#mutex_for_container_state.lock()
	#print(" current_containers_state : " , current_containers_state)
	#mutex_for_container_state.unlock()


####################
#
# JSH Projections System
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┓    •    •       ┏┓         
#       888  `"Y8888o.   888ooooo888     ┃┃┏┓┏┓┓┏┓┏╋┓┏┓┏┓┏  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888     ┣┛┛ ┗┛┃┗ ┗┗┗┗┛┛┗┛  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888           ┛               ┛      
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Projections System
#
####################

####################
# JSH Projections System
				#print("_input : Right mouse clicked at: ", event.position)
				#print("_input : Right mouse released at: ", event.position)
		#print("_input : Mouse moved to: ", event.position)
		# For relative movement:
		#print("_input : Mouse movement delta: ", event.relative)
####################


# input, so far on laptop i just use mouse to interact, click, release, drag, left, right, middle one for camera
####################
# JSH Projections System
func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("_input : Left mouse clicked at: ", event.position)
				var current_ray_points = get_ray_points(event.position)
			else:
				print("_input : Left mouse released at: ", event.position)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				pass
			else:
				pass
	# Handle mouse motion
	if event is InputEventMouseMotion:
		pass
	camera.input(event)
####################

# ray points for mouse, with that we click things, change scenes, interact
####################
# JSH Projections System
func get_ray_points(mouse_position: Vector2):
	# Get the ray from the camera
	var from = camera.project_ray_origin(mouse_position)
	var ray_normal = camera.project_ray_normal(mouse_position)
	var to = from + ray_normal * ray_distance_set
	#print(get_world_3d())
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space_state.intersect_ray(query)
	var data : Array = []
	data.append(result)
	data.append(to)
	data.append(from)
	print(" to : " , to , " result : " , result , " from : " , from)
	create_new_task("ray_cast_data_preparer", data) #
####################

####################
# JSH Projections System
func ray_cast_data_preparer(data_ray_cast):
	var results = data_ray_cast[0]
	var tos = data_ray_cast[1]
	var froms = data_ray_cast[2]
	multi_threaded_ray_cast(results, tos, froms)
####################

####################
# JSH Projections System
		#print(" maytbe there?")
#		print("containter : ", container)
		#print("current_node : " , current_node)
		#await self.get_tree().process_frame
			#var array_of_things_that_shall_remain = 
				#print(scene_tree_jsh["main_root"]["branches"][stringy_container]["datapoint"]["datapoint_path"])
			#if array_of_things_that_shall_remain != null:
				#var array_size = array_of_things_that_shall_remain[1].size()
				#if array_size > 0:
					#secondary_interaction_after_rc(array_of_things_that_shall_remain[1])
				#unload_nodes(array_of_things_that_shall_remain[0][0])
	
		#print(line_node_now.get_script())
		#print(line_node_now.has_method("change_points_of_line"))
####################


####################
# JSH Projections System
func multi_threaded_ray_cast(result, to, from):
	print(" are we even at begining?")
	if result:
		to = result.position
		var collider = result.collider
		# Get the parent "thing" node
		var parent = collider.get_parent()
		var containter = parent.get_parent()
		var get_container = func(node: Node, method_name: String):
			while node:
				if node.has_method(method_name):
					return node
				node = node.get_parent()
			return null
		var container = get_container.call(containter, "get_datapoint")
		var datapoint = container.get_datapoint()
		var current_node = collider
		while current_node != null and not current_node.name.begins_with("thing_"):
			current_node = current_node.get_parent()
		if current_node:
			if datapoint:
				datapoint.thing_interaction(current_node)
			else:
				print(" somehow we didnt get that datapoint, but we got different kinds of data :) " , container.name)
				var stringy_container = str(container.name)
				tree_mutex.lock()
				var datapoint_path_ray_cast = scene_tree_jsh["main_root"]["branches"][stringy_container]["datapoint"]["datapoint_path"]
				tree_mutex.unlock()
				datapoint = jsh_tree_get_node(datapoint_path_ray_cast)
				if datapoint:
					datapoint.thing_interaction(current_node)
				else:
					print(" i guess it didn work out ?")
	#print(" do we ray cast? ")
	var line_node_now = jsh_tree_get_node("akashic_records/thing_3")
	if line_node_now:
		var start_end_points : Array = [from, to]
		if line_node_now.has_method("change_points_of_line"):
			line_node_now.change_points_of_line(start_end_points)
			return [from, to]
####################
# the secondary interaction after first one, right now, we used it only for unloading containers, per specific scenes, where we can pull out more than one scene, so anywhere, can also have 
# more interaction of any kind, so far i only needed that one, rest is prepared

####################
# JSH Projections System
func secondary_interaction_after_rc(array_of_data):
	var size_of_array : int = array_of_data.size()
	var counter_to_know_which : int = 0
	for interactions_to_do in array_of_data :
		var array_to_have_fun_with =  array_of_data[counter_to_know_which]
		counter_to_know_which +=1
		var counter_inter : int = 0
		for inter in ActionsBank.type_of_interactions_0:
			if array_of_data[0][0] == inter:
				match counter_inter: # "change_scene", "add_scene", "change_text", "call_function", "unload_container"
					0: # change_scene
						counter_inter = -1
					1: # add_scene
						counter_inter = -1
					2: # change_text
						counter_inter = -1
					3: # call_function
						counter_inter = -1
					4: # unload_container
						unload_container(array_to_have_fun_with[1])
						counter_inter = -1
					5: # dunno, we dont have one yet hehe
						counter_inter = -1
			counter_inter +=1
####################


####################
#
# JSH Things Creation
#
#      oooo  .oooooo..o ooooo   ooooo 
#      `888 d8P'    `Y8 `888'   `888' 
#       888 Y88bo.       888     888     ┏┳┓┓ •       ┏┓       •      ┏┓        
#       888  `"Y8888o.   888ooooo888      ┃ ┣┓┓┏┓┏┓┏  ┃ ┏┓┏┓┏┓╋┓┏┓┏┓  ┗┓┓┏┏╋┏┓┏┳┓
#       888      `"Y88b  888     888      ┻ ┛┗┗┛┗┗┫┛  ┗┛┛ ┗ ┗┻┗┗┗┛┛┗  ┗┛┗┫┛┗┗ ┛┗┗
#       888 oo     .d8P  888     888              ┛                      ┛       
#   .o. 88P 8""88888P'  o888o   o888o 
#   `Y888P                            
#
# JSH Things Creation
#
####################

#analise_data(thing_name, thing_type, metadata_parts, second_line)
# analise loaded and parsed data, for things creation!
#manifesting visual periphelia
####################
# JSH Things Creation
func analise_data(thing_name_, type, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed):
	var counter = -1
	for i in RecordsBank.type_of_thing_0:
		counter +=1
		
		if type == i:
			break
		else:
			continue

	match counter:
		0:
			create_flat_shape(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		1:
			create_text_label(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		2:
			create_array_mesh(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed) 
		3:
			create_button(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		4:
			create_cursor(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		5:
			create_connection(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		6:
			create_screen(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		7:
			create_datapoint(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		8:
			create_circle_shape(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		9:
			create_container(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		10:
			create_textmesh(thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed)
		_:  
			print("hmmm didnt find the type of thing?")
####################
# creating circle

# Example usage:
# here we are generating points in circular shape, for flat shape thingy
####################
# JSH Things Creation
func create_circle_shape(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var radius = data_to_write[0]
	var num_points = data_to_write[1]
	var points = generate_circle_points(int(radius[0]), int(num_points[0]))
	# Create the shape using your existing create_flat_shape function
	create_flat_shape(node_name, first_line, points, group_name, version_of_thing, information_lines_parsed)
####################
# i mean here, before we mostly take data, and send it here and to flat shape later
####################
# JSH Things Creation
func generate_circle_points(radius: float, num_points: int) -> Array:
	# Ensure minimum 3 points and maximum 33 points
	num_points = clamp(num_points, 3, 33)
	var points_to_clean
	var points = []
	var points_array = []
	var angle_step = TAU / num_points  # TAU is 2*PI, for a full circle
	for i in range(num_points):
		var angle = i * angle_step
		# Calculate point position using sin/cos
		var x : float = radius * cos(angle)
		var y : float = radius * sin(angle)
		var z : float
		# Format the point as a string like your other shape points
		points_to_clean = "%0.1f,%0.1f,0.0" % [x, y]
		points_to_clean = points_to_clean.split(",")
		points.append(points_to_clean)
	return points
####################

# here we make flat shape, an center point, is main, 0 vertice
# thing_name_, data_to_analyze, second_part, group_number, verion_of_thing, information_lines_parsed
####################
# JSH Things Creation
func create_flat_shape(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_f_s = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	#mesh_instance.material_override = material
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
	
	# Add center as first vertex
	vertices.push_back(Vector3.ZERO)  # Index 0 is center
	# Convert data points to Vector3s
	var vector_points = []
	for point in data_to_write:
		var point_vector = Vector3(float(point[0]), float(point[1]), float(point[2]))
		vector_points.append(point_vector)
		vertices.push_back(point_vector)
	for i in range(vector_points.size()):
		var next_i = (i + 1) % vector_points.size()
		indices.append(0)              # Center point
		indices.append(i + 1)          # Current vertex (add 1 because center is at 0)
		indices.append(next_i + 1)     # Next vertex (add 1 because center is at 0)
	
	# Create mesh
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	
	material.cull_mode = BaseMaterial3D.CULL_DISABLED # Visible from both sides
	var node_type = "flat_shape"
	
	mesh_instance.material_override = material
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_f_s)
####################
#endregion

# normal text label, with normal font
# Create Label3D with text
#region create_text_label
####################
# JSH Things Creation
func create_text_label(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_t_l = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	# Create Label3D node
	var text_label = Label3D.new()
	
	# Set the text from data (first element of first array)
	text_label.text = data_to_write[0][0]  # This will get "Akashic_Records"
	
	# Optional: Set font size (from second element of second array)
	text_label.font_size = int(data_to_write[1][0])  # This will get "33"
	text_label.no_depth_test = true  # Ensures text is always visible
	text_label.modulate = Color(1, 1, 1)  # White color
	
	# Now send the configured Label3D to node_creation
	var node_type = "text"
	node_creation(node_name, text_label, coords, to_rotate, group_name, node_type, node_path_c_t_l)
####################

# here we make array mesh, i call it models, i guess it is similar to flat shape? with a difference that it does not have center point 
####################
# JSH Things Creation
func create_array_mesh(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_a_m = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]

	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	
	var vertices = PackedVector3Array()
	var vector_points = []
	for point in data_to_write:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[2])
	vertices.append(vector_points[1])
	
	vertices.append(vector_points[0])
	vertices.append(vector_points[3])
	vertices.append(vector_points[2])

	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mesh_instance.material_override = material
	var node_type = "model"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_a_m)
####################
# the fantastic thingy! like the gmod error thingy xD
####################
# JSH Things Creation
func create_textmesh(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_tm = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]

	var text_for_label = information_lines_parsed[1][0][0]
	var size_for_label = int(information_lines_parsed[1][1][0])
	var depth = float(information_lines_parsed[1][2][0])
	var pixel_size = float(information_lines_parsed[1][3][0])

	var color_to_change = float(information_lines_parsed[1][4][0])
	var opacity_to_change = float(information_lines_parsed[1][5][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS

	
#	var material = StandardMaterial3D.new()
	var mesh_instance = MeshInstance3D.new()
	var text_mesh = TextMesh.new()
	text_mesh.text = text_for_label
	text_mesh.font_size = size_for_label
	text_mesh.depth = depth
	text_mesh.pixel_size = pixel_size
	text_mesh.horizontal_alignment = 1
	text_mesh.vertical_alignment = 1
	
	mesh_instance.mesh = text_mesh
	mesh_instance.name = node_name
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	
	if text_for_label == "JSH":
		material.metallic = 1.0
		material.metallic_specular = 0.52
		material.roughness = 0.33
	
	mesh_instance.material_override = material
	
	var node_type = "textmesh"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_tm)
####################

# here we are making buttons! just normal shape, a model, and a label, in one node :) it also has collision shape on model
####################
# JSH Things Creation
func create_button(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_b = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	
	var mesh_name = "shape_" + node_name 
	var text_label_name = "text_" + node_name

	var color_to_change = float(information_lines_parsed[1][2][0])
	var opacity_to_change = float(information_lines_parsed[1][3][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	var text_for_label = information_lines_parsed[1][0][0]
	var size_for_label = int(information_lines_parsed[1][1][0])
	
	var button_node = Node3D.new()
	button_node.name = node_name
	tasked_children(button_node, node_path_c_b)
	# Create the flat shape (background)
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
	
	# Convert shape data points to Vector3s
	var vector_points = []
	for point in data_to_write:  # First array contains shape points
		var point_vector = Vector3(float(point[0]), float(point[1]), float(point[2]))
		vector_points.append(point_vector)
		vertices.push_back(point_vector)
	
	# Create triangles for the flat shape
	indices.append(0)  # First triangle
	indices.append(1)
	indices.append(2)
	
	indices.append(0)  # Second triangle
	indices.append(2)
	indices.append(3)
	
	# Create mesh for the shape
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance for the shape
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.name = mesh_name
	
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	mesh_instance.material_override = material
	
	# Create Label3D for the text
	var text_label = Label3D.new()
	text_label.name = text_label_name
	text_label.text = text_for_label
	text_label.font_size = size_for_label
	text_label.no_depth_test = true
	text_label.modulate = Color(1, 1, 1)  # White text
	text_label.position.z += 0.01  # Slight offset to prevent z-fighting
	
	var mesh_path = node_path_c_b + "/" + mesh_name
	var label_path = node_path_c_b + "/" + text_label_name
	tasked_children(text_label, label_path)
	# Use existing node creation for final setup
	var node_type = "button"
	node_creation(mesh_name, mesh_instance, coords, to_rotate, group_name, node_type, mesh_path)
####################

# just normal three vertices triangle :)
# i wanna make mouse and moouse curson in vr and use hand tracking because!
# i can do it!
####################
# JSH Things Creation
func create_cursor(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_c_0 = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]

	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])

	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	
	var vertices = PackedVector3Array()
	var triangle_data = [data_to_write[0], data_to_write[1], data_to_write[2]]
	var triangle_scale = data_to_write[3]#cursor_thingy[3] 
	
	var triangle_scale_vec3 : Vector3 = Vector3(float(triangle_scale[0]), float(triangle_scale[1]), float(triangle_scale[2]))
	var vector_points = []
	for point in triangle_data:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[1])
	vertices.append(vector_points[2])
	
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.scale = triangle_scale_vec3
	
	material.cull_mode = StandardMaterial3D.CULL_DISABLED  # This makes it visible from both sides
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED  # Optional: makes it look flat

	
	mesh_instance.material_override = material
	var node_type = "cursor"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_c_0)
####################

# here we are making lines! we need two points between something, to make the lines
####################
# JSH Things Creation
func create_connection(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_cc_c = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var cords_for_line = [data_to_write[0], data_to_write[1]]
	var color_for_line = data_to_write[2][0]
	
	# Convert the line endpoints from data_to_write
	var point1 = Vector3(
		float(cords_for_line[0][0]),
		float(cords_for_line[0][1]),
		float(cords_for_line[0][2])
	)
	
	var point2 = Vector3(
		float(cords_for_line[1][0]),
		float(cords_for_line[1][1]),
		float(cords_for_line[1][2])
	)

	var center = point1 + point2 / 2
	# Create the lines
	var mesh_instance = MeshInstance3D.new()
	var immediate_mesh = ImmediateMesh.new()
	mesh_instance.mesh = immediate_mesh
	mesh_instance.name = node_name
	
	# Set up material
	var material = StandardMaterial3D.new()
	material.shading_mode = StandardMaterial3D.SHADING_MODE_UNSHADED
	var color_line = float(data_to_write[2][0])
	material.albedo_color = get_spectrum_color(color_line)
	mesh_instance.material_override = material
	
	# Draw the lines
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES)
	
	# Line from point1 to center
	immediate_mesh.surface_add_vertex(point1 + center)
	immediate_mesh.surface_add_vertex(center)
	
	# Line from center to point2
	immediate_mesh.surface_add_vertex(center)
	immediate_mesh.surface_add_vertex(point2 + center)
	
	immediate_mesh.surface_end()
	
	mesh_instance.set_script(LineScript)
	var node_type = "connection"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_cc_c)
####################

# creating screen, it is just an 4 vertices point thingy
####################
# JSH Things Creation
func create_screen(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_s = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]

	var color_to_change = float(information_lines_parsed[1][0][0])
	var opacity_to_change = float(information_lines_parsed[1][1][0])
	
	var material = StandardMaterial3D.new()
	var color_to_add_op = get_spectrum_color(color_to_change)
	color_to_add_op.a = opacity_to_change
	material.albedo_color = color_to_add_op
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS

	var vertices = PackedVector3Array()

	var vector_points = []
	for point in data_to_write:
		vector_points.append(Vector3(float(point[0]), float(point[1]), float(point[2])))
	
	# Create triangles
	vertices.append(vector_points[0])
	vertices.append(vector_points[2])
	vertices.append(vector_points[1])
	
	vertices.append(vector_points[0])
	vertices.append(vector_points[3])
	vertices.append(vector_points[2])

	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	# Create mesh instance and set properties
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = arr_mesh
	mesh_instance.material_override = material
	var node_type =  "screen"
	node_creation(node_name, mesh_instance, coords, to_rotate, group_name, node_type, node_path_c_s)
####################

# datapoint creation! one of the nodes i really like :)
####################
# JSH Things Creation
func create_datapoint(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	var node_path_c_dp = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var data_point = Node3D.new()
	data_point.set_script(DataPointScript)
	data_point.setup_main_reference(self)
	
	var message_tester 
	message_tester = data_point.power_up_data_point(node_name, int(version_of_thing), data_to_write)
	var node_type = "datapoint"
	node_creation(node_name, data_point, coords, to_rotate, group_name, node_type, node_path_c_dp)
####################

# the container thingy
####################
# JSH Things Creation
func create_container(node_name: String, first_line : Array, data_to_write : Array, group_name : String, version_of_thing : String, information_lines_parsed : Array):
	print(" container test ? ", data_to_write[1][0])
	var visibility_of_container = int(data_to_write[1][0])
	var node_path_c_con = first_line[6][0]
	var coords = first_line[1]
	var to_rotate = first_line[2]
	var container 
	container = Node3D.new()
	
	container.name = data_to_write[0][0]
	if visibility_of_container == 0:
		container.visible = false
	
	container.set_script(ContainterScript)
		# Add initialization with data_to_write if needed
	if container.has_method("container_initialize"):
		container.container_initialize(data_to_write)

	var node_type = "container"
	node_creation(data_to_write[0][0], container, coords, to_rotate, group_name, node_type, node_path_c_con)
####################

# this is one of my ideas of how to make nice color slider, black to white to black to colors, so we got all colors kinda, like stars too, and at beginning we just have black to white hole stuff :)
####################
# JSH Things Creation
func get_spectrum_color(value: float) -> Color:
	# Ensure value is between 0 and 1
	value = clamp(value, 0.0, 1.0)
	
	# Map 0-1 to our 9 color points
	var color_index = value * 10  # 10 segments for 11 colors
	
	# Define our color points
	var colors = [
		Color(0.0, 0.0, 0.0),      # 1. Black
		Color(1.0, 1.0, 1.0),      # 2. White
		Color(0.0, 0.0, 0.0),      # 3. Black
		Color(0.45, 0.25, 0.0),    # 4. Brown
		Color(1.0, 0.0, 0.0),      # 5. Red
		Color(1.0, 0.5, 0.0),      # 6. Orange
		Color(1.0, 1.0, 0.0),      # 7. Yellow
		Color(1.0, 1.0, 1.0),      # 8. White
		Color(0.0, 1.0, 0.0),      # 9. Green
		Color(0.0, 0.0, 1.0),      # 10. Blue
		Color(0.5, 0.0, 0.5)       # 11. Purple
	]
	
	# Find the two colors to interpolate between
	var lower_index = floor(color_index)
	var upper_index = ceil(color_index)
	
	# Get interpolation factor between these two colors
	var t = color_index - lower_index
	return colors[lower_index].lerp(colors[min(upper_index, 8)], t)
####################

####################
#
# JSH Scene Tree Add Nodes, Physical and Astral Bodies
#
#      oooo  .oooooo..o ooooo   ooooo      ┏┓         ┏┳┓        ┏┓ ┓ ┓  ┳┓   ┓     
#      `888 d8P'    `Y8 `888'   `888'      ┗┓┏┏┓┏┓┏┓   ┃ ┏┓┏┓┏┓  ┣┫┏┫┏┫  ┃┃┏┓┏┫┏┓┏   
#       888 Y88bo.       888     888       ┗┛┗┗ ┛┗┗    ┻ ┛ ┗ ┗   ┛┗┗┻┗┻  ┛┗┗┛┗┻┗ ┛   
#       888  `"Y8888o.   888ooooo888      ┏┓┓    •   ┓       ┓  ┏┓      ┓  ┳┓   ┓•  
#       888      `"Y88b  888     888      ┃┃┣┓┓┏┏┓┏┏┓┃  ┏┓┏┓┏┫  ┣┫┏╋┏┓┏┓┃  ┣┫┏┓┏┫┓┏┓┏
#       888 oo     .d8P  888     888      ┣┛┛┗┗┫┛┗┗┗┻┗  ┗┻┛┗┗┻  ┛┗┛┗┛ ┗┻┗  ┻┛┗┛┗┻┗┗ ┛
#   .o. 88P 8""88888P'  o888o   o888o          ┛                        
#   `Y888P                            
#
# JSH Scene Tree Add Nodes, Physical and Astral Bodies, also Sprit bodies ;)
#
####################

# the node creation part! here we are putting nodes, wait a minute, we done it in buttons too? are we retarded or somethin?
####################
# JSH Scene Tree Add Nodes, Physical and Astral Bodies
func node_creation(node_name, crafted_data, coords, to_rotate, group_number, node_type, path_of_thing):
	crafted_data.add_to_group(group_number)
	var pos_parts = coords
	var position_ = Vector3(float(pos_parts[0]), float(pos_parts[1]), float(pos_parts[2]))
	crafted_data.position = position_
	
	# Set rotation
	var rot_parts = to_rotate
	var rotation_euler = Vector3(float(rot_parts[0]), float(rot_parts[1]), float(rot_parts[2]))
	crafted_data.rotation_degrees = rotation_euler
	# Set name if provided
	if node_name != "":
		crafted_data.name = node_name
		
	tasked_children(crafted_data, path_of_thing)
	
	match node_type:
		"flat_shape", "model", "cursor", "screen", "circle", "button" :
			add_collision_to_thing(crafted_data, node_type, path_of_thing, node_name)
		_:
			pass
	
	return crafted_data
#####################

# here we add collision shapes to things
####################
# JSH Scene Tree Add Nodes, Physical and Astral Bodies
func add_collision_to_thing(thing_node, node_type, path_of_thingy, name_of_thingy):
	# First add the regular flat collision
	
	# static_body
	var static_body_name = "collision_" + name_of_thingy 
	var static_body_path = path_of_thingy + "/" + static_body_name
	
	var static_body = StaticBody3D.new()
	static_body.name = static_body_name
	
	# collision_shape
	var shape_name = "shape_" + name_of_thingy 
	var collision_shape_path = static_body_path + "/"  + shape_name
	
	var collision_shape = CollisionShape3D.new()
	collision_shape.name = shape_name
	
	# area
	var area_name = "aura_" + name_of_thingy 
	var area_node_path = path_of_thingy + "/" + area_name
	
	var area = Area3D.new()
	area.name = area_name
	
	# area_collision_shape it trully is aura!
	var collision_area = "collision_aura_" + name_of_thingy
	var collision_area_path = area_node_path + "/" + collision_area
	
	var area_collision_shape = CollisionShape3D.new()
	area_collision_shape.name = collision_area

	# Get mesh data to determine shape size
	var mesh_instance = thing_node as MeshInstance3D
	if mesh_instance and mesh_instance.mesh:
		var aabb = mesh_instance.mesh.get_aabb()
		
		match node_type:
			"flat_shape", "model", "button", "cursor", "screen", "circle":
				# Create flat collision shape for StaticBody
				var flat_shape = ConvexPolygonShape3D.new()
				var vertices = mesh_instance.mesh.get_faces()
				flat_shape.points = vertices
				collision_shape.shape = flat_shape
				
				# Create larger shape for Area3D
				var area_shape = ConvexPolygonShape3D.new()
				var expanded_vertices = PackedVector3Array()
				
				# Create expanded version of vertices for area
				var expansion_distance = 0.2  # Distance to expand in all directions
				# Expand in all directions by adding vertices offset in +/- x, y, z
				for vert in vertices:
					# Positive directions
					expanded_vertices.push_back(vert + Vector3(expansion_distance, expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, -expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, expansion_distance, expansion_distance))
					# Negative directions
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, -expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, -expansion_distance, expansion_distance))
					expanded_vertices.push_back(vert + Vector3(-expansion_distance, expansion_distance, -expansion_distance))
					expanded_vertices.push_back(vert + Vector3(expansion_distance, -expansion_distance, -expansion_distance))
				
				area_shape.points = expanded_vertices
				area_collision_shape.shape = area_shape
				
			"heightmap":
				# Create flat collision shape for StaticBody
				var flat_shape = ConvexPolygonShape3D.new()
				var vertices = mesh_instance.mesh.get_faces()
				flat_shape.points = vertices
				collision_shape.shape = flat_shape
				
				# Create larger shape for Area3D
				var area_shape = ConvexPolygonShape3D.new()
				var expanded_vertices = PackedVector3Array()
				
				# Create expanded version of vertices for area
				var expansion_distance = 0.2  # Distance above and below the surface
				for vert in vertices:
					expanded_vertices.push_back(vert + Vector3(0, expansion_distance, 0))
				for vert in vertices:
					expanded_vertices.push_back(vert - Vector3(0, expansion_distance, 0))
				
				area_shape.points = expanded_vertices
				area_collision_shape.shape = area_shape
			_: # Default fallback
				return
	
	# Configure collision properties
	static_body.collision_layer = 1
	static_body.collision_mask = 1
	
	area.collision_layer = 2  # Using different layer for area detection
	area.collision_mask = 2   # Adjust these values based on your needs

	tasked_children(static_body, static_body_path)
	tasked_children(collision_shape, collision_shape_path)
	tasked_children(area, area_node_path)
	tasked_children(area_collision_shape, collision_area_path)
####################
