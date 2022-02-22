extends Node2D

onready var global_vars = get_node("/root/Global")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var character
	if global_vars.NPCCreator:
		$PlayerCreatorStructure.visible = false
		$NPCCreator.visible = true
		character = $NPCCreator
		
		character.get_node("Head").frame_coords.y = global_vars.head + 3
		character.get_node("Body").frame_coords.y = global_vars.body + 3
		character.get_node("Eyes").frame_coords.y = global_vars.Eyes + 3
		character.get_node("Headwear").frame_coords.y = global_vars.Headwear + 3
	else:
		$PlayerCreatorStructure.visible = true
		$NPCCreator.visible = false
		character = $PlayerCreatorStructure
		
		character.get_node("Head").frame_coords.y = global_vars.head + 3
		character.get_node("Body").frame_coords.y = global_vars.body + 3
		character.get_node("Eyes").frame_coords.y = global_vars.Eyes + 3
		character.get_node("Headwear").frame_coords.y = global_vars.Headwear + 3
		
#	var ap = character.get_node("AnimationPlayer")
#	if global_vars.run and ap.current_animation != 'Run':
#		ap.stop()
#		ap.play('Run')
#	if !global_vars.run and ap.current_animation != 'Idle':
#		ap.stop()
#		ap.play('Idle')
