extends Node2D

# keeps track of how often the activity gets activated
var counter: int = ActivitiesManager.counter_walk

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		#Dialogic.signal_event.connect(DialogicSignal)
	if counter == 1:
		Dialogic.start("111walk")
			# load first doctor timeline
	elif counter == 2:
		Dialogic.start("112walk") 
		# load second doctor timeline
	

func _on_go_home_pressed() -> void:
	# evtl. raise stats when walk is done, right now the stats get changed, when they are selected in the calendar
	#StatsManager.stats["willpower"] += 20
	ActivitiesManager.counter_walk += 1
	ActivitiesManager.num_todays_activity += 1
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
