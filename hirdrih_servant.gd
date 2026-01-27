extends CharacterBody2D

var direction = Vector2.RIGHT

var knockback_dir = 1

@onready var animatedsprite = $AnimatedSprite2D
@onready var hurtbox = $hurtbox
@onready var timer = $Timer
@onready var spritetimer = $SpriteTimer
@onready var marker2d = $Marker2D
@onready var animationplayer = $AnimationPlayer

@onready var projectile = preload("res://src/enemies/enemy_serv_projectile.tscn")

var canattack = true
var canmove = true

enum {MOVE, ATTACK, DEAD}

var state = MOVE

func _ready():
	animatedsprite.play("idle")
	animationplayer.play("RESET")
	timer.start()

func _physics_process(delta):
	match state:
		MOVE:
			if canmove == true:
				var found_wall = is_on_wall()
				if found_wall:
					direction *= -1
				velocity = direction * 60
				move_and_slide()
			elif canmove == false:
				velocity.x = 0
			if timer.time_left == 0:
				if canattack == true:
					canmove = false
					attack()
					timer.start()
				elif canattack == false:
					pass
			if spritetimer.time_left == 0:
				animatedsprite.play("shoot")
				canmove = true
				animatedsprite.play("idle")
		ATTACK:
			pass
		DEAD:
			velocity.x = 0


func attack():
	var redball = projectile.instantiate()
	add_child(redball)
	redball.global_position = marker2d.global_position
	redball.velocity.x = redball.speed * -10
	animatedsprite.play("shoot")
	spritetimer.start(0.5)

func die():
	queue_free()

func pain_is_off():
	hurtbox.set_deferred("monitoring", false)

func pain_is_on():
	hurtbox.set_deferred("monitoring", true)


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerProjectile":
		animationplayer.play("dying")
		canattack = false
		state = DEAD
