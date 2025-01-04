extends ProgressBar

var progress = StatsManager.stats["stress"]

func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	set_value(progress)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	$Label.show()
	
func _on_mouse_exited() -> void:
	$Label.hide()
