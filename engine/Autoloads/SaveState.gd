extends Node

func _ready():
	queue_free()
	
#
#const SaveGame = preload('res://AutoLoads/SaveGame.gd')
#
#func save_game():
#	var save_game := SaveGame.new()
#	save_game.game_version = ProjectSettings.get_setting("application/config/version")
#	var saved_nodes = get_tree().get_nodes_in_group("Saved")
#
#	for node in saved_nodes:
#		if node.filename.empty():
#			break
#
#		var node_details = node.get_save_states()
#		save_game.store_line(to_json(node_details))
#
#	save_game.close()
#
#func _notification(what):
#	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST or what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
#		save_game()
