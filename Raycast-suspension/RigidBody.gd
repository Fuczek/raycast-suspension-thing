extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0.5

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		linear_velocity += Vector3(0,0,1)*speed
	if Input.is_action_pressed("ui_down"):
		linear_velocity += Vector3(0,0,-1)*speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
