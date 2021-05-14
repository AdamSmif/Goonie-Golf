extends Area2D

var active = false

func _ready():
	connect("body_entered", self, 'on_NPC_body_entered')
	connect("body_exited", self, 'on_NPC_body_exited')
	
func _process(delta):
	$Question.visible = active
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
	
func _on_NPC_body_entered(body):
	if body.name == 'PlayerNoGun' or 'Player':
		active = true
		
func _on_NPC_body_exited(body):
	if body.name == 'PlayerNoGun' or 'Player':
		active = false




func _on_NPCDialogicTest_area_entered(area):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://test/DialogicTest/DialogicTest2.tscn")
