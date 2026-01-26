extends Control

var bolts = Signals.score

@onready var ScoreLabel = $ScoreLabel

func _ready():
# warning-ignore:return_value_discarded
#	Signals.Callable("coin_was_captured", self, "_on_CoinCaptured")
	Signals.coin_was_captured.connect(_on_CoinCaptured)

func _on_CoinCaptured():
	Signals.score += 1
	bolts = Signals.score
	ScoreLabel.text = str(bolts)
#	Signals.emit_signal("score_was_updated")
	Signals.score_was_updated.emit()
	if bolts == 10:
		Signals.score = 0
		bolts = Signals.score
		ScoreLabel.text = str(bolts)
#		Signals.emit_signal("new_life")
		Signals.new_life.emit()

func _physics_process(_delta):
	ScoreLabel.text = str(bolts)
