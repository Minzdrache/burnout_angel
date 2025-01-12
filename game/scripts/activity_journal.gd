extends Node2D

# if the introductory dialouge was played, skip it

func _ready() -> void:
	if ActivitiesManager.counter_gratitude > 0:
		pass
	else:
		# play timeline gratitude
		Dialogic.start("104gratitude") 
	# update next activity button?
