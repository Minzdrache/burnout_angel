extends HBoxContainer
# journal
var num_saved: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_display_previous_days()

	# update next activity button?

# Function to display previous days' information
func _display_previous_days() -> void:
	var text_edit = $left/previous_days
	text_edit.text = ""
	for day_data in ActivitiesManager.activities_per_day:
		var day_text = "Day: " + str(day_data["day"]) + "\n"
		day_text += "Activities:\n"
		for activity in day_data["activities"]:
			day_text += "  - " + activity["label"] + "\n"
		
		# Display all journal entries for the day
		day_text += "Journal Entries:\n"
		
		
		if "journal" in day_data:
			for entry in day_data["journal"]:
				day_text += "  - " + entry + "\n"
		else:
			day_text += "  (No journal entries for this day.)\n"
		day_text += "\n"
		text_edit.text += day_text

# Function to save the journal entry for the current day
func _on_save_pressed() -> void:
	# Get the journal entry text from the right TextEdit
	var journal_entry =$right/journal_today.text.strip_edges()
	
	# Validate that the entry is not empty
	if journal_entry == "":
		print("Cannot save an empty journal entry!")
		return
	
	var num_current_day = ActivitiesManager.current_day
	# Find the current day (assume it's the last day in activities_per_day)
	var current_day = ActivitiesManager.activities_per_day[num_current_day]
	print("found current day")
	# Ensure "journal" key exists and is an array
	if not current_day.has("journal"):
		current_day["journal"] = []
	
	# Append the new journal entry
	current_day["journal"].append(journal_entry)
	num_saved += 1
	print("added journal entry")
	# Update the previous days display
	_display_previous_days()
		# Clear the journal entry TextEdit for the next input
	$right/journal_today.text = "Today I am grateful for "
		# Check if the "Next Activity" button can be enabled
	_update_next_activity_button()

# Function to update the "Next Activity" button state
func _update_next_activity_button() -> void:
	# Find the current day
	var num_current_day = ActivitiesManager.current_day
	var current_day = ActivitiesManager.activities_per_day[num_current_day]
	
	# Enable the button only if at least 3 entries exist
	if current_day.has("journal") and num_saved >= 3:
		$"../../next_activity".disabled = false
	else:
		$"../../next_activity".disabled = true


func _on_next_activity_pressed() -> void:
	# reward for writing journal:
	# var stat_changes_journal= {"health": +1, "mood": +2, "willpower": +10, "stress": -3}
	# add activity_journal to the list of activities for today
	#if ActivitiesManager.counter_gratitude == 0: 
		#ActivitiesManager.add_activity_to_day("Write journal", stat_changes_journal, ActivitiesManager.current_day)
		# StatsManager.apply_stat_changes(stat_changes_journal)
	ActivitiesManager.counter_gratitude += 1
	ActivitiesManager.num_todays_activity += 1 
	ActivitiesManager.load_next_activity()
	
