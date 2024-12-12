extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the button's "pressed" signal to the local method "_on_button_pressed"
	connect("pressed", Callable(self, "_on_button_pressed"))
	#connect("pressed", self, "_on_button_pressed")

# Function to handle the button press and change the scene
func _on_button_pressed() -> void:
	# Change to the desired scene
	FadeTransition.fade_and_reload_scene()
	get_tree().change_scene_to_file("res://scenes/rootgame.tscn")
