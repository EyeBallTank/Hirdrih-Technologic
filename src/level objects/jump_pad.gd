extends Area2D

@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("NORMAL")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		sprite.play("JUMPED ON")
		body.velocity.y = -550
		#body.move_and_slide(body.velocity)
