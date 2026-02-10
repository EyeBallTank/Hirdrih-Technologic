extends CharacterBody2D

@onready var animationplayer = $AnimationPlayer
@onready var hurtbox = $ClickArea
@onready var collisionwhendragged = $CollisionWhenDragged/CollisionShape2D

var push = false
var direction = 0

var canibedragged = false

@export var movement_speed : float = 200
var character_direction : Vector2


enum {NORMAL, DRAGGED}

var state = DRAGGED

func _ready() -> void:
	animationplayer.play("RESET")

func _physics_process(delta: float) -> void:

	match state:
		NORMAL:

			if not is_on_floor():
				velocity += get_gravity() * delta
			if push:
				velocity.x = direction*delta*500
			else:
				velocity.x = 0
			move_and_slide()
			
			if canibedragged == true:
				if Input.is_action_just_released("shoot"):
					animationplayer.play("being_dragged")
			elif canibedragged == false:
				pass
			
			
		DRAGGED:
			character_direction.x = Input.get_axis("left", "right")
			character_direction.y = Input.get_axis("jump", "climbdown")
			character_direction = character_direction.normalized()

			if character_direction:
				velocity = character_direction * movement_speed 
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)

			move_and_slide()

			if Input.is_action_just_released("shoot"):
				animationplayer.play("RESET")

			if Input.is_action_just_pressed("activatemouse"):
				animationplayer.play("RESET")

			#if canibedragged == false:
				#animationplayer.play("RESET")


func be_normal():
	state = NORMAL
	set_collision_mask_value(11, false)
	#collisionwhendragged.disabled = true

func be_dragged():
	state = DRAGGED
	set_collision_mask_value(11, true)
	#collisionwhendragged.disabled = false

func pain_is_off():
	hurtbox.set_deferred("monitoring", false)

func pain_is_on():
	hurtbox.set_deferred("monitoring", true)


func _on_click_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("trueclickablearea"):
		canibedragged = true


func _on_click_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("trueclickablearea"):
		canibedragged = false
