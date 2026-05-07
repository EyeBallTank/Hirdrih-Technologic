extends Area2D

#@onready var textbox = $CanvasLayer/NinePatchRect
#@onready var textboxdialogue = $CanvasLayer/NinePatchRect/Label2
@onready var sprite = $Sprite
#@onready var the_name = $CanvasLayer/NameTitle
#@onready var portrait = $CanvasLayer/NPCPortrait
@onready var speech_balloon = $NpcSpeechBalloonSprite
@onready var animation = $AnimationPlayer

@onready var canvaslayer = $CanvasLayer

@onready var playbuttonnormal = $CanvasLayer/ButtonPlayNormal
@onready var playbuttonbackwards = $CanvasLayer/ButtonPlayBackwards
@onready var playbuttonfaster = $CanvasLayer/ButtonPlayFaster
@onready var playbuttonpause = $CanvasLayer/ButtonPlayPause

var talk_to_me = false

func _ready() -> void:
	#animation.get_animation("Conversation")
	#animation.seek(0)
	animation.set_speed_scale(1.0)
	canvaslayer.visible = false
	speech_balloon.visible = false

func _physics_process(delta: float) -> void:
	if talk_to_me == true and Input.is_action_just_pressed("attachtoladder"):
		canvaslayer.visible = true
		animation.play("Conversation")
		animation.set_speed_scale(1.0)
	elif Input.is_action_just_pressed("zgetsbigger"):
		animation.play_backwards("Conversation")
		animation.set_speed_scale(3.3)
	elif Input.is_action_just_pressed("xgetssmaller"):
		animation.play("Conversation")
		animation.set_speed_scale(3.3)
	elif Input.is_action_just_pressed("changeimage"):
		animation.pause()
		
	elif talk_to_me == false:
		canvaslayer.visible = false

	if Input.is_action_pressed("attachtoladder"):
		playbuttonnormal.play("pressed")
	else:
		playbuttonnormal.play("unpressed")

	if Input.is_action_pressed("zgetsbigger"):
		playbuttonbackwards.play("pressed")
	else:
		playbuttonbackwards.play("unpressed")

	if Input.is_action_pressed("xgetssmaller"):
		playbuttonfaster.play("pressed")
	else:
		playbuttonfaster.play("unpressed")

	if Input.is_action_pressed("changeimage"):
		playbuttonpause.play("pressed")
	else:
		playbuttonpause.play("unpressed")



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		speech_balloon.visible = true
		talk_to_me = true
		animation.seek(0)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		speech_balloon.visible = false
		talk_to_me = false
