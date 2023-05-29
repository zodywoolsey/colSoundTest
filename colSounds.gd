extends RigidBody3D

var State : PhysicsDirectBodyState3D
@onready var audio_stream_player_3d = $AudioStreamPlayer3D

func _ready():
	body_entered.connect(func(body):
		print('col body: ',body)
		print('velocity: ',linear_velocity)
		if linear_velocity.length()>.0:
			audio_stream_player_3d.volume_db = (linear_velocity.length()*100.0)-20.0
			audio_stream_player_3d.play()
		for i in range(State.get_contact_count()):
			print('state:')
			print("get_constant_force: ",State.get_constant_force())
			print("get_constant_torque: ",State.get_constant_torque())
			print("get_contact_collider: ",State.get_contact_collider(i))
			print("get_contact_collider_id: ",State.get_contact_collider_id(i))
			print("get_contact_collider_object: ",State.get_contact_collider_object(i))
			print("get_contact_collider_position: ",State.get_contact_collider_position(i))
			print("get_contact_collider_shape: ",State.get_contact_collider_shape(i))
			print("get_contact_collider_velocity_at_position: ",State.get_contact_collider_velocity_at_position(i))
			print("get_contact_count: ",State.get_contact_count())
			print("get_contact_impulse: ",State.get_contact_impulse(i))
			print("get_contact_local_normal: ",State.get_contact_local_normal(i))
			print("get_contact_local_position: ",State.get_contact_local_position(i))
			print("get_contact_local_shape: ",State.get_contact_local_shape(i))
			print("get_space_state: ",State.get_space_state())
			print("get_velocity_at_local_position: ",State.get_velocity_at_local_position(Vector3(0,0,0)))
			print("\n")
		print(linear_velocity.length())
		)

func _integrate_forces(state):
	State = state

func _physics_process(delta):
	if Input.is_key_pressed(KEY_R):
		global_position = Vector3(0,4.5,0)
		linear_velocity = Vector3()
		angular_velocity = Vector3()
	if Input.is_action_just_pressed("ui_accept"):
		apply_central_impulse(Vector3.UP*4.0)
	var input_dir = Input.get_vector("ui_left","ui_right","ui_down","ui_up")*10
	apply_central_force(Vector3(input_dir.x,0.0,-input_dir.y))
	apply_torque(Vector3(input_dir.x/20.0,0.0,-input_dir.y/20.0))
		
		
		
		
		
