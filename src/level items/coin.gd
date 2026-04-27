extends Area2D

@onready var animation = $AnimationPlayer

@onready var animatedsprite = $AnimatedSprite2D
@export var spritename = "default"

func _ready() -> void:
	animatedsprite.play(spritename)
	animation.play("defaultstate")

func die():
	queue_free()

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		if Signals.lives < Signals.max_lives:
#			Signals.emit_signal("coin_was_captured")
			Signals.coin_was_captured.emit()
			animation.play("caught")
