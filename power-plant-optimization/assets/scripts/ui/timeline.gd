extends ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(30):
		var section = load("res://assets/scenes/ui/timeline_section.tscn").instantiate()
		print(%HBoxContainer.get_child_count())
		%HBoxContainer.add_child(section)
		section.set_id(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
