extends StaticBody2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("closed")

func die():
	queue_free()

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		if body.yellowkey == false:
			pass
		elif body.yellowkey == true:
			animation.play("open")
