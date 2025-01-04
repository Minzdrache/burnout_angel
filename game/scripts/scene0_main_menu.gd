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
	Dialogic.start("000triggers")


func ended ():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
func DialogicSignal(argument:String):
	if argument =="test":
		print("Signal Received")


func _on_options_pressed() -> void:
	print("Options pressed")


func _on_exit_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()
