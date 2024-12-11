extends Node

var conversations = 5
var day = 0
signal call_fade
var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)
	update_current_scene()
	print(current_scene)

func update_current_scene():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func get_player() -> Node:
	# Dynamically fetch the player node in the current scene
	return get_tree().get_first_node_in_group("player")

func dialogic_signal(arg: String):
	if arg == "consume_energy":
		conversations -= 1
	if conversations == 0:
		change_day()
		print("Day ", day, " has started. Actions have been reset.")

func change_day():
	conversations = 5
	day += 1
	print("Changing to day " + str(day))
	Dialogic.end_timeline()
	InteractionManager.can_interact = true

	if day == 1:
		FadeTransition.fade_and_reload_scene()
		await FadeTransition.on_transition_finished
		call_deferred("deferred_switch_scene", "res://scenes/level2.tscn")
	elif day == 2:
		FadeTransition.fade_and_reload_scene()
		await FadeTransition.on_transition_finished
		call_deferred("deferred_switch_scene", "res://scenes/day3.tscn")
	elif day == 3:
		FadeTransition.fade_and_reload_scene()
		await FadeTransition.on_transition_finished
		call_deferred("deferred_switch_scene", "res://scenes/court.tscn")
		print("I am here")
		
		# Dynamically fetch the player and disable movement
		var player = get_player()
		if player:
			player.can_move = false

		Dialogic.start("Judge_Courtroom")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func deferred_switch_scene(scene):
	print("Changing scene...")
	get_tree().paused = false
	get_tree().change_scene_to_file(scene)
	update_current_scene()  # Update the current scene reference
	print("Scene changed")
