extends ProgressBar

var progress = stats_manager.stats["willpower"]

# sets the value to the value for health saved in the stats_manager
func _ready():
	set_value(progress)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
