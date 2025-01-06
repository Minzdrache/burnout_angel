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
			var stat_copy = stats[stat]
			if (stat_copy > 0) && (stat_copy <= 100):
				stats[stat] = stat_copy
			elif stat_copy < 0:
				stats[stat] = max(0, stat_copy)
			elif stat_copy > 100:
					stats[stat] = min(stat_copy, 100)
			# stats[stat] = clamp(stats[stat], 0, 100)  # Clamp between 0 and 100

func get_xp(experience_points: int):
	experience += experience_points
