extends Node




var from
var player = "Player"
var data
var coins = 0
var level_name = null
var direction = Vector2.ZERO
var current_level

# Character Creator #

var NPCCreator := false
var body := 0
var head := 0
var Eyes := 0
var Headwear := 0
var Skincolor := 0

signal no_health
signal health_changed(value)
signal max_health_changed(value)
signal health_bar_size(value)

# TODO: Declare Max Health
#func _ready():
#	self.health = max_health
#
#func set_max_health(value):
#	max_health = value
#	self.health = min(health, max_health)
#	emit_signal("max_health_changed", max_health)
#
#func set_health(value):
#	health = value
#	emit_signal("health_changed", health)
#	if health <= 0:
#		emit_signal("no_health")
#
#func set_health_bar(value):
#	health_bar = value
#	emit_signal("health_bar_size", health_bar)

# Different Ports #
var gui: PackedScene # platform-dependent UI scenes.

#func _ready():
#	if OS.get_name() == "Android":
#		gui = load("res://ui/HUD/MobileControls.tscn")
#	else:
#		pass
	
	
	
#	if OS.get_name() == "Android":
#    	gui = load("android-ui.tscn")
#else :
#    gui = load("pc-ui.tscn"

const save_path = "user://save.dat"

func _ready():
	load_data()

func changeBody(direction):
	pass
	
func changehead(direction):
	if head > 4:
		head = 0
	if head < 0:
		head = 4
	
func changeEyes(direction):
	if Eyes > 4:
		Eyes = 0
	if Eyes < 0:
		Eyes = 4
	
func changeHeadwear(direction):
	if Headwear > 4:
		Headwear = 0
	if Headwear < 0:
		Headwear = 4
		
func changeSkincolor(direction):
	if Skincolor > 4:
		Skincolor = 0
	if Skincolor < 0:
		Skincolor = 4
		
func save_data():
	var data = {
		"head": head,
		"body": body,
		"Eyes": Eyes,
		"Headwear": Headwear,
		"Skincolor": Skincolor,
	}
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	
func load_data():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var data = file.get_var()
			file.close()
		
			head = data['head']
			body = data['body']
			Eyes = data['Eyes']
			Headwear = data['Headwear']
			Skincolor = data['Skincolor']

