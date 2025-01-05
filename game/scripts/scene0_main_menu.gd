extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
	
func ended ():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
func DialogicSignal(argument:String):
	if argument =="test":
		print("Signal Received")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene02_options.tscn")
	print("Options pressed")


func _on_exit_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()
