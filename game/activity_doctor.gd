extends Node2D
# counter counts how many times this scene is called
# 
var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counter += 1
	#Dialogic.signal_event.connect(DialogicSignal)
	if counter < 2:
		Dialogic.start("000triggers")
			# load first doctor timeline
	else:
		Dialogic.start("002first_day") 
		# load second doctor timeline
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
