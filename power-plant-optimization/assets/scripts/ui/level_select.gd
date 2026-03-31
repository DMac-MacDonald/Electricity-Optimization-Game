extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_dict = {}
	var saves = Global.saveDirectory.get_files()
	for save in saves:
		var file = FileAccess.open(Global.savePath + "/" + save , FileAccess.READ)
		print("loading " + save)
		while file.get_position() < file.get_length():
			var json_string = file.get_line()
			# Creates the helper class to interact with JSON.
			var json = JSON.new()
			# Check if there is any error while parsing the JSON string, skip in case of failure.
			var parse_result = json.parse(json_string)
			if not parse_result == OK:
				print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
				continue
			level_dict = json.data
			
			var level_button = load("res://assets/scenes/ui/level_select_button.tscn").instantiate()
			%LevelContainer.add_child(level_button)
			level_button.set_values(level_dict["level_name"],save)
			level_button.showInfo.connect(_showLevelInfo)
			
		
			

func _showLevelInfo(file):
	for n in %LevelInfoContainer.get_children():
		%LevelInfoContainer.remove_child(n)
		n.queue_free() 
	var levelInfo = load("res://assets/scenes/ui/level_info_ui.tscn").instantiate()
	%LevelInfoContainer.add_child(levelInfo)
	levelInfo.level_file = file
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
