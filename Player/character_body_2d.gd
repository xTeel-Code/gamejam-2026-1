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
		jump_counter = 0
		height_before_land = position.y
		fall = heigt_before_jump - height_before_land
		heigt_before_jump = position.y
		if fall < -500:
			$"../Healthbar2".Damage(start_position)
	if not is_on_floor():
		velocity += get_gravity() * delta
		if Input.is_action_just_pressed("ui_accept") and jump_counter < 0:
			velocity.y = JUMP_VELOCITY
			jump_sfx.play()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
	if Input.is_action_just_pressed("ui_accept") and jump_counter == 0 and is_on_floor() == false:
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
		jump_counter += 1
	var direction := Input.get_axis("ui_left", "ui_right")
# 1. OTÁČANIE SPRITU (vždy funguje)
	if direction != 0:
		$AnimatedSprite2D.flip_h = (direction < 0)
		$CollisionShape2D.position.x *= direction
		
	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("jump") 
			$AnimatedSprite2D.set_frame(1) 
	else:
		if direction != 0:
			$AnimatedSprite2D.play("run")
			velocity.x = direction * SPEED
		else:
			$AnimatedSprite2D.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if direction != 0 and is_on_floor() and not run_sfx.playing:
			run_sfx.play()

	
	move_and_slide()
