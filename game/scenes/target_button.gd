extends Button

func _can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[target_button] can_drop_data has run, returning %s" % can_drop)
	return can_drop
	
func _drop_data(position:Vector2, data) -> void: 
	print("[target_button] drop_data has run")
