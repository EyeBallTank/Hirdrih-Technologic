extends Area2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("NORMAL")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		animation.play("CLICKED")
		Signals.blue_button_was_pressed.emit()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("trueclickablearea"):
		animation.play("CLICKED")
		Signals.blue_button_was_pressed.emit()
