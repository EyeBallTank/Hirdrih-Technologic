extends CharacterBody2D

@onready var hurtbox = $Hurtbox
@onready var animatedsprite = $AnimatedSprite2D
@onready var animationplayer = $AnimationPlayer

@export var animationname = "RESET"

func _ready():
	animatedsprite.play("idle")
	animationplayer.play(animationname)

func _physics_process(delta):

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)

func die():
	queue_free()

func pain_is_off():
	hurtbox.set_deferred("monitoring", false)

func pain_is_on():
	hurtbox.set_deferred("monitoring", true)

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerProjectile":
		animationplayer.play("DIE")
