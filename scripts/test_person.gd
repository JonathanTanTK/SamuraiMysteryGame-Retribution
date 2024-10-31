extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	#Dialogic.signal_event.connect(dialogic_signal)

func _on_interact():
	Dialogic.start("test_timelines")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
