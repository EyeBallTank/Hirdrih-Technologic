extends CharacterBody2D

var push = false
var direction = 0

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
	if push:
		velocity.x = direction*delta*500
	else:
		velocity.x = 0
	move_and_slide()

func _on_left_side_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		direction = 1
		push = true

func _on_left_side_body_exited(body: Node2D) -> void:
	if body.name == "PlayerTest":
		direction = 0
		push = false

func _on_right_side_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		direction = -1
		push = true

func _on_right_side_body_exited(body: Node2D) -> void:
	if body.name == "PlayerTest":
		direction = 0
		push = false
