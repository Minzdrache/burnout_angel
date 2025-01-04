extends Node2D
@onready var info_label = $stat_changes_info/Label

var activity_info = {
	"normal": "Mood: +5, Health: -2",
	"doctor": "Willpower: -4, Health: +5"
}
var test_text = ActivitiesManager.get_activities()

# if draggable_name = test_text.label print test_text.stat_changes 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
