extends Container

var draggable_scene: PackedScene 
var drop_target: Node
var draggable_container: VBoxContainer

var draggables = [
	{"id": 1, "label": "one"},
	{"id": 2, "label": "two"},
	{"id": 3, "label": "three"}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	draggable_scene = preload("res://scenes/draggable.tscn")
	drop_target = get_node("../target_button")
	draggable_container = $rows

	# Populate draggables when the scene is ready
	_populate_draggables()

	# Connect the signal properly
	drop_target.connect("item_dropped_on_target", Callable(self, "_on_item_dropped_on_target"))


# Populates the draggable items in the container
func _populate_draggables():
	for draggable in draggables: 
		var drag_item = draggable_scene.instantiate()
		# Ensure drag_item has the correct properties set
		drag_item.id = draggable["id"]
		drag_item.label = draggable["label"]
		draggable_container.add_child(drag_item)

# Called when an item is dropped on the target
func _on_item_dropped_on_target(dropped_item: Node) -> void:
	# Ensure dropped_item is a Draggable (type casting is necessary in Godot)
	var dropped_draggable = dropped_item as Draggable
	if not dropped_draggable:
		return # Exit if the dropped item is not a Draggable

	for drag_item in draggable_container.get_children():
		var current_draggable = drag_item as Draggable
		if current_draggable and current_draggable.id == dropped_draggable.id:
			draggable_container.remove_child(current_draggable)
			current_draggable.queue_free()
			break
