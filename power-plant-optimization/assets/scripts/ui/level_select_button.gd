extends Button
var file

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_values(levelName,path):
	file = path
	text = levelName

func _on_pressed() -> void:
	Global.level_file = file
