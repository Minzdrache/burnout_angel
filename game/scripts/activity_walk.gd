extends Node2D

# keeps track of how often the activity gets activated
var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counter += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
