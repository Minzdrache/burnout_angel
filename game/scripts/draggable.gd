extends ColorRect
class_name Draggable

var label: String       # Activity name
var stat_change: Dictionary = {}  # Stat changes for this activity

var dropped_on_target: bool = false # true once we've been dropped on target

func _ready() -> void:
	add_to_group("DRAGGABLE")
	$Label.text = label

func _get_drag_data(_position: Vector2):
	"""
	This function provides data when this item is being dragged.
	"""
	print("[Draggable] _get_drag_data has run")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		# Return a dictionary with label for the target to process
		return {"label": label, "stat_change": stat_change}

func _get_preview_control() -> Control:
	"""
	Returns a visual representation of the draggable item while dragging.
	The preview control must not be in the scene tree. 
	"""
	var preview = ColorRect.new()
	preview.size = size
	var preview_color = color
	preview_color.a = 0.5  # Make the preview semi-transparent
	preview.color = preview_color
	# Optional: Add the label as a child of the preview for better representation
	var preview_label = Label.new()
	preview_label.text = label
	preview.add_child(preview_label)
	return preview
