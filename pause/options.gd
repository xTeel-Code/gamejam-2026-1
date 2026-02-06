extends Panel

@onready var fullscreen: CheckButton = $"Audio Control/Label2/Fullscreen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fullscreen.visible()=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
