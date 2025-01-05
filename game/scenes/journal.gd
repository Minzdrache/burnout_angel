extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_display_previous_days()
	# update next activity button?

# Function to display previous days' information
# Function to display previous days' information
func _display_previous_days() -> void:
	# Get the TextEdit node where the data will be displayed
	var text_edit = $left/previous_days 
	# Clear existing text
	text_edit.text = ""
	# Iterate over activities_per_day and format the data
	for day_data in ActivitiesManager.activities_per_day:
		var day_text = "Day: " + str(day_data["day"]) + "\n"
		# Add activities
		day_text += "Activities:\n"
		for activity in day_data["activities"]:
			day_text += "  ~ " + activity["label"] + "\n"
				# Check if "journal" key exists
		if "journal" in day_data:
			day_text += "Journal Entry:\n"
			day_text += "  \"" + day_data["journal"] + "\"\n"
		else:
			day_text += "Journal Entry:\n"
			day_text += "  (No journal entry for this day.)\n"
		day_text += "\n"  # Add spacing between days
		# Append to the TextEdit content
		text_edit.text += day_text
		$right/journal_today.text = "Today I am grateful for "


func _on_save_pressed() -> void:
# Get the journal entry text from the right TextEdit
	var journal_entry =$right/journal_today.text.strip_edges()
	if journal_entry == "":
		print("Cannot save an empty journal entry!")
		return
	# Find the current day (assume it's the last day in activities_per_day)
	var num_current_day = ActivitiesManager.current_day
	
	var current_day = ActivitiesManager.activities_per_day[num_current_day]
	
	# Save the journal entry to the "journal" key
	current_day["journal"] = journal_entry
	print("journal entry saved")
	# Update the previous days display
	_display_previous_days()
	
	# Clear the journal entry TextEdit for the next entry
	$right/journal_today.text = "Today I am grateful for "


func _on_next_activity_pressed() -> void:
	pass # Replace with function body.
