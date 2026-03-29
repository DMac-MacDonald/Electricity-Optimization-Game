extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = false
		queue_free()


func _on_exit_button_pressed() -> void:
	if get_parent().get_class() == "TextureRect":
		get_tree().paused = false
	queue_free()
