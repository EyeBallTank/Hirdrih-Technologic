extends CharacterBody2D

var direction = Vector2.RIGHT

var knockback_dir = 1

@onready var animatedsprite = $AnimatedSprite2D
@onready var hurtbox = $hurtbox
@onready var timer = $Timer
@onready var spritetimer = $SpriteTimer
@onready var marker2d = $Marker2D
@onready var animationplayer = $AnimationPlayer

@onready var eyesraycast = $Eyes
@onready var floorraycast = $FloorDetect


@onready var projectile = preload("res://src/enemies/hellhound_shockwave.tscn")

@export var jump_power = 10.0
var jump_multiplier = -35.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canmove = true
@export var speed = 10.0
var speed_multiplier = 30.0

enum {MOVE, ATTACK, DEAD}

var state = MOVE

func _ready():
	animatedsprite.play("moving")
	animationplayer.play("RESET")
	timer.start()

func _physics_process(delta):

	match state:
		MOVE:
			animatedsprite.play("moving")
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
			if not is_on_floor():
				velocity.y += gravity * delta
			move_and_slide()
		
			if canmove == true:
				var found_wall = is_on_wall()
				if found_wall:
					direction *= -1
					scale.x = -scale.x
				velocity = direction * 60
				move_and_slide()
				detect_turn_around()
		ATTACK:
			pass
		DEAD:
			animationplayer.play("dead")
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
			if not is_on_floor():
				velocity.y += gravity * delta
			move_and_slide()


func hellhound_jump():
	velocity.y = jump_power * jump_multiplier
	if velocity.y > 0:
		animatedsprite.play("jumpup")
	elif velocity.y > 0:
		animatedsprite.play("slam")

func summon_shockwave():
	var redball = projectile.instantiate()
	get_parent().add_child(redball)
	redball.global_position = marker2d.global_position
	#animationplayer.play("ATTACK")
	#spritetimer.start(0.5)

func see_to_attack():
	if not eyesraycast.is_colliding(): return false
	var collider = eyesraycast.get_collider()
	if not collider.is_in_group("playergroup"): return false
	return true

func detect_turn_around():
	if not floorraycast.is_colliding() and is_on_floor():
		direction *= -1
		scale.x = -scale.x

func die():
	queue_free()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerProjectile":
		#canattack = false
		state = DEAD


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerProjectileHitbox"):
		#canattack = false
		state = DEAD
