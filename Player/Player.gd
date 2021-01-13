extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var input_vector = Vector2(x, y).normalized()
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > input_vector.y:
			animationPlayer.play("RunRight")
		else:
			animationPlayer.play("RunLeft")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
