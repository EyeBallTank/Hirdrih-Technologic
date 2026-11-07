extends CharacterBody2D



@onready var animationplayer = $AnimationPlayer


func _ready():
	animationplayer.play("RESET")


func die():
	queue_free()
