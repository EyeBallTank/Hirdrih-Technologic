extends CharacterBody2D

var direction = Vector2.RIGHT

var knockback_dir = 1

@onready var animatedsprite = $AnimatedSprite2D
@onready var hurtbox = $hurtbox
@onready var timer = $Timer
@onready var spritetimer = $SpriteTimer
@onready var marker2d = $Marker2D
@onready var animationplayer = $AnimationPlayer

@onready var projectile = preload("res://src/enemies/hellhound_shockwave.tscn")

@export var jump_power = 10.0
var jump_multiplier = -35.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum {MOVE, ATTACK, DEAD}

var state = MOVE

func _ready():
	animatedsprite.play("moving")
	animationplayer.play("RESET")
	timer.start()
