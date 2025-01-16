extends ProgressBar

var progress: int

# sets the value to the value for health saved in the stats_manager
func _ready():
	#connect("mouse_entered", _on_mouse_entered)
	#connect("mouse_exited", _on_mouse_exited)
	set_value(progress)
	
func _process(_delta: float) -> void:
	progress = StatsManager.stats["willpower"]
	self.value = progress
	
func _on_mouse_entered() -> void:
	#$Label.show()
	pass
func _on_mouse_exited() -> void:
	#$Label.hide()
	pass
