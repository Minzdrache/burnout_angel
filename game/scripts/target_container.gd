extends Container
class_name target_container

signal item_dropped_on_target(draggable)

var draggable_scene: PackedScene = preload("res://scenes/draggable.tscn")
var draggable_container: VBoxContainer

func _ready() -> void:
	draggable_container = $rows  # Ensure this matches your scene structure

	if draggable_container == null:
		print("[Error] Failed to find 'rows' node in target_container. Check your scene tree!")
		return
	print("[target_container] draggable_container initialized successfully: ", draggable_container)

func _can_drop_data(_position: Vector2, data) -> bool:
	# Validate the data
	var can_drop: bool = data is Dictionary and "label" in data
	print("[target_container] _can_drop_data has run, returning: %s" % can_drop)
	return can_drop
	
func _drop_data(_position: Vector2, data: Variant) -> void:
	# Check if the current day already has 3 activities
	var current_day_activities = ActivitiesManager.get_activities_per_day()[ActivitiesManager.current_day]["activities"]
	if current_day_activities.size() >= 3:
		print("[target_container] Cannot add more than 3 activities for Day %d." % ActivitiesManager.current_day)
		return
	if draggable_container == null:
		print("[Error] Cannot add child; draggable_container is null.")
		return

	# Validate that the data is the correct type (Dictionary)
	if not typeof(data) == TYPE_DICTIONARY:
		print("[Error] Received data is not a Dictionary:", data)
		return
	print("[target_container] _drop_data has run. Data received: ", data)

	# Create a new draggable instance for the dropped item
	var draggable_copy = draggable_scene.instantiate()

	# Set properties of the new draggable using data received
	draggable_copy.label = data["label"]
	draggable_copy.stat_change = data.get("stat_change", {})  # Set stat_change if available

	# Add the new draggable to the target container
	draggable_container.add_child(draggable_copy)
	draggable_copy.add_to_group("DRAGGABLE")

	# Emit the signal with the draggable instance
	emit_signal("item_dropped_on_target", draggable_copy)

	# Now, add the activity to the current day's list and update stats
	if data.has("stat_change"):
		ActivitiesManager.add_activity_to_day(data["label"], data["stat_change"], ActivitiesManager.current_day)
		print("[target_container] Activity saved to day %d: %s" % [ActivitiesManager.current_day, data["label"]])
		
		# Apply stat changes using the singleton StatsManager
		StatsManager.apply_stat_changes(data["stat_change"])
		print("[target_container] Stats updated: Mood = %d, Willpower = %d, Stress = %d, Health = %d" % [StatsManager.stats["mood"], 
			StatsManager.stats["willpower"], StatsManager.stats["stress"], StatsManager.stats["health"]])
