# add_activity_test button
extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed() -> void:
		ActivitiesManager.add_activity("meditation",{"mood": 8, "willpower": -4} )
		print(ActivitiesManager.get_activities())
