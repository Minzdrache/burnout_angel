extends Node2D
@onready var start_day_button = $start_day

var activity_info = {
	"normal": "Mood: +5, Health: -2",
	"doctor": "Willpower: -4, Health: +5"
}
var test_text = ActivitiesManager.get_activities()

# if draggable_name = test_text.label print test_text.stat_changes 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _on_start_day_pressed() -> void:
	print("start_day_button is pressed")
	# load activities
	if ActivitiesManager.todays_activities.size() == 3:
		ActivitiesManager.load_activity(ActivitiesManager.todays_activities[0])
		print("activity: " + str(ActivitiesManager.todays_activities[0]))
