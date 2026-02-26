extends Area2D

@onready var textbox = $CanvasLayer/NinePatchRect
@onready var textboxdialogue = $CanvasLayer/NinePatchRect/Label2
@onready var sprite = $Sprite

@export var customtext = "HIRDRIH_TUTORIAL_TEXT_1"
@export var customsprite = "hirdrihbox"

func _ready() -> void:
	textbox.visible = false
	textboxdialogue.text = customtext
	sprite.play("hirdrihbox")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		textbox.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playergroup"):
		textbox.visible = false
