extends Container

var draggable_scene: PackedScene
var drop_target: Node
var draggable_container: VBoxContainer

var draggables = [
	{"id": 1, "label": "one"},
	{"id": 2, "label": "two"},
	{"id": 3, "label": "three"}
]

func _ready() -> void:
	draggable_scene = preload("res://scenes/draggable.tscn")
	drop_target = get_node("../target_container")
	draggable_container = $rows

	if draggable_container == null:
		print("[Error] Failed to find 'rows' node in source_container. Check your scene tree!")
		return

	print("[Debug] draggable_container initialized successfully: ", draggable_container)

	_populate_draggables()
	drop_target.connect("item_dropped_on_target", Callable(self, "_on_item_dropped_on_target"))

func _populate_draggables():
	if draggable_container == null:
		print("[Error] Cannot populate; draggable_container is null.")
		return

	for draggable in draggables:
		var drag_item = draggable_scene.instantiate()
		drag_item.id = draggable["id"]
		drag_item.label = draggable["label"]
		draggable_container.add_child(drag_item)

func _on_item_dropped_on_target(dropped_item: Node) -> void:
	var dropped_draggable = dropped_item as Draggable
	if not dropped_draggable:
		return

	for drag_item in draggable_container.get_children():
		var current_draggable = drag_item as Draggable
		if current_draggable and current_draggable.id == dropped_draggable.id:
			draggable_container.remove_child(current_draggable)
			current_draggable.queue_free()
			break
