extends TextureRect

export(PackedScene) var this_scene
onready var object_cursor = get_node("/root/main/Editor_Object")
onready var main = get_node("/root/main")
onready var cursor_sprite = object_cursor.get_node("Sprite")

func _ready():
	connect("gui_input",self,"_item_clicked")
	pass # Replace with function body.


func _item_clicked(event):
	if(event is InputEvent):
		if(event.is_action_pressed("mb_left")):
			object_cursor.current_item = this_scene
			cursor_sprite.texture = texture
		
	pass
	
func _process(delta):
	if(main.playing):
		this_scene = true
	pass
