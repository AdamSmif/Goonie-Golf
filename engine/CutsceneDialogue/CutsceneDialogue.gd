extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file
export(String, FILE, "*.tscn") var next_world_scene

var dialogues = []
var current_dialogue_id = 0
var is_dialogue_active = true

func _ready():
	play()
	
func play():
	dialogues = load_dialogue()
	
	current_dialogue_id = -1
	next_line()
	
func _input(event):
	if event.is_action_pressed("talk"):
		next_line()
		
func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		get_tree().change_scene(next_world_scene)
		return

	$NinePatchRect/Name.text = dialogues[current_dialogue_id]["name"]
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]["text"]
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())


func _on_Timer_timeout():
	is_dialogue_active = false
