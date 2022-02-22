extends Node

var body := 0
var head := 0
var Eyes := 0
var Headwear := 0

const save_path = "user://save.dat"

func _ready():
	load_data()

func changeBody(direction):
	pass
	
func changeHead(direction):
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
		
func save_data():
	var data = {
		"head": head,
		"body": body,
		"Eyes": Eyes,
		"Headwear": Headwear,
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
