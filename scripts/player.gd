extends CharacterBody2D

@export var speed = 200
@export var gravity = 30
@export var jump_force = -500
@onready var sprite = $Sprite2D
@onready var can_move = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DayManager.day == 3:
		can_move = false
	sprite.flip_h = true;
	Dialogic.signal_event.connect(dialogic_signal)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 500:
			velocity.y = 500
			
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jump_force
	
	var horizontal_dir = Input.get_axis("move_left","move_right")
	velocity.x = speed * horizontal_dir
	if can_move:
		if velocity.x > 0:
			sprite.flip_h = true  # Facing right
		elif velocity.x < 0:
			sprite.flip_h = false   # Facing left
		move_and_slide()

func dialogic_signal(arg: String):
		if arg == "last_scene":
			FadeTransition.fade_and_reload_deathscene()
			get_tree().change_scene_to_file("res://scenes/death.tscn")
