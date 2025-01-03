extends Button

signal item_dropped_on_target(draggable)
var draggable: PackedScene = preload("res://scenes/draggable.tscn")
var draggable_scene: PackedScene 

var draggable_container: VBoxContainer
func _ready() -> void:
	draggable_scene = preload("res://scenes/draggable.tscn")
	draggable_container = $rows

func _can_drop_data(position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[target_button] can_drop_data has run, returning %s" % can_drop)
	return can_drop
	
func _drop_data(position:Vector2, data) -> void: 
	print("[target_button] drop_data has run") 
	print("[Targetcontainer] Emitting signal: item_dropped_on_target")
	#var draggable_copy: ColorRect = draggable.instance()
	#draggable_copy.id = data.id
	#draggable_copy.label = data.label
	#draggable_copy.dropped_on_targed = true data
	
