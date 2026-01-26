extends Control

var life_count = Signals.lives
@onready var LifeLabelNumber = $LifeLabel

func _ready():
	LifeLabelNumber.text = str(life_count)
#	Signals.Callable("new_life", self, "_life_received")
#	Signals.Callable("life_lost", self, "_lost_a_life")
	Signals.new_life.connect(_life_received)
	Signals.life_lost.connect(_lost_a_life)

func _life_received():
	Signals.lives += 1
	LifeLabelNumber.text = str(life_count)
	life_count = Signals.lives

func _lost_a_life():
	LifeLabelNumber.text = str(life_count)
	life_count = Signals.lives

func _physics_process(_delta):
	LifeLabelNumber.text = str(life_count)
