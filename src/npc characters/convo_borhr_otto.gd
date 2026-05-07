extends Area2D

#@onready var textbox = $CanvasLayer/NinePatchRect
#@onready var textboxdialogue = $CanvasLayer/NinePatchRect/Label2
@onready var sprite = $Sprite
#@onready var the_name = $CanvasLayer/NameTitle
#@onready var portrait = $CanvasLayer/NPCPortrait
@onready var speech_balloon = $NpcSpeechBalloonSprite
@onready var animation = $AnimationPlayer

@onready var canvaslayer = $CanvasLayer


var talk_to_me = false

func _ready() -> void:
	#animation.get_animation("Conversation")
	#animation.seek(0)
	animation.set_speed_scale(1.0)
	canvaslayer.visible = false
	speech_balloon.visible = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attachtoladder") and talk_to_me == true:
		canvaslayer.visible = true
		animation.play("Conversation")
		if Input.is_action_pressed("zgetsbigger"):
			#jump_to_next_keyframe(animationplaything)
			#animation.advance(1)
			animation.pause()
			#animation.seek(+1)
		elif Input.is_action_pressed("xgetssmaller"):
			animation.set_speed_scale(2.5)
		else:
			animation.set_speed_scale(1.0)
			
	elif talk_to_me == false:
		canvaslayer.visible = false



#func jump_to_next_keyframe(animationplaything, track_id := 0) -> void:
	#var animation: Animation = animationplaything.get_animation(animationplaything.current_animation)
	#for key: int in animation.track_get_key_count(track_id):
		#var key_time: float = animation.track_get_key_time(track_id, key)
		#if key_time > animationplaything.current_animation_position:
			#animationplaything.seek(key_time)
			#break

#func jump_to_next_keyframe(track_id := 0) -> void:
	#var animation: Animation = get_animation("Conversation")
	#for key: int in animation.track_get_key_count(track_id):
		#var key_time: float = animation.track_get_key_time(track_id, key)
		#if key_time > current_animation_position:
			#seek(key_time)
			#break

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		speech_balloon.visible = true
		talk_to_me = true
		animation.seek(0)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		speech_balloon.visible = false
		talk_to_me = false
