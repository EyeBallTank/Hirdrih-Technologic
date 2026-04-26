extends StaticBody2D

@onready var animation = $AnimationPlayer

@onready var animatedsprite = $AnimatedSprite2D
@export var spritename = "default"

func _ready() -> void:
	animatedsprite.play(spritename)
	animation.play("closed")

func die():
	queue_free()

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		if body.redkey == false:
			pass
		elif body.redkey == true:
			animation.play("open")
