extends Area2D

@onready var animation = $AnimationPlayer

@onready var animatedsprite = $AnimatedSprite2D
@export var spritename = "default"

func _ready() -> void:
	animatedsprite.play(spritename)
	animation.play("defaultstate")


func _process(delta: float) -> void:
	pass

func die():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		body.redkey = true
		body.hasredkey_indicator.play("yes")
		animation.play("caught")
