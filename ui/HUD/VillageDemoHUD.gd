extends CanvasLayer

var bottles = 0
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

func _ready():
	$Bottles.text = String(bottles)

func _physics_process(delta):
		if bottles == 8:
			get_tree().change_scene(bottle_world_scene)


func _on_bottle_collected():
	bottles = bottles + 1
	_ready()
