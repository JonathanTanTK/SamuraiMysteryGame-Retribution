extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	Dialogic.signal_event.connect(dialogic_signal)

func _on_interact():
	Dialogic.start("bar_owner")

func dialogic_signal(arg: String):
	if arg == "exit_dialog":
		InteractionManager.can_interact = true
		InteractionManager.label.show()
		player.can_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
