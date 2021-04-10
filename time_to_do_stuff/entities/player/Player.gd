extends KinematicBody2D
class_name Player

enum STATES{GROUND, AIR, WATER}
var current_state = STATES.GROUND

var velocity : Vector2 = Vector2.ZERO
const UP_DIRECTION = Vector2(0, -1)

const gravity : float = 4000.0

var movement_speed : float = 300.0
var jump_strenght : float = 1100.0
var sprint_multiplier : float = 1.6
var is_sprinting : bool = false

func _ready() -> void:
	Engine.target_fps = 60
	pass

func _physics_process(delta: float) -> void:
			
	velocity = move_and_slide(velocity, UP_DIRECTION)

func _apply_movement():
	pass

func _handle_movement_input():
	if Input.is_action_pressed('walk_left'):
		velocity.x = -movement_speed
	elif Input.is_action_pressed('walk_right'):
		velocity.x = movement_speed
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
	
	if Input.is_action_pressed('sprint'):
		is_sprinting = true
	else:
		is_sprinting = false
	
	if is_sprinting:
		velocity.x *= sprint_multiplier
	
	if is_on_floor() && Input.is_action_just_pressed('jump'):
		jump()


func jump():
	if is_sprinting:
		velocity.y = -jump_strenght / sprint_multiplier
	else:
		velocity.y = -jump_strenght

func _apply_gravity(delta : float) -> void:
	velocity.y += gravity * delta
	pass
