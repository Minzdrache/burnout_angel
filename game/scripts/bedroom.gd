extends Node2D


func _on_next_activity_pressed() -> void:
	# get next activity
	get_tree().change_scene_to_file("res://scenes/stats_test_scene.tscn")
	
