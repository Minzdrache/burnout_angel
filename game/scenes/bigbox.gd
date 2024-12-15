extends Area2D

var original_color = Color(1, 1, 1)  # Original color of the big box
var highlight_color = Color(0, 1, 0)  # Color when the small box is fully inside
var small_box:Area2D

func _ready():  # get reference to small_box
	small_box = get_node("../calendar_item")
	
	
	
func _process(delta):
	if small_box in get_overlapping_areas():
		if is_fully_inside(small_box):
			$Sprite2D.modulate = highlight_color
			print("Congrats! Small box is fully inside.")
			snap_to_center(small_box)
		else:
			$Sprite2D.modulate = original_color
	else:
		$Sprite2D.modulate = original_color
	
	
func is_fully_inside(area: Area2D) -> bool:
	var big_box_rect = $CollisionShape2D.shape.get_rect()
	var small_box_rect = area.get_node("CollisionShape2D").shape.get_rect()
	return big_box_rect.encloses(small_box_rect.grow(-1))  # Slight tolerance

func snap_to_center(area: Area2D):
	area.global_position = global_position
	
	
func _on_area_exited(area):
	if area.name == "calendar_item":
		# Reset the color when the small box exits the big box
		$Sprite2D.modulate = original_color
