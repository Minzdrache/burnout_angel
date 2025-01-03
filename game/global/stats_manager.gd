# stats_manager is an autoload singleton
extends Node

# Player stats
var stats = {
	"health": 30,
	"mood": 50,       
	"willpower": 50,
	"stress": 60
}

# Updates stats based on a stat_change dictionary
func apply_stat_changes(stat_change: Dictionary) -> void:
	for stat in stat_change.keys():
		if stats.has(stat):
			stats[stat] += stat_change[stat]
			stats[stat] = clamp(stats[stat], 0, 100)  # Clamp between 0 and 100
