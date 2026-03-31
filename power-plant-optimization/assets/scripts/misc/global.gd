extends Node
var savePath = "res://save_files"
var saveDirectory := DirAccess.open(savePath)
var level_file = "N/A"
signal level_chosen
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if saveDirectory == null:
		print("ERROR INVALID SAVE DIRECTORY")
	else:
		print("save directory found at " + savePath)
		var file_names = saveDirectory.get_files()
		print(file_names)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
