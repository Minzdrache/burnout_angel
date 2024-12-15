extends ColorRect
class_name Draggable

var id: int
var label: String
# true once we've been dropped on target
var dropped_on_target: bool = false

func _ready() -> void:
	add_to_group("DRAGGABLE")
	$Label.text = label
	
func _get_drag_data(at_position: Vector2):
	print("[Draggable] get_drag_data has run")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		return self

func _on_item_dropped_on_target(draggable):
	print("[Draggable] Signal item_dropped_on_target received")
	if draggable.get("id") != id: 
		return 
		print("[Dragagble] Ive been dropped, removing myself from source container")
		queue_free()
		
func _get_preview_control() -> Control:
	"""
	The preview control must not be in the scene tree. You schould not free the control, 
	and you should not keep a reference to the control beyond the duration of the drag. 
	It will be deleted automatically after the drag has ended.
	"""
	var preview = ColorRect.new()
	preview.size = size
	var preview_color = color
	preview_color.a = .5
	preview.color = preview_color
	preview.set_rotation(.1)
	return preview
	
