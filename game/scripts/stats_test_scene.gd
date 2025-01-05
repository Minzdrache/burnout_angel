extends Node2D
class_name stats_test_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/number_day.text = str(ActivitiesManager.current_day)
	$HBoxContainer/number_level.text = str(StatsManager.level)
	$HBoxContainer/number_experience.text = str(StatsManager.experience)
