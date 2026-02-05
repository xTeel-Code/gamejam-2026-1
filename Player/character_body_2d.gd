extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -450.0
var jump_counter = 0
var last_resort_jump = 0
func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_counter = 0
	if Input.is_action_just_pressed("ui_accept") and jump_counter == 0 and is_on_floor() == false: 
		velocity.y = JUMP_VELOCITY
		jump_counter += 1
		last_resort_jump = 0
	if !is_on_floor() and velocity.y > -300 and last_resort_jump<1:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			last_resort_jump += 1
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		$Sprite2D.flip_h =true
	elif direction < 0:
		$Sprite2D.flip_h = false
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
