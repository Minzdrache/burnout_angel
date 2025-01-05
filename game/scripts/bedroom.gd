extends Node2D

#start with dialouge triggers
var started = false

func _ready():
	if started == false:
		started = true
		Dialogic.start("000triggers")

func _on_next_activity_pressed() -> void:
	ActivitiesManager.load_next_activity()
	
