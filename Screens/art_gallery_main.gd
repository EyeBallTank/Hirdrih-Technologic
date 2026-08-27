extends Control

func _ready() -> void:
	get_tree().paused = false


func _on_hirdrih_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_01_hirdrih.tscn")

func _on_nortubel_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_06_nortubel.tscn")



func _on_brinkaedea_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_02_brinkaedea.tscn")


func _on_untotern_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_07_untotern.tscn")


func _on_massagcoav_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_05_massagcoav.tscn")


func _on_herrko_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_08_herrko.tscn")


func _on_greklovick_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_09_greklovick.tscn")


func _on_krimbstone_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_03_krimbstone.tscn")


func _on_lahiurn_button_pressed() -> void:
		SceneTransition.load_scene("res://Screens/gallery pages/art_galllery_04_lahiurn.tscn")


func _on_other_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	SceneTransition.load_scene("res://Screens/main_menu.tscn")
