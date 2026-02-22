extends Control

@onready var victoryscreen = $VictoryScreen
@onready var loss_screen = $LossScreen
@export var nextlevel = "res://Screens/art_gallery_main.tscn"
@onready var animationplayer = $AnimationPlayer


func _ready() -> void:
	animationplayer.play("RESET")
#	victoryscreen.visible = false
#	loss_screen.visible = false
	Signals.the_player_won_the_level.connect(_Activate_Level_Win_Animation)
	Signals.the_player_lost_the_level.connect(_Activate_Level_Loss_Animation)

func _Activate_Level_Win_Animation():
	get_tree().paused = true
	animationplayer.play("PlayerWon")

func _Activate_Level_Loss_Animation():
	get_tree().paused = true
	animationplayer.play("PlayerLost")


func _on_next_level_button_pressed() -> void:
	SceneTransition.load_scene(nextlevel)


func _on_quit_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/main_menu.tscn")
