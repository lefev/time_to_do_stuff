extends StateMachine


func _ready() -> void:
	add_state("idle")
	add_state("run")
	add_state("jump")
	add_state("fall")
	call_deferred("set_state", states.idle)

func _state_logic(delta):
	parent._handle_movement_input()
	parent._apply_gravity(delta)
	parent._apply_movement()

func _get_transition(delta):
	return null

func _enter_state(new_state, old_state):
	pass

func _exit_state(old_state, new_state):
	pass
