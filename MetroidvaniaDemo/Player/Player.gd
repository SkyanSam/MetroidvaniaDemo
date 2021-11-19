extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000

var velocity = Vector2.ZERO
var remaining_double_jumps = 1
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up") and Global.can_player_jump:
		if (is_on_floor()):
			velocity.y = jump_speed
			remaining_double_jumps = 1 # Reset Double Jumps
		elif (remaining_double_jumps > 0 and Global.can_player_double_jump):
			velocity.y = jump_speed
			remaining_double_jumps -= 1 # Use Double Jump
