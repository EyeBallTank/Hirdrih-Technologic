extends CharacterBody2D
class_name PlayerController
#BTW  a lot of this code was taken from a GitHub project by PaperMouseGames
@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -35.0
var direction = 0

var health : int = 100

var redkey = false
var bluekey = false
var yellowkey = false

var caniusearrow = false

var ouch = false
var antivirusison = false
@onready var antivirus_sprite = $AntivursShieldSprite
@onready var healthbar = $CanvasLayer/ProgressBar
@onready var hurtcollision = $HurtBox/CollisionShape2D
@onready var hurtboxarea = $HurtBox
@onready var antivirustimer = $AntiVirusTimer
@onready var painanimation = $PainAnimation

@onready var hasredkey_indicator = $CanvasLayer/HasRedKey
@onready var hasbluekey_indicator = $CanvasLayer/HasBlueKey
@onready var hasyellowkey_indicator = $CanvasLayer/HasYellowKey
@onready var hasarrow_indicator = $CanvasLayer/HasArrow

@onready var playersprite = $LeonPixelSpriteTest

@onready var marker2d = $Marker2D
@onready var projectile = preload("res://src/player/player_projectile.tscn")

enum {MAINSTATE, CLIMB, PUSH, ARROW, DEAD}
#PUSH, CLIMB, MOUSEACTIVE, PROJECTILE

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _input(event):
	# Handle jump.

var state = MAINSTATE

func _ready():
	hasredkey_indicator.play("no")
	hasbluekey_indicator.play("no")
	hasyellowkey_indicator.play("no")
	hasarrow_indicator.play("no")
#	antivirustimer.paused = false
	hurtcollision.disabled = false
#	invul_animation.play("RESET")
	antivirus_sprite.visible = false
	healthbar.max_value = health

func _physics_process(delta):
#	if antivirusison == true:
#		antivirustimer.start(2)
#		invincible()
	
	healthbar.value = health
	match state:
		MAINSTATE:
			# Add the gravity.
			if not is_on_floor():
				velocity.y += gravity * delta


			if Input.is_action_pressed("jump") and is_on_floor():
				velocity.y = jump_power * jump_multiplier
			# Handle jump down
#			if Input.is_action_pressed("climbdown"):
#				set_collision_mask_value(10, false)
#			else:
#				set_collision_mask_value(10, true)


			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			direction = Input.get_axis("left", "right")
			#if direction:
			if Input.is_action_pressed("left"):
				velocity.x = direction * speed * speed_multiplier
				playersprite.flip_h = true
			elif Input.is_action_pressed("right"):
				velocity.x = direction * -speed * -speed_multiplier
				playersprite.flip_h = false
			else:
				velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

			move_and_slide()
			
			if Input.is_action_just_pressed("activatemouse") and caniusearrow == true:
				state = ARROW
			elif Input.is_action_just_pressed("activatemouse") and caniusearrow == false:
				pass

			if Input.is_action_just_pressed("shoot"):
				green_attack()


		CLIMB:
			pass
		PUSH:
			pass
		ARROW:
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
			if not is_on_floor():
				velocity.y += gravity * delta
			move_and_slide()



			if Input.is_action_just_pressed("activatemouse"):
				state = MAINSTATE
				
		DEAD:
			
			caniusearrow = false

			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
			if not is_on_floor():
				velocity.y += gravity * delta
			move_and_slide()
			#if Input.is_action_just_pressed("activatemouse") and caniusearrow == false:
				#pass

func receive_damage(attack):
	health -= attack
	if health <= 0 and Signals.lives > 0:
		health = 100
		Signals.lives -= 1
		Signals.life_lost.emit()
	elif health <= 0 and Signals.lives == 0:
		kill_the_arrow()
		state = DEAD
		

func kill_the_arrow():
	#Signals.emit_signal("player_died")
	Signals.player_died.emit()

func invincible():
	antivirustimer.start()
	antivirusison = true
	antivirus_sprite.visible = true
	hurtboxarea.set_deferred("monitoring", false)
	#if antivirustimer.time_left == 0:
		#antivirusison = false
		#antivirus_sprite.visible = true


func _on_hurt_box_area_entered(area: Area2D) -> void:
	#if area.name == "InvulItem" and antivirusison == false:
		#
		#invincible()
	#elif area.name == "InvulItem" and antivirusison == true:
		#pass
		#antivirus_sprite.visible = true
#		invul_animation.play("Invulnerability")
		#pass

	if area.name == "HazardTest" and antivirusison == false:
		if state != DEAD:
			receive_damage(area.hazarddamage)
			painanimation.play("playerhurt")
		elif state == DEAD:
			pass
#want to make sure pain animation stops playing when the player dies
	elif  area.name == "HazardTest" and antivirusison == true:
		pass

	if area.is_in_group("enemyhitbox") and antivirusison == false:
		if state != DEAD:
			receive_damage(5)#guess no custom values from enemies yet
			painanimation.play("playerhurt")
		elif state == DEAD:
			pass
#want to make sure pain animation stops playing when the player dies
	elif area.is_in_group("enemyhitbox") and antivirusison == true:
		pass

func _on_anti_virus_timer_timeout() -> void:
	antivirusison = false
	antivirus_sprite.visible = false
	hurtboxarea.set_deferred("monitoring", true)

func painhappened():
	hurtboxarea.set_deferred("monitoring", false)

func painwillhappenagain():
	hurtboxarea.set_deferred("monitoring", true)

func green_attack():
	var greenball = projectile.instantiate()
	add_child(greenball)
	greenball.global_position = marker2d.global_position

	if playersprite.flip_h == false:
		greenball.velocity.x = greenball.speed * 10

	elif playersprite.flip_h == true:
		greenball.velocity.x = greenball.speed * -10


	#if direction == Vector2.RIGHT:
		#greenball.velocity.x = greenball.speed * 10
	#elif direction == Vector2.LEFT:
		#greenball.velocity.x = greenball.speed * -10
