extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var TweenNode = $Tween
onready var Cam = $Camera
onready var rb = $RigidBody
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	TweenNode.interpolate_property(Cam, "translation", Vector3(0,5,0), Vector3(0,10,30),  0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	TweenNode.interpolate_property(Cam, "rotation_degrees", Vector3(0,0,0), Vector3(0,0,90),  0.2, Tween.TRANS_LINEAR)
	TweenNode.start()


func _on_Button2_pressed():
	rb.apply_impulse(Vector3(0,0,0), Vector3(0,10,0))
