extends Area2D

func _on_Pipe_body_shape_entered(body_id, body, body_shape, area_shape):
    print("hit pipe at speed: ", body.FLYING_SPEED)
#    print(body.FLYING_SPEED)
