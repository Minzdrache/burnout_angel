extends Node2D
# counter counts how many times this scene is called
# 
var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counter += 1
	#Dialogic.signal_event.connect(DialogicSignal)
	if counter < 2:
		Dialogic.start("011doctor")
			# load first doctor timeline
	else:
		Dialogic.start("012doctor") 
		# load second doctor timeline
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("go_home_button is pressed")
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
