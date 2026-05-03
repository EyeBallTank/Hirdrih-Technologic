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


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		textbox.visible = true
		the_name.visible = true
		portrait.visible = true
		speech_balloon.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		textbox.visible = false
		the_name.visible = false
		portrait.visible = false
		speech_balloon.visible = false
