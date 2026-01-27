extends CharacterBody2D


@onready var animationplayer = $AnimationPlayer


var direction = Vector2.RIGHT
#var height = Vector2.UP
var speed = 25

func _ready():
	animationplayer.play("RESET")
	pass

func _physics_process(delta):
	if is_on_wall():
		animationplayer.play("dying")
	move_and_slide()

func die():
	queue_free()
