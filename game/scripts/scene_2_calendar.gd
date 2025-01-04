extends Node2D
@onready var info_label = $stat_changes_info/Label
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
func _process(delta: float) -> void:
	pass
	
func _on_start_day_button_pressed():
	print("start_day_button is pressed")
	# load activities
	if ActivitiesManager.todays_activities.size() == 3:
		load_activity(ActivitiesManager.todays_activities[0])
		print("activity: " + str(ActivitiesManager.todays_activities[0]))

# Function to load an activity scene based on the activity label.
func load_activity(activity: Dictionary):
	var activity_label = activity["label"]
	print("load activity: ")
		# Example: Load different scenes based on the activity label.
	match activity_label:
		"Go for a walk":
			get_tree().change_scene_to_file("res://scenes/activity_walk.tscn")
		"Visit doctor":
			get_tree().change_scene_to_file("res://scenes/activity_doctor.tscn")
		"Study":
			get_tree().change_scene_to_file("res://scenes/activity_study.tscn")
		"Yoga":
			get_tree().change_scene_to_file("res://scenes/Yoga.tscn")
		"Meet friends":
			get_tree().change_scene_to_file("res://scenes/MeetFriends.tscn")
		"Cook dinner":
			get_tree().change_scene_to_file("res://scenes/CookDinner.tscn")
		"Work on project":
			get_tree().change_scene_to_file("res://scenes/WorkOnProject.tscn")
		"Take a walk":
			get_tree().change_scene_to_file("res://scenes/TakeAWalk.tscn")
		"Read a book":
			get_tree().change_scene_to_file("res://scenes/ReadABook.tscn")
		_:
			print("Unknown activity: " + activity_label)
