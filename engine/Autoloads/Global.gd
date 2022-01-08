extends Node




var from
var player = "Player"
var data
var coins = 0
var level_name = null
var direction = Vector2.ZERO
var current_level

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

func save_game():
	data = {
		"current_level": current_level,
		"from": from,
		"player": player,
	}
	var file = File.new()
	file.open("user://savegame.json", File.WRITE)
	var json = to_json(data)
	file.store_line(json)
	file.close()

func load_game():
	var file = File.new()
	if file.file_exists("user://savegame.json"):
		file.open("user://savegame.json", File.READ)
		data = parse_json(file.get_as_text())
		file.close()

		current_level = data.current_level
		from = data.from
		player = data.player
func reset():
	from = null
	player = "Player"

