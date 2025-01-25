extends Node2D

#start with dialouge triggers

func _ready():
	if ActivitiesManager.timelines_started == false:
		ActivitiesManager.timelines_started = true
		Dialogic.start("000triggers")
		


# hover over bars -> then hide glow


# when running: after triggers wait for user to click calendar icon


func _on_next_activity_pressed() -> void:
	ActivitiesManager.load_next_activity()
	
