extends Node2D
class_name stats_test_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/number_day.text = str(ActivitiesManager.current_day)
	$HBoxContainer/number_level.text = str(StatsManager.level)
	$HBoxContainer/number_experience.text = str(StatsManager.experience)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_progress_bars()

# Updates the progress bars based on the StatsManager values
func _update_progress_bars() -> void:
	$health_bar.value = StatsManager.stats["health"]
	$mood_bar.value = StatsManager.stats["mood"]
	$willpower_bar.value = StatsManager.stats["willpower"]
	$stress_bar.value = StatsManager.stats["stress"]
