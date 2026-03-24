extends CanvasLayer

const SETTINGS = preload("res://assets/scenes/ui/settings_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = false
		queue_free()


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	queue_free()


func _on_settings_button_pressed() -> void:
	var settings = SETTINGS.instantiate()
	add_child(settings)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
