extends Container
class_name target_container

signal item_dropped_on_target(draggable)

var draggable_scene: PackedScene = preload("res://scenes/draggable.tscn")
var draggable_container: VBoxContainer
var stats_manager: Node

func _ready() -> void:
	draggable_container = $rows  # Ensure this matches your scene structure
	if draggable_container == null:
		print("[Error] Failed to find 'rows' node in target_container. Check your scene tree!")
		return
	print("[Debug] draggable_container initialized successfully: ", draggable_container)

func _can_drop_data(position: Vector2, data) -> bool:
	# Validate the data
	var can_drop: bool = data is Dictionary and "label" in data
	print("[Debug] _can_drop_data has run, returning: %s" % can_drop)
	return can_drop
	
func _drop_data(position: Vector2, data: Variant) -> void:
	if draggable_container == null:
		print("[Error] Cannot add child; draggable_container is null.")
		return

	# Validate that the data is the correct type (Dictionary)
	if not typeof(data) == TYPE_DICTIONARY:
		print("[Error] Received data is not a Dictionary:", data)
		return
	print("[Debug] _drop_data has run. Data received: ", data)

	# Create a new draggable instance for the dropped item
	var draggable_copy = draggable_scene.instantiate()

	# Set properties of the new draggable using data received
	draggable_copy.label = data["label"]
	draggable_copy.stat_change = data.get("stat_change", {})  # Set stat_change if available

	# Add the new draggable to the target container
	draggable_container.add_child(draggable_copy)
	draggable_copy.add_to_group("DRAGGABLE")

	# Emit the signal with the draggable instance
	emit_signal("item_dropped_on_target", draggable_copy)

	if data.has("stat_change"):
		activities_manager.add_activity_to_day(data["label"], data["stat_change"], activities_manager.current_day)
		print("[Debug] Activity saved to day %d: %s" % [activities_manager.current_day, data["label"]])
	
	print(activities_manager.get_activities_per_day)
