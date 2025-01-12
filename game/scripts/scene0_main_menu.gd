extends Control
# main menu

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	print("Start pressed")
	# reset all variables
	ActivitiesManager.reset_stats()
	StatsManager.reset_stats()
	
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
	
func ended ():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
func DialogicSignal(argument:String):
	if argument =="test":
		print("Signal Received")

func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene02_help.tscn")
	print("Help pressed")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene02_credits.tscn")
	print("Credits pressed")
	
func _on_exit_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()
