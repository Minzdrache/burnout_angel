extends ProgressBar

var progress = StatsManager.stats["mood"]

func _ready():
	#connect("mouse_entered", _on_mouse_entered)
	#connect("mouse_exited", _on_mouse_exited)
	set_value(progress)
	

func _on_mouse_entered() -> void:
	$Label.show()
	
func _on_mouse_exited() -> void:
	$Label.hide()
