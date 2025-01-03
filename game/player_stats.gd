extends Node

signal leveled_up

var health: int = 20
var willpower: int = 10
var mood: int = 15
var stress: int = 50

var level = 1
var exp: int = 0
var requiredExp: int = 50

func get_player_stats():
	return{
		"level": level,
		"health": health,
		"willpower": willpower,
		"mood": mood,
		"stress": stress
	}
func add_exp(newExp):
	exp += newExp
	_check_and_do_level_up()

func _check_and_do_level_up():
	if exp < requiredExp: return
	
	level += 1
	requiredExp += requiredExp * 1.2
	health *= 1.1
	willpower *= 1.1
	mood *= 1.1
	stress *= 0.9
	
	leveled_up.emit()
	
