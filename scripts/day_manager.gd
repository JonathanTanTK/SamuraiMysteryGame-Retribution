extends Node

var conversations = 3
var day = 0
signal call_fade

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
	print(day)
	if day == 1:
		FadeTransition.fade_and_reload_scene()
		await FadeTransition.on_transition_finished
		print("changing")
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
	elif day == 2:
		get_tree().change_scene_to_file("day3.tscn")
	elif day == 3:
		#judgement scene
		get_tree().change_scene_to_file("court.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
