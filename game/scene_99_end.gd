extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene0_main_menu.tscn")


func _on_get_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene02_options.tscn")
