extends Container

signal item_dropped_on_target(draggable)

var draggable_scene: PackedScene = preload("res://scenes/draggable.tscn")
var draggable_container: VBoxContainer

func _ready() -> void:
	draggable_container = $rows  # Ensure this matches your scene structure
	if draggable_container == null:
		print("[Error] Failed to find 'rows' node in target_container. Check your scene tree!")
		return

	print("[Debug] draggable_container initialized successfully: ", draggable_container)

func _can_drop_data(position: Vector2, data) -> bool:
	# Validate the data
	var can_drop: bool = data is Dictionary and "id" in data and "label" in data
	print("[Debug] _can_drop_data has run, returning: %s" % can_drop)
	return can_drop

func _drop_data(position: Vector2, data) -> void:
	if draggable_container == null:
		print("[Error] Cannot add child; draggable_container is null.")
		return

	print("[Debug] _drop_data has run. Data received: ", data)

	# Create a new draggable instance for the dropped item
	var draggable_copy = draggable_scene.instantiate()
	draggable_copy.id = data["id"]
	draggable_copy.label = data["label"]
	draggable_copy.add_to_group("DRAGGABLE")

	# Add the new draggable to the container
	draggable_container.add_child(draggable_copy)
	emit_signal("item_dropped_on_target", draggable_copy)
