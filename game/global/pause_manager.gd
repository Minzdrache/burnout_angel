extends Node2D

# pauses the game and gives pause screen (but only when not in dialouge)

var paused: bool = false

func _ready() -> void:
	resume_game()
	
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if !get_tree().paused:
			pause_game()
		else:
			resume_game()

# function to pause the game
func pause_game():
	get_tree().paused = true
	show()

func resume_game():
		hide()
		get_tree().paused = false
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
