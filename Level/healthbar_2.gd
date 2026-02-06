extends AnimatedSprite2D
var i = 0
func Damage(StartPosition):
	if i == 12:
		pass
	i+=2
	set_frame(i)
	$"../Player".global_position = StartPosition
	
