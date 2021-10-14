extends Node2D

var player = preload("res://entities/Player/main player wade/Player.tscn")

func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
	# By default, all nodes in server inherit from master,
	# while all nodes in clients inherit from slave.
		
	if (get_tree().is_network_server()):		
		#If in the server, get control of player 2 to the other peer.
		#This function is tree recursive by default.
		get_node("player2").set_network_master(get_tree().get_network_connected_peers()[0])
	else:
		#If in the client, give control of player 2 to itself. 
		#This function is tree recursive by default.
		get_node("player2").set_network_master(get_tree().get_network_unique_id())
		
	print("unique id: ",get_tree().get_network_unique_id())
