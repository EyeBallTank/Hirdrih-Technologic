extends Area2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("defaultstate")

func die():
	queue_free()

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		body.yellowkey = true
		animation.play("caught")
