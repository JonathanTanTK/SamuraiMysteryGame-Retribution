extends CanvasLayer
var color_rect
var animation_player

signal on_transition_finished

func fade_and_reload_scene():
	color_rect.visible = true
	# Play the fade-in animation
	animation_player.play("fade_to_black")
	
func fade_and_reload_deathscene():
	color_rect.visible = true
	# Play the fade-in animation
	animation_player.play("fade_to_blackdeath")

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_children())
	var children = get_children()
	color_rect = children[0]
	animation_player = children[1]
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_blackdeath":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
