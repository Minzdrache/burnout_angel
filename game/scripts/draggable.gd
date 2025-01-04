extends ColorRect
class_name Draggable

var label: String       # Activity name
var stat_change: Dictionary = {}  # Stat changes for this activity
var dropped_on_target: bool = false # true once we've been dropped on target

#not yet working!
var tooltip_scene: PackedScene = preload("res://scenes/tooltip.tscn")  # Reference to the custom tooltip scene

func _ready() -> void:
	add_to_group("DRAGGABLE")
	$Label.text = label
	# set tooltip to display stat_changes
	

func _get_drag_data(_position: Vector2):
	"""
	This function provides data when this item is being dragged.
	"""
	print("[Draggable] _get_drag_data has run")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		# Return a dictionary with label for the target to process
		return {"label": label, "stat_change": stat_change}

func _get_preview_control0() -> Control:
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
	
func _get_preview_control1() -> Control:
	"""
	Returns a visual representation of the draggable item while dragging.
	The preview control must not be in the scene tree.
	"""
	# Create a VBoxContainer to organize the preview content
	var preview_container = VBoxContainer.new()
	preview_container.custom_minimum_size = Vector2(200, 0)  # Optional: Adjust width if needed
	preview_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	# Add the activity label as the first element
	var preview_label = Label.new()
	preview_label.text = label
	preview_label.add_theme_color_override("font_color", Color(1, 1, 1))  # White text
	preview_label.add_theme_font_size_override("font_size", 14)  # Optional: Adjust font size
	#preview_label.set_alignment(Label.ALIGN_CENTER)  # Center-align the label
	preview_container.add_child(preview_label)

	# Add the stat changes below the label
	for stat in stat_change.keys():
		var stat_label = Label.new()
		stat_label.text = "- %s: %d" % [stat.capitalize(), stat_change[stat]]
		stat_label.add_theme_color_override("font_color", Color(1, 1, 1))  # White text
		preview_container.add_child(stat_label)

	# Create a dark green background for the preview
	var background = ColorRect.new()
	background.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	background.size_flags_vertical = Control.SIZE_EXPAND_FILL
	background.color = Color(0.1, 0.3, 0.1, 0.9)  # Dark green with slight transparency
	background.add_child(preview_container)

	return background
	
func _get_preview_control() -> Control:
	"""
	Returns a visual representation of the draggable item while dragging.
	The preview control must not be in the scene tree.
	"""
	# Create a ColorRect to be used as the background for the preview container
	var background_rect = ColorRect.new()
	background_rect.color = Color(0.1, 0.3, 0.1, 1)  # Solid dark green
	background_rect.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	background_rect.size_flags_vertical = Control.SIZE_EXPAND_FILL

	# Create a VBoxContainer to organize the preview content
	var preview_container = VBoxContainer.new()
	preview_container.custom_minimum_size = Vector2(200, 0)  # Optional: Adjust width if needed
	preview_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	preview_container.add_child(background_rect)  # Add the background rect to the container

	# Add the activity label as the first element
	var preview_label = Label.new()
	preview_label.text = label
	preview_label.add_theme_color_override("font_color", Color(1, 1, 1))  # White text
	preview_label.add_theme_font_size_override("font_size", 14)  # Optional: Adjust font size
	#preview_label.set_alignment(Label.ALIGN_CENTER)  # Center-align the label
	preview_container.add_child(preview_label)

	# Add the stat changes below the label
	for stat in stat_change.keys():
		var stat_label = Label.new()
		stat_label.text = "- %s: %d" % [stat.capitalize(), stat_change[stat]]
		stat_label.add_theme_color_override("font_color", Color(1, 1, 1))  # White text
		preview_container.add_child(stat_label)

	# Return the final preview container with the background and labels
	return preview_container
