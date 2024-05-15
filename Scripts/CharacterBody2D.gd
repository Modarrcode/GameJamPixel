extends CharacterBody2D

const MOTION_SPEED = 160 # Pixels/second.
@onready var animationPlayer = $AnimationPlayer
@export var respawnCoordinates: Vector2


func _physics_process(_delta):
	var motion = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	#warning-ignore:return_value_discarded
	set_velocity(motion)
	move_and_slide()
	handleAnimations(motion)

func handleAnimations(motion):
	if(motion == Vector2.ZERO):
		animationPlayer.play("player_idle")
	else:
		animationPlayer.play("run")



func _on_kill_area_in_death_area():
	self.position = respawnCoordinates;
	print("die, gameover, death animation, what have you")
	pass # Replace with function body.
