extends TextureRect

const PAUSE = preload("res://assets/scenes/ui/pause_menu.tscn")
const SETTINGS = preload("res://assets/scenes/ui/settings_ui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#test save file writing
	var level1dict = {
		"level_name" : "Beginner level",
		"level_type" : "Crisis",
		"level_description": "Easy level to introduce new players to the game" ,
		"level_difficulty": "1/5",
		"level_length": "~30 minutes",
		"level_author": "Base game",
		"level_image" : "N/A",
		"plant_names" : ["Pink Plant", "Red Plant", "Blue Plant", "Green Plant", "Yellow Plant"],
		"plant_types" : ["Solar", "Nuclear", "Conc Solar", "Hydro", "Wind"]
		
	}
	var save_file = FileAccess.open("res://save_files/level1.save", FileAccess.WRITE)
	var json_string = JSON.stringify(level1dict)
	save_file.store_line(json_string)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		var pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		get_tree().paused = true


func _on_settings_button_pressed() -> void:
	var settings_menu = SETTINGS.instantiate()
	add_child(settings_menu)


func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/levels/level_field.tscn")
