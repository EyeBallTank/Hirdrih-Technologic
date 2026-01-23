extends Control

@onready var animationplayer = $AnimationPlayer
var textboxisup = false


func _ready() -> void:
	get_tree().paused = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("activatemouse"):
		animationplayer.play("showbox")
	if Input.is_action_just_pressed("shoot"):
		animationplayer.play_backwards("showbox")


func _on_quit_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/art_gallery_main.tscn")


func _on_pt_lang_button_pressed() -> void:
	TranslationServer.set_locale("pt")

func _on_en_lang_button_pressed() -> void:
	TranslationServer.set_locale("en")
