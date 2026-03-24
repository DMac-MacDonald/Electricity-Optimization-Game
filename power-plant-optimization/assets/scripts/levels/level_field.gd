extends Panel

const SIDEBAR = preload("res://assets/scenes/ui/level_sidebar.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_sidebar = SIDEBAR.instantiate()
	add_child(level_sidebar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
