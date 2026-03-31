extends MarginContainer

var level_file = "N/A"
var difficulty = ""
var length = ""
var author = ""
var image = ""
var title = ""
var type = ""
var description = ""
func _ready() -> void:
	if level_file != "N/A":
		var level_dict = {}
		var file = FileAccess.open(Global.savePath + "/" + level_file , FileAccess.READ)
		print("loading " + str(level_file))
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
		difficulty = level_dict["level_difficulty"]
		author = level_dict["level_author"]
		length = level_dict["level_length"]
		image = level_dict["level_image"]
		title = level_dict["level_title"]
		type = level_dict["level_type"]
		description = level_dict["level_description"]
		
		%LevelTitle.text = title
		%LevelType.text = type
		#%LevelImage
		%LevelDescription.text = description
		%DiffLabel.text = difficulty
		%LengthLabel.text = length
		%AuthorLabel.text = author
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_file = Global.level_file
