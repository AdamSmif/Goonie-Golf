extends Node
var from


var gui: PackedScene # platform-dependent UI scenes.

func _ready():
	if OS.get_name() == "Android":
		gui = load("res://ui/HUD/MobileControls.tscn")
	else:
		pass
	
	
	
#	if OS.get_name() == "Android":
#    	gui = load("android-ui.tscn")
#else :
#    gui = load("pc-ui.tscn"

func reset():
	from = null
	print(from)

const SERVER_PORT = 5225
const MAX_PLAYERS = 16
const WORLD_SIZE = 40000.0
const TICK_DURATION = 50 # In milliseconds, it means 20 network updates/second



# Default hostname used by the login form
const DEFAULT_HOSTNAME = "127.0.0.1"

# Store information about connected players
var player_info = {}
