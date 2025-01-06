extends Node
# class_name activities_manager
# this class is autoloaded as a singleton ActivitiesManager (different spelling for clear use)
var current_day: int = 1

# List of activities planned for each day
var activities_per_day: Array = [
	{"day": 0, "activities": [{"label": "Work"}, {"label": "Faint at work"}, {"label": "Talk to doctor"}], "journal": ["Today I fainted at work and was sent to a doctor."]}
]
# prepopulated for testing
var todays_activities: Array = []
#var todays_activities: Array = [ {"label": "Go for a walk"}, {"label": "Visit doctor"}, {"label": "Study"}]

var num_todays_activity: int = 0 # gets updated when an activity is loaded
# Global list of activities and their stat impacts
var activities = [
	{"label": "Go for a walk", "stat_change": {"health": +20, "mood": +20, "willpower": -20, "stress": -40}},
	{"label": "Study", "stat_change": {"health": +0,"mood": -4, "willpower": -5,  "stress": +10}},
	{"label": "Visit doctor", "stat_change": {"health": +5, "mood": +3, "willpower": -4, "stress": -6}},
	{"label": "Practice mindfulness", "stat_change": {"health": +1, "mood": +4, "willpower": -2, "stress": -7}},
	{"label": "Write journal", "stat_change": {"health": +1, "mood": +4, "willpower": +3, "stress": -7}},
	]

# for testing:
# use for sorting the activities into buckets....
# help user put them in the correct buckets
# each activity gets "correct_bucket" and "is_in_correct_bucket" for checks
# reset bucket selection when somethin is wrong, or enable wrong activities to be moved again???
var all_activities = [
	{"label": "Go for a walk", "stat_change": {"health": +3, "mood": +6, "willpower": -1, "stress": -8}},
	{"label": "Read a book", "stat_change": {"health": +1,"mood": +3, "willpower": +2, "stress": -8}},
	{"label": "Visit doctor", "stat_change": {"health": +5, "mood": +3, "willpower": -4, "stress": -6}},
	{"label": "Practice mindfulness", "stat_change": {"health": +1, "mood": +4, "willpower": +3, "stress": -7}},
	{"label": "Write in a journal", "stat_change": {"health": +4, "mood": +5, "willpower": +2, "stress": -6}},
	{"label": "Socialize with friends", "stat_change": {"health": +1, "mood": +10, "willpower": -2, "stress": -7}},
	{"label": "Go grocery shopping", "stat_change": {"health": +2, "mood": -2, "willpower": -3, "stress": +5}},
	{"label": "Do laundry", "stat_change": {"health": +1, "mood": -1, "willpower": -2, "stress": +3}},
	{"label": "Clean home", "stat_change": {"health": +3, "mood": +4, "willpower": -3, "stress": -4}},
]



func _ready() -> void:
	pass
	# Initialize activities_per_day with empty lists for a few days
	for i in range(1, 2): # Example: 7 days
		activities_per_day.append({"day": i, "activities": []})

# Get all available activities
func get_activities() -> Array:
	return activities
	
# Helper method to find an activity by label
func get_activity_by_label(label: String) -> Dictionary:
	for activity in activities:
		if activity["label"] == label:
			return activity
	return {}  # Return an empty dictionary if not found

func get_activities_per_day() -> Array:
	return activities_per_day
	
# Add a new activity to the global list of activities
func add_activity(label: String, stat_change: Dictionary) -> void:
	# can only add new activities that are unique
	for activity in activities:
		if  label == activity["label"]: 
			print("[Error] activity with label %l not unique" % label) # noch nie bekommen...:/
			return
	activities.append({"label": label, "stat_change": stat_change})
	print("[ActivitiesManager] Activity '%s' added successfully." % label)

# Add an activity to the corresponding day in activities_per_day
func add_activity_to_day(label: String, stat_change: Dictionary, day: int) -> void:
	for day_entry in activities_per_day:
		if day_entry["day"] == day:
			day_entry["activities"].append({"label": label, "stat_change": stat_change})
			day_entry["journal"] = "placeholder"
		 # If the day matches the current day, update todays_activities
			if day == ActivitiesManager.current_day:
				todays_activities = day_entry["activities"]
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
			print(ActivitiesManager.activities_per_day[day])
			# Print the stats
			print("Stats: Mood = %d, Willpower = %d" % [StatsManager.stats.mood, StatsManager.stats.willpower])
			return
	print("[Error] Day %d not found in activities_per_day." % day)

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
		"Write journal":
			get_tree().change_scene_to_file("res://scenes/activity_journal.tscn")
		"Meet friends":
			get_tree().change_scene_to_file("res://scenes/MeetFriends.tscn")
		"Cook dinner":
			get_tree().change_scene_to_file("res://scenes/CookDinner.tscn")
		"Work on project":
			get_tree().change_scene_to_file("res://scenes/WorkOnProject.tscn")
		"Practice mindfulness":
			get_tree().change_scene_to_file("res://scenes/activity_self_care.tscn")
		"Read a book":
			get_tree().change_scene_to_file("res://scenes/ReadABook.tscn")
		_:
			print("Unknown activity: " + activity_label)

func load_next_activity():
	# Check if there are activities left for today
	if todays_activities == []:
		get_tree().change_scene_to_file("res://scenes/scene2_calendar.tscn")
	elif num_todays_activity < len(todays_activities):
		# Get the next activity
		var next_activity = todays_activities[num_todays_activity]
				# Print the activity being loaded for debugging purposes
		print("[ActivitiesManager] Loading activity: " + next_activity["label"])
		# Increment the activity counter
		num_todays_activity += 1
		# Load the corresponding scene for the activity
		load_activity(next_activity)
	else:
		# All activities for today are completed
		print("[ActivitiesManager] All activities for today are completed.")
		# Optionally handle end-of-day logic here
		# Example: Transition to end-of-day summary scene
		get_tree().change_scene_to_file("res://scenes/review_day.tscn")
