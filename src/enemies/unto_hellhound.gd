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
	velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	match state:
		MOVE:
			animatedsprite.play("moving")
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
			pass



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
