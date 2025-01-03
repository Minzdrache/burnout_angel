extends Node
# class_name activities_manager
# this class is autoloaded as a singleton ActivitiesManager (different spelling for clear use)

# Global list of activities and their stat impacts
var activities = [
	{"label": "Talk to doctor", "stat_change": {"mood": 5, "willpower": -3}},
	{"label": "Do a self-care routine", "stat_change": {"mood": 10, "willpower": -5}},
	{"label": "Go for a walk", "stat_change": {"mood": 7, "willpower": -2}},
	{"label": "Read a book", "stat_change": {"mood": 3, "willpower": -1}},
	{"label": "Work on a hobby", "stat_change": {"mood": 6, "willpower": -4}}
]
var current_day: int = 1

# List of activities planned for each day
var activities_per_day: Array = [
	{"day": 0, "activities": [{"label": "Work"}, {"label": "Faint at work"}, {"label": "Talk to doctor"}]}
]
func _ready() -> void:
	# Initialize activities_per_day with empty lists for a few days
	for i in range(1, 8): # Example: 7 days
		activities_per_day.append({"day": i, "activities": []})

# Get all available activities
func get_activities() -> Array:
	return activities

func get_activities_per_day() -> Array:
	return activities_per_day
	
# Add a new activity to the global list of activities
func add_activity(label: String, stat_change: Dictionary) -> void:
	activities.append({"label": label, "stat_change": stat_change})

# Add an activity to the corresponding day in activities_per_day
func add_activity_to_day(label: String, stat_change: Dictionary, day: int) -> void:
	for day_entry in activities_per_day:
		if day_entry["day"] == day:
			day_entry["activities"].append({"label": label, "stat_change": stat_change})
			# Print the activities of the current day
			print_activities_for_day(day)
			return
	print("[Error] Day %d not found in activities_per_day." % day)


# Print the activities and stats for the current day
func print_activities_for_day(day: int) -> void:
	# Find activities for the current day
	for day_entry in activities_per_day:
		if day_entry["day"] == day:
			print("[activities_manager] Activities for Day %d:" % day)

			# Print the stats
			print("Stats: Mood = %d, Willpower = %d" % [StatsManager.stats.mood, StatsManager.stats.willpower])
			return
	print("[Error] Day %d not found in activities_per_day." % day)
