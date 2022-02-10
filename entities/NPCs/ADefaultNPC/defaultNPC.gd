extends Area2D


func _input(event):
	if event.is_action_pressed("talk") and len(get_overlapping_bodies()) > 0:
		find_and_use_dialogue()
		find_and_use_dialoguemanager()
		
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	
	if dialogue_player:
		dialogue_player.play()
		
func find_and_use_dialoguemanager():
	var dialoguemanager = get_node_or_null("DialogueManager")
	
	if dialoguemanager:
		dialoguemanager.play()


func _on_defaultNPC_area_entered(area):
	Global.from = get_parent().name
	print("?") 
	$AnimationPlayer.play("interaction")


func _on_defaultNPC_area_exited(area):
	Global.from = get_parent().name
	print("? off") 
	$AnimationPlayer.play("interactionoff")
