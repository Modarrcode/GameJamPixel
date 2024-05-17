extends CharacterBody2D

const MOTION_SPEED = 160 # Pixels/second.
var isJumping = false
var dying = false;
@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
@export var respawnCoordinates: Vector2


func _physics_process(_delta):
	if(!dying):
		var motion = Vector2()
		motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		motion.y /= 2
		motion = motion.normalized() * MOTION_SPEED
		#warning-ignore:return_value_discarded
		set_velocity(motion)
		move_and_slide()
		#for i in get_slide_collision_count():
			#var collision = get_slide_collision(i)
			#print("I collided with ", collision.get_collider().name)
		#if test:
			#print(test)
			#print(get_last_slide_collision().get_collider_id())
			#print("hmmm")
		inputHandler()
		handleAnimations(motion)

func handleAnimations(motion):
	if(motion == Vector2.ZERO):
		animationPlayer.play("player_idle")
	else:
		animationPlayer.play("run")
		
func inputHandler():
	if(Input.is_action_pressed("ui_accept") && !isJumping):
		jump()

func jump():
	isJumping = true;
	$CollisionShape2D.disabled = true;
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "position", Vector2(0, -100), .35)
	tween.tween_property(sprite, "position", Vector2(0, 0), .35)
	await get_tree().create_timer(.7).timeout
	isJumping = false
	$CollisionShape2D.disabled = false;

#signals
func _on_kill_area_in_death_area():
	dying = true;
	animationPlayer.stop()
	sprite.modulate = Color.RED
	await get_tree().create_timer(1).timeout
	sprite.modulate = Color.WHITE
	self.position = respawnCoordinates;
	dying = false
	print("die, gameover, death animation, what have you")
	pass # Replace with function body.
