extends Node2D

func _ready() -> void:
    pass # Replace with function body.

#func _process(delta):
#   if Input.is_action_pressed("key_exit"):
#      get_tree().quit()

func _process(delta: float) -> void:
   if Input.is_action_pressed("key_exit"):
      get_tree().quit()
