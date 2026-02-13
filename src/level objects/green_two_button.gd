extends Area2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("CLICKED")
	Signals.green_one_button_was_pressed.connect(_Green_Button_Two_Can_Be_Clicked_Again)

func _Green_Button_Two_Can_Be_Clicked_Again():
	animation.play("NORMAL")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		animation.play("CLICKED")
		Signals.green_two_button_was_pressed.emit()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("trueclickablearea"):
		animation.play("CLICKED")
		Signals.green_two_button_was_pressed.emit()
