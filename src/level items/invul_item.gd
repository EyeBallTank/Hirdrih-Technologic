extends Area2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("defaultstate")

func die():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest" and body.antivirusison == false:
		body.invincible()
#		body.antivirusison = true
		animation.play("caught")
	elif body.name == "PlayerTest" and body.antivirusison == true:
		pass
