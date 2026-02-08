extends CharacterBody2D

var push = false
var direction = 0

enum {NORMAL, DRAGGED}

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
	if push:
		velocity.x = direction*delta*500
	else:
		velocity.x = 0
	move_and_slide()
