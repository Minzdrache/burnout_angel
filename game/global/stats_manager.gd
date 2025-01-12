# stats_manager is an autoload singleton
extends Node

# Player stats
var stats = {
	"health": 30,
	"mood": 50,       
	"willpower": 50,
	"stress": 60
}
var level = 1

var experience = 0
# Updates stats based on a stat_change dictionary

func apply_stat_changes(stat_change: Dictionary) -> void:
	for stat in stat_change.keys():
		if stats.has(stat):
			# Apply the change directly to the stats dictionary
			var new_value = stats[stat] + stat_change[stat]
			print("Current stat value:", stats[stat], " Change:", stat_change[stat])
			# Clamp the new value between 0 and 100
			stats[stat] = clamp(new_value, 0, 100)
			# Debug prints
			print("Updated stat value:", stats[stat])
			
func get_xp(experience_points: int):
	experience += experience_points
	
func reset_stats() -> void: 
	stats["health"] =  30
	stats["willpower"] =  30
	stats["mood"] =  30
	stats["stress"] =  60
	level = 1
	experience = 0
