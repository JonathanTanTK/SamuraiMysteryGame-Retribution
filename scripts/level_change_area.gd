extends Node2D
@onready var interaction_area: InteractionArea = $InteractionArea
@export var level_change: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	pass # Replace with function body.

func _on_interact():
	FadeTransition.fade_and_reload_scene()
	await FadeTransition.on_transition_finished
	print("changing")
	get_tree().change_scene_to_file(level_change);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
