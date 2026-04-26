extends Area2D

@onready var sprites = $AnimatedSprite2D
@export var spritename = "hirdrih"
@export var nextlevel = "res://Screens/main_menu.tscn"

func _ready() -> void:
	sprites.play(spritename)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		SceneTransition.load_scene(nextlevel)
		#Signals.the_player_won_the_level.emit()
