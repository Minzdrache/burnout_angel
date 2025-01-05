extends ProgressBar
class_name willpower_bar

var progress = StatsManager.stats["health"]

# sets the value to the value for health saved in the stats_manager
func _ready():
	#connect("mouse_entered", _on_mouse_entered)
	#connect("mouse_exited", _on_mouse_exited)
	set_value(progress)
	

func _on_mouse_entered() -> void:
	$Label.show()
	
func _on_mouse_exited() -> void:
	$Label.hide()
