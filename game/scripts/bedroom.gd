extends Node2D

#start with dialouge triggers

func _ready():
	if ActivitiesManager.timelines_started == false:
		ActivitiesManager.timelines_started = true
		Dialogic.start("000triggers")

func _on_next_activity_pressed() -> void:
	ActivitiesManager.load_next_activity()
	
