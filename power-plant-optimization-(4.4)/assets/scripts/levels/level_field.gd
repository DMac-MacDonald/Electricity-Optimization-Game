extends Panel

const SIDEBAR = preload("res://assets/scenes/ui/level_sidebar.tscn")
const PAUSE = preload("res://assets/scenes/ui/pause_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_sidebar = SIDEBAR.instantiate()
	add_child(level_sidebar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		var pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		get_tree().paused = true
