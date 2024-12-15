extends Button

func _ready() -> void:
	add_to_group("DRAGGABLE")
	
func _get_drag_data(at_position: Vector2):
	print("[self_care] get_drag_data has run")
	return self
