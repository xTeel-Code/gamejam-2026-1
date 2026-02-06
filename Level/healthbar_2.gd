extends AnimatedSprite2D
var i = 0
@onready var death: AudioStreamPlayer = $death
func Damage(StartPosition):
	if i == 12:
		pass
	i+=2
	death.play()
	set_frame(i)
	$"../Player".global_position = StartPosition
	
