extends VBoxContainer

var selected_activities = []

func _ready():
	# Initialize empty slots or any defaults
	pass
	
func _can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[daily_planner] can_drop_data has run, returning %s" % can_drop)
	return can_drop
	
func _drop_data(position:Vector2, data) -> void: 
	print("[daily_planner] drop_data has run")
