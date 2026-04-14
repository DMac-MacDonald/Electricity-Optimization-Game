extends CanvasLayer

const TIMELINE = preload("res://assets/scenes/ui/timeline.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tab_1_toggled(toggled_on: bool) -> void:
	for n in %MarginContainer.get_children():
		%MarginContainer.remove_child(n)
		n.queue_free() 
	var timeline = TIMELINE.instantiate()
	%MarginContainer.add_child(timeline)


func _on_tab_2_toggled(toggled_on: bool) -> void:
	for n in %MarginContainer.get_children():
		%MarginContainer.remove_child(n)
		n.queue_free() 


func _on_tab_3_toggled(toggled_on: bool) -> void:
	for n in %MarginContainer.get_children():
		%MarginContainer.remove_child(n)
		n.queue_free() 
