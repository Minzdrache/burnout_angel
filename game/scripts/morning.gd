extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[daily_planner] can_drop_data has run, returning %s" % can_drop)
	return can_drop
	
func _drop_data(position:Vector2, data) -> void: 
	print("[daily_planner] drop_data has run")
