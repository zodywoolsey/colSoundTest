extends RigidBody3D

var State : PhysicsDirectBodyState3D
@onready var audio_stream_player_3d = $AudioStreamPlayer3D

func _ready():
	body_entered.connect(func(body):
		print('col body: ',body)
		print('velocity: ',linear_velocity)
		if linear_velocity.length()>.1:
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
		)

func _integrate_forces(state):
	State = state
