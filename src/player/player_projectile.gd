extends CharacterBody2D

@onready var animationplayer = $AnimationPlayer

var direction = Vector2.RIGHT
#var height = Vector2.UP
var speed = 18
@onready var timer = $Timer


func _ready():
	animationplayer.play("RESET")
	timer.start()

func _physics_process(delta):
	if is_on_wall():
		animationplayer.play("dying")
	move_and_slide()
	if timer.time_left == 0:
		animationplayer.play("dying")

func die():
	queue_free()


func _on_player_projectile_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("EnemyHurtboxArea"):
		animationplayer.play("dying")
