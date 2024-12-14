extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	pass
	# Dialogic.start("000triggers")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	Dialogic.start("000triggers")
	pass
# Called when the node enters the scene tree for the first time.


#func _on_pressed():
	#Dialogic.timeline_ended.connect(ended)
	#Dialogic.start("002first_day")

func ended ():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
func DialogicSignal(argument:String):
	if argument =="test":
		print("Signal Received")
