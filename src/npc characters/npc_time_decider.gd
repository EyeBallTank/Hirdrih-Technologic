extends Area2D

@onready var textbox = $CanvasLayer/NinePatchRect
@onready var textboxdialogue = $CanvasLayer/NinePatchRect/Label2
@onready var sprite = $Sprite
@onready var the_name = $CanvasLayer/NameTitle
@onready var portrait = $CanvasLayer/NPCPortrait
@onready var speech_balloon = $NpcSpeechBalloonSprite

var talk_to_me = false

func _ready() -> void:
	textbox.visible = false
	the_name.visible = false
	portrait.visible = false
	speech_balloon.visible = false
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attachtoladder") and talk_to_me == true:
		textbox.visible = true
		the_name.visible = true
		portrait.visible = true
	elif talk_to_me == false:
		textbox.visible = false
		the_name.visible = false
		portrait.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playergroup"):

		speech_balloon.visible = true
		talk_to_me = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playergroup"):

		speech_balloon.visible = false
		talk_to_me = false
