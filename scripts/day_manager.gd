extends Node

var conversations = 3
var day = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)

func dialogic_signal(arg: String):
	if arg == "consume_energy":
		conversations -= 1
	if conversations == 0:
		conversations = 3
		change_day()
		print("Day ", day, " has started. Actions have been reset.")

func change_day():
	day+= 1
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
