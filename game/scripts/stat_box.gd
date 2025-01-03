extends Sprite2D

var health
var mood
var willpower
var level
var stress
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	PlayerStats.leveled_up.connect(_update_stats)

	_update_stats()

func _update_stats():
	var playerStats = playerStats.get_player_stats()
	level = playerStats["level"]
	health = playerStats["health"]
	mood = playerStats["mood"]
	willpower  = playerStats["willpower"]
	stress = playerStats["stress"]
