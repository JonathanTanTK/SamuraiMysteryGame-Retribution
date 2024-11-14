extends CanvasLayer
@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer


func fade_and_reload_scene(scene_path: String):
	# Play the fade-in animation
	animation_player.play("fade_to_black")
	
	# Wait for the animation to finish, then reload the scene
	await animation_player

	# Reload or change the scene
	get_tree().change_scene(scene_path)

	# Play the fade-out animation after the scene has loaded
	animation_player.play("fade_from_black")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
