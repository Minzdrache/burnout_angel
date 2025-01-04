extends Container

var draggable_scene: PackedScene
var drop_target: Node
var draggable_container: VBoxContainer


func _ready() -> void:
	draggable_scene = preload("res://scenes/draggable.tscn")
	drop_target = get_node("../target_container")
	draggable_container = $rows

	if draggable_container == null:
		print("[Error] Failed to find 'rows' node in source_container. Check your scene tree!")
		return

	print("[source_container] draggable_container initialized successfully: ", draggable_container)

	_populate_draggables()
	drop_target.connect("item_dropped_on_target", Callable(self, "_on_item_dropped_on_target"))

func _populate_draggables():
	if draggable_container == null:
		print("[Error] Cannot populate; draggable_container is null.")
		return
	# get activities from global list
	for activity in ActivitiesManager.activities:
		var drag_item = draggable_scene.instantiate()
		drag_item.label = activity["label"]
		drag_item.stat_change = activity["stat_change"]
		draggable_container.add_child(drag_item)


func _on_item_dropped_on_target(dropped_item: Node) -> void:
	var dropped_draggable = dropped_item as Draggable
	if not dropped_draggable:
		return

	for drag_item in draggable_container.get_children():
		var current_draggable = drag_item as Draggable
		if current_draggable and current_draggable.label == dropped_draggable.label:
			draggable_container.remove_child(current_draggable)
			current_draggable.queue_free()
			break
			


func _on_add_activity_test_pressed() -> void:
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	# display the stat_changes for each draggable
	pass # Replace with function body.
