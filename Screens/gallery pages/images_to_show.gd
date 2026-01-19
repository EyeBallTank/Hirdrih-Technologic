extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

@export var movement_speed : float = 500
var character_direction : Vector2

@export var number = 4
var currentFrame: int = 0

var scale_speed = .5
@onready var start_position = global_position

func ready():
	visible = true

func _physics_process(delta):
	character_direction.x = Input.get_axis("left", "right")
	character_direction.y = Input.get_axis("jump", "climbdown")
	character_direction = character_direction.normalized()

	if character_direction:
		velocity = character_direction * movement_speed 
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)

	move_and_slide()

	if Input.is_action_just_pressed("changeimage"):
		currentFrame += 1
		if currentFrame > number:
			currentFrame = 0
		sprite.frame = currentFrame

	if Input.is_action_just_pressed("interact"):
		global_position = start_position
		scale = Vector2(1, 1)

	if Input.is_action_pressed("zgetsbigger"):
		scale -= scale_speed * delta * Vector2(1, 1)
	elif Input.is_action_pressed("xgetssmaller"):
		scale += scale_speed * delta * Vector2(1, 1)
#		print(scale)

	if scale > Vector2(6, 6):
		scale = Vector2(6, 6)
