extends Node2D
@onready var interaction_area: InteractionArea = $InteractionArea
@export var level_change: String
#@onready var player = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	pass # Replace with function body.

func _on_interact():
	# Reset InteractionManager before changing the scene
	#InteractionManager.reset()
	#FadeTransition.fade_and_reload_scene()
	#await FadeTransition.on_transition_finished
	DayManager.change_day()
	InteractionManager.can_interact = true
	InteractionManager.label.show()
	#var player = InteractionManager.get_player()
	#player.can_move = true
	#if DayManager.day == 3:
		#player.can_move = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
