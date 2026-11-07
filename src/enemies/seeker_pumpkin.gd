extends CharacterBody2D

var direction = Vector2.RIGHT

var knockback_dir = 1

@onready var animatedsprite = $AnimatedSprite2D
@onready var hurtbox = $hurtbox
@onready var timer = $Timer
@onready var spritetimer = $SpriteTimer
@onready var marker2d = $Marker2D
@onready var animationplayer = $AnimationPlayer

@onready var projectile = preload("res://src/enemies/seeker_pumpkin_projectile.tscn")
