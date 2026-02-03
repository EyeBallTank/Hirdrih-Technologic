extends CharacterBody2D

#reminder: due to the pickable arrow scene, the magic arrow must be placed
#above leon/otto in the sense that the second collission matches that
#of the player character

#PLANS:
#The magic mouse is a scene under the Player, meaning its future script
#will have to refer to its parent scene at some point.
#It starts off as invisible and with no collision or anything at all, 
#mainly when the Player is not in their "MOUSEACTIVE" state.
#When Leon/Otto are in their "MOUSEACTIVE" state: The magic mouse suddenly appears in the 
#same position as the Player's center point, who is also standing still because the magic mouse is 
#the entity under control.
#With "MOUSEACTIVE", you get to move the arrow up/down/left/eight and click on things to 
#interact with them.
#And even grab pushable objects and drop them.
#But if Leon/Otto quit the "MOUSEACTIVE" state, the magic mouse simply returns to its invisible state.
#The system needs to be worked on.
@onready var sprite = $AnimatedSprite2D
#@export var arrowskin = "res://assets/sprites/play actor/leonarrow.tres"
@export var sprite_frames: SpriteFrames
#res://assets/sprites/play actor/ottoarrow.tres
@onready var areathatclicks = $AreaThatClicks
@onready var animationplayer = $AnimationPlayer


@export var movement_speed : float = 200
var character_direction : Vector2

#@onready var Player = get_parent().get_node("PlayerTest")

enum {UNACTIVE, ACTIVE, DEAD}

#var amiclicking = false
var state = UNACTIVE
var canibeused = false

func ready():
	animationplayer.play("RESET")
	Signals.player_died.connect(_even_arrow_dies)
#	Signals.Callable("playerpickeduparrow", self, "_thearrowworksnow")
#	Signals.playerpickeduparrow.connect(_thearrowworksnow)
	sprite_frames = load("res://assets/sprites/play actor/leonarrow.tres")
	sprite.set_sprite_frames()
	
	#sprite.sprite_frames = load(arrowskin)

func _physics_process(delta):

#	if Player.health <= 0 and Signals.lives == 0:
#		state = DEAD

	match state:
		DEAD:
			canibeused = false
			visible = false
		
		UNACTIVE:
			visible = false
			if Input.is_action_just_pressed("activatemouse") and canibeused == true:
				state = ACTIVE
			elif Input.is_action_just_pressed("activatemouse") and canibeused == false:
				pass

		ACTIVE:
			sprite.play("basicmouse")
			#clicking_is_off()
			visible = true
			
			character_direction.x = Input.get_axis("left", "right")
			character_direction.y = Input.get_axis("jump", "climbdown")
			character_direction = character_direction.normalized()

			if character_direction:
				velocity = character_direction * movement_speed 
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)

			move_and_slide()
			if Input.is_action_pressed("shoot"):
				sprite.play("clickedmouse")
				animationplayer.play("clicking")
				#clicking_is_on()
				#amiclicking = true

			if Input.is_action_just_released("shoot"):
				animationplayer.play("RESET")

#E makes Leon and Otto shoot a projectile while the arrows click with E
			
			if Input.is_action_just_pressed("activatemouse"):
					state = UNACTIVE

#func _thearrowworksnow():
#	state = UNACTIVE

func clicking_is_off():
	areathatclicks.set_deferred("monitoring", false)

func clicking_is_on():
	areathatclicks.set_deferred("monitoring", true)

func _even_arrow_dies():
	state = DEAD

func _on_can_arrow_be_selected_area_entered(area: Area2D) -> void:
	if area.name == "PickableArrow":
		canibeused = true
