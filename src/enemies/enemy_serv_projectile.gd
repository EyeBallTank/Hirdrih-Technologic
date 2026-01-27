extends CharacterBody2D

@onready var animationplayer = $AnimationPlayer
@onready var hitbox = $Hitbox

var hazarddamage = 5
var direction = Vector2.RIGHT
#var height = Vector2.UP
var speed = 15

func _ready():
	animationplayer.play("RESET")
	pass

func _physics_process(delta):
	if is_on_wall():
		animationplayer.play("dying")
	move_and_slide()

func die():
	queue_free()

func pain_is_off():
	hitbox.set_deferred("monitoring", false)

func pain_is_on():
	hitbox.set_deferred("monitoring", true)


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		animationplayer.play("dying")
