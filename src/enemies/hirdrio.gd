extends CharacterBody2D

@onready var hurtbox = $Hurtbox
@onready var animatedsprite = $AnimatedSprite2D
@onready var animationplayer = $AnimationPlayer

@export var animationname = "RESET"

const SPEED := 1.0

func _ready():
	animatedsprite.play("idle")
	animationplayer.play(animationname)
	velocity = Vector2(-SPEED, 1)

func _physics_process(delta):
	var col = move_and_collide(velocity)
	if col:
		var normal := col.get_normal()
		velocity = velocity.bounce(normal)

	#var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
		#velocity = velocity.bounce(collision_info.normal)

func die():
	queue_free()

func pain_is_off():
	hurtbox.set_deferred("monitoring", false)

func pain_is_on():
	hurtbox.set_deferred("monitoring", true)

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerProjectile":
		animationplayer.play("DIE")


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerProjectileHitbox"):
		animationplayer.play("DIE")
