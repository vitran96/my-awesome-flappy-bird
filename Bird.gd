extends RigidBody2D

export var JUMP_HEIGHT = -150;

func _process(delta):
  if Input.is_action_just_pressed("ui_jump"):
    self.set_linear_velocity(Vector2(0, JUMP_HEIGHT))
