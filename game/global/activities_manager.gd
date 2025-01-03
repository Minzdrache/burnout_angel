extends Node
# Global list of activities and their stat impacts
var activities = [
	{"label": "Talk to doctor", "stat_change": {"mood": 5, "willpower": -3}},
	{"label": "Do a self-care routine", "stat_change": {"mood": 10, "willpower": -5}},
	{"label": "Go for a walk", "stat_change": {"mood": 7, "willpower": -2}},
	{"label": "Read a book", "stat_change": {"mood": 3, "willpower": -1}},
	{"label": "Work on a hobby", "stat_change": {"mood": 6, "willpower": -4}}
]
var current_day = 0

var current_activities =  [
	{"label": "Talk to doctor", "stat_change": {"mood": 5, "willpower": -3}},
	{"label": "Do a self-care routine", "stat_change": {"mood": 10, "willpower": -5}},
	{"label": "Go for a walk", "stat_change": {"mood": 7, "willpower": -2}}
	]
# diary that keeps track of the selected activities
# user can write comments for each day (gives extra credit) 
var daily_activities = [
	{"day": 0, "activities": {"morning": "work", "midday": "faint at work", "afternoon": "talk to doctor"}, "comment": ""},
	{"day": 1, "activities": {}, "comment": ""},
	{"day": 2, "activities": {}, "comment": ""}
]


func get_activities() -> Array:
	return activities

func add_activity(label: String, stat_change: Dictionary) -> void:
	activities.append({"label": label, "stat_change": stat_change})


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
