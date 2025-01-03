extends Area2D

var picked_up = false

func _ready():
	set_process(true)  # Ensure `_process` is called every frame

# Detect if the object is clicked anywhere within its CollisionShape2D
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			picked_up = true
		else:
			picked_up = false

func _process(delta):
	if picked_up:
		global_position = get_global_mouse_position()  # Move the object to the mouse position
