extends Panel

var pType
var pName
var pIndex
@onready var name_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/NameLabel
@onready var info_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/InfoButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().move_child(self, pIndex)
	name_label.text = pName
	info_button.text = pType
	pIndex = get_index()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_values(plant_name, plant_type, plant_index):
	pName = plant_name
	pType = plant_type
	pIndex = plant_index

func _on_plant_button_pressed() -> void:
	var pCard = load("res://assets/scenes/ui/plant_card.tscn").instantiate()
	pCard.set_values(pName,pType,pIndex)
	var parent = get_parent()
	
	if parent != null:
		parent.add_child(pCard)
	queue_free()
