extends Node2D

# if the introductory dialouge was played, skip it

func _ready() -> void:
	
	if ActivitiesManager.counter_gratitude == 0:
		#ActivitiesManager.counter_gratitude += 1
		Dialogic.start("104gratitude") 
	# else:
		# ActivitiesManager.counter_gratitude += 1
