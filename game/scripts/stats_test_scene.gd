extends Node2D
class_name stats_test_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/number_day.text = str(ActivitiesManager.current_day)
	$HBoxContainer/number_level.text = str(StatsManager.level)
	$HBoxContainer/number_experience.text = str(StatsManager.experience)
	
func _process(_delta: float) -> void:
	if ActivitiesManager.calendar_started == true: 
		$calendar_glow.hide()


func _on_node_2d_pressed() -> void:
	# switch to calendar planning
	print("calendar pressed")
	if $calendar_glow.is_visible_in_tree():
		$calendar_glow.hide()
		print("hide worked")
	# load activity calendar
	ActivitiesManager.calendar_started = true
	get_tree().change_scene_to_file("res://scenes/scene2_calendar.tscn")
