extends Node2D

var counter: int = ActivitiesManager.counter_self_care

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ActivitiesManager.counter_self_care += 1 
	# only load intro dialouge if it was never called
	if counter < 2:
		Dialogic.start("103mindfulness")
			# load first doctor timeline
		
		
func _on_next_activity_pressed() -> void:
	ActivitiesManager.load_next_activity()
	
	
