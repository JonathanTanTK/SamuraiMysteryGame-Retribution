extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	Dialogic.signal_event.connect(dialogic_signal)

func _on_interact():
	if (DayManager.day == 0):
		Dialogic.start("priest_day1")
	elif (DayManager.day == 1):
		Dialogic.start("priest_day2")
	elif (DayManager.day == 2):
		Dialogic.start("Priest_day3")


func dialogic_signal(arg: String):
	if arg == "exit_dialog":
		InteractionManager.can_interact = true
		InteractionManager.label.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
