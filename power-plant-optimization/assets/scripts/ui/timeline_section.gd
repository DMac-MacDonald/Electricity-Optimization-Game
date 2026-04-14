extends Panel

var id
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if id == Global.current:
		%Arrow.modulate.a = 1
	else:
		%Arrow.modulate.a = 0
		

func set_id(num):
	id = num
	%TickLabel.text = str(num)
