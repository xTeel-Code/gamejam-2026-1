extends CharacterBody2D
var health = 1
var has_key = false
const SPEED = 400.0
const JUMP_VELOCITY = -460.0
var jump_counter = 0
var heigt_before_jump = 0
var height_before_land = 0
var fall = 0
var start_position : Vector2

@onready var jump_sfx: AudioStreamPlayer = $jump_sfx
@onready var run_sfx: AudioStreamPlayer = $run_sfx


@onready var key = $"../Key"
func _ready():
	start_position = global_position
func _physics_process(delta: float) -> void:
	if is_on_floor():
		fall = heigt_before_jump - position.y
		if fall < -500:
			$"../Healthbar2".Damage(start_position)
		jump_counter = 0
		heigt_before_jump = position.y
	else:
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sfx.play()
			jump_counter = 1 
		elif jump_counter == 1:
			velocity.y = JUMP_VELOCITY
			jump_sfx.play()
			jump_counter = 2
	var direction := Input.get_axis("ui_left", "ui_right")
	

	if direction != 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = (direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# 5. Animácie a Zvuk
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		if velocity.y > 0: # Ak už padáme
			$AnimatedSprite2D.set_frame(1)
	else:
		if direction != 0:
			$AnimatedSprite2D.play("run")
			if not run_sfx.playing:
				run_sfx.play()
		else:
			$AnimatedSprite2D.play("idle")
			run_sfx.stop() # Zastavíme zvuk behu, ak stojíme

	move_and_slide()
