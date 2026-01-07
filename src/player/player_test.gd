extends CharacterBody2D
class_name PlayerController
#BTW  a lot of this code was taken from a GitHub project by PaperMouseGames
@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -35.0
var direction = 0

var redkey = false
var bluekey = false
var yellowkey = false

enum {MAINSTATE, CLIMB, PUSH, ARROW, DEAD}
#PUSH, CLIMB, MOUSEACTIVE, PROJECTILE

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _input(event):
	# Handle jump.

var state = MAINSTATE

func _physics_process(delta):
	match state:
		MAINSTATE:
			# Add the gravity.
			if not is_on_floor():
				velocity.y += gravity * delta


			if Input.is_action_pressed("jump") and is_on_floor():
				velocity.y = jump_power * jump_multiplier
			# Handle jump down
			if Input.is_action_pressed("climbdown"):
				set_collision_mask_value(10, false)
			else:
				set_collision_mask_value(10, true)


			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			direction = Input.get_axis("left", "right")
			#if direction:
			if Input.is_action_pressed("left"):
				velocity.x = direction * speed * speed_multiplier
			elif Input.is_action_pressed("right"):
				velocity.x = direction * -speed * -speed_multiplier
			else:	           
				velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

			move_and_slide()
			
			if Input.is_action_just_pressed("activatemouse"):
				state = ARROW
		CLIMB:
			pass
		PUSH:
			pass
		ARROW:
			if not is_on_floor():
				velocity.y += gravity * delta



			if Input.is_action_just_pressed("activatemouse"):
				state = MAINSTATE
				
		DEAD:
			pass
