extends Panel

var pType
var pName
var pIndex
var color
@onready var plant_name_label: Label = $HBoxContainer/VBoxContainer/PlantName
@onready var plant_type_label: Label = $HBoxContainer/VBoxContainer/PlantType

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if pIndex != null:
		get_parent().move_child(self, pIndex)
	plant_type_label.text = pType
	plant_name_label.text = pName
	pIndex = get_index()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_values(plant_name, plant_type, plant_index, pColor):
	pType = plant_type
	pName = plant_name
	pIndex = plant_index
	modulate = pColor
	color = pColor
	match pType:
		"Solar":
			%PlantSprite.play("solar")
		"Nuclear":
			%PlantSprite.play("nuclear")
		"Concentrating Solar":
			%PlantSprite.play("conc_solar")
		"Hydro":
			%PlantSprite.play("hydro")
		"Wind":
			%PlantSprite.play("wind")
		"Coal":
			%PlantSprite.play("coal")
		


func _on_plant_button_pressed() -> void:
	var expanded_card = load("res://assets/scenes/ui/plant_card_expanded.tscn").instantiate()
	expanded_card.set_values(pName,pType,pIndex, color)
	var parent = get_parent()
	
	if parent != null:
		parent.add_child(expanded_card)
	queue_free()
