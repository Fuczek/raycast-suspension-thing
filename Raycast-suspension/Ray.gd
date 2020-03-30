extends RayCast


# Declare member variables here. Examples:
export (float) var wheelRadius = 0.33
export (float) var springTravel = 0.2
export (float) var restLength = 0.5
export (float) var springStiffness = 30000
export (float) var damperStiffness = 4000

var maxLength
var minLength
var lastLength
var springLength = 0
var springVelocity = 0
var springForce
var damperForce
var suspensionForce = Vector3()

onready var rb = get_parent()

func _ready():
	minLength = restLength - springTravel
	maxLength = restLength + springTravel
	set_cast_to(Vector3(0,-1*maxLength+wheelRadius,0))
	
func _physics_process(delta):
	if is_colliding():
		lastLength = springLength

		var hitdistance = (global_transform[3].y + get_collision_point().y)

		springLength = hitdistance - wheelRadius
		springLength = clamp(springLength, minLength, maxLength)

		springVelocity = (lastLength - springLength) / delta
		print("vel ", springVelocity)
		springForce = springStiffness * (restLength - springLength)
		damperForce = damperStiffness * springVelocity

		suspensionForce = (springForce + damperForce) * Vector3(0,1,0)
		_integrate_forces(suspensionForce, get_collision_point())
#	else:
#		_integrate_forces(Vector3(0,0,0), get_collision_point())
		
		
func _integrate_forces(force, collision):
	rb.add_force(force, Vector3(translation.x,translation.y,translation.z))
	if force != Vector3(0,0,0):
		print(force)
#		springLength = 
#		print(global_transform[3].y)
#		rb.apply_impulse(Vector3((global_transform[3].x),(global_transform[3].y),(global_transform[3].z)), Vector3(0, 10, 0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
