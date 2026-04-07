extends Panel

const SIDEBAR = preload("res://assets/scenes/ui/level_sidebar.tscn")
const PAUSE = preload("res://assets/scenes/ui/pause_menu.tscn")
const PLANT = preload("res://assets/scenes/levels/PowerPlant.tscn")
var file
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# (50,50) x (1000, 600)
	randomize()
	file = Global.level_file
	var level_sidebar = SIDEBAR.instantiate()
	add_child(level_sidebar)
	load_plants(file)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		var xPos = randi_range(50, 600)
		var yPos = randi_range(50, 600)
		var plant = PLANT.instantiate()
		add_child(plant)
		plant.position = Vector2(xPos,yPos)
		print("plant spawned at : ("+ str(xPos) + "," + str(yPos) + ")")
		
	if Input.is_action_just_pressed("pause"):
		var pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		get_tree().paused = true

func load_plants(filepath):
	var plant_dict = {}
	var pNames = []
	var pTypes = []
	var file2 = FileAccess.open(Global.savePath + "/" + file ,FileAccess.READ)
	while file2.get_position() < file2.get_length():
		var json_string = file2.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		plant_dict = json.data
		pNames = plant_dict["plant_names"]
		pTypes = plant_dict["plant_types"]
		spawn_plants(plant_dict)

func spawn_plants(dict):
	for plants in dict["plant_names"]:
		var xPos = randi_range(50, 600)
		var yPos = randi_range(50, 600)
		var plant = PLANT.instantiate()
		add_child(plant)
		plant.set_color(Color.from_hsv(randf(), 0.8, 1.0))
		plant.position = Vector2(xPos,yPos)
		print("plant spawned at : ("+ str(xPos) + "," + str(yPos) + ")")
