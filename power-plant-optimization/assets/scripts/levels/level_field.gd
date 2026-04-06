extends Panel

const SIDEBAR = preload("res://assets/scenes/ui/level_sidebar.tscn")
const PAUSE = preload("res://assets/scenes/ui/pause_menu.tscn")
var file
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	file = Global.level_file
	var level_sidebar = SIDEBAR.instantiate()
	add_child(level_sidebar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		var pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		get_tree().paused = true

func load_plants(filepath):
	var plant_dict = {}
	var pNames = []
	var pTypes = []
	var file = FileAccess.open(filepath,FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_string = file.get_line()

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
		
	for plant in pNames:
		var pObject = load("res://assets/scenes/levels/PowerPlant.tscn")
