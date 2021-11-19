extends Area2D

export var unlockable_name = ""

func _on_Unlockable_body_entered(body):
	if (body.name == "Player"):
		match(unlockable_name):
			"jump":
				Global.can_player_jump = true
			"double_jump":
				Global.can_player_double_jump = true
			"attack":
				Global.can_player_attack = true
	queue_free()
