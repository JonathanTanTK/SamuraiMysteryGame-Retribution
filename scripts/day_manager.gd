extends Node

var conversations = 5
var day = 0
signal call_fade
var current_scene = null
#@onready var level2 = preload("res://scenes/level2.tscn").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print(current_scene)

func dialogic_signal(arg: String):
	if arg == "consume_energy":
		conversations -= 1
	if conversations == 0:
		change_day()
		print("Day ", day, " has started. Actions have been reset.")

func change_day():
	conversations = 5;
	day+= 1
	print("changing to day " + str(day))
	if day == 1:
		FadeTransition.fade_and_reload_scene()
		await FadeTransition.on_transition_finished
		#get_tree().change_scene_to_file("res://scenes/level2.tscn")
		call_deferred("deferred_switch_scene", "res://scenes/level2.tscn")
	elif day == 2:
		#get_tree().change_scene_to_file("res://scenes/day3.tscn")
		call_deferred("deferred_switch_scene", "res://scenes/day3.tscn")
	elif day == 3:
		#judgement scene
		#get_tree().change_scene_to_file("res://scenes/court.tscn")
		call_deferred("deferred_switch_scene", "res://scenes/court.tscn")
		Dialogic.start("Judge_Courtoom")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func deferred_switch_scene(scene):
	print("changing scene")
	#current_scene.queue_free()
	#var s = load(scene)
	#current_scene = s.instantiate()
	#get_tree().root.add_child(current_scene)
	#get_tree().current_scene = current_scene
	get_tree().paused = false
	get_tree().change_scene_to_file(scene)
	#get_tree().reload_current_scene()
	#set_process(true)
	print("changed scene")
