extends CanvasLayer

var PCARD = preload("res://assets/scenes/ui/plant_card.tscn")
var SLIDE = preload("res://assets/scenes/ui/sliders.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_plant_cards("res://save_files/level1.save")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_plant_cards(filepath):
	var plant_dict = {}
	var pNames = []
	var pTypes = []
	var file = FileAccess.open(filepath,FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_string = file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		plant_dict = json.data
		pNames = plant_dict["plant_names"]
		pTypes = plant_dict["plant_types"]
	
	for i in range(pNames.size()):
		var pCard = PCARD.instantiate()
		pCard.set_values(pNames[i],pTypes[i], i)
		%PlantCardContainer.add_child(pCard)

		
		




func _on_tab_1_button_toggled(toggled_on: bool) -> void:
	for n in %TabInfoContainer.get_children():
		%TabInfoContainer.remove_child(n)
		n.queue_free() 
	var sliders = SLIDE.instantiate()
	%TabInfoContainer.add_child(sliders)

func _on_tab_2_button_toggled(toggled_on: bool) -> void:
	for n in %TabInfoContainer.get_children():
		%TabInfoContainer.remove_child(n)
		n.queue_free() 

func _on_tab_3_button_toggled(toggled_on: bool) -> void:
	for n in %TabInfoContainer.get_children():
		%TabInfoContainer.remove_child(n)
		n.queue_free() 

func _on_tab_4_button_toggled(toggled_on: bool) -> void:
	for n in %TabInfoContainer.get_children():
		%TabInfoContainer.remove_child(n)
		n.queue_free() 
