extends Area2D

const Pipe := preload("res://Pipe.tscn")

const START_PIPE_COUNT := 3

const PIPE_DISTANCE := 190
const NEW_PIPE_POSITION_X := 270
const NEW_PIPE_POSITION_Y_RANGE_TOP := -100
const NEW_PIPE_POSITION_Y_RANGE_BOTTOM := 100

func _ready() -> void:
    clear_existing_pipe()
    spawn_new_pipes(NEW_PIPE_POSITION_X, PIPE_DISTANCE, START_PIPE_COUNT)

func spawn_new_pipes(position: int, distance: int, count: int) -> void:
    for i in count:
        pipe_spawn(position)
        position = position + distance

func clear_existing_pipe() -> void:
    var root := get_tree().get_root()
    var main_node := root.get_child(0)
    var nodes := main_node.get_children()
    var pipe_nodes := []
    for node in nodes:
        if node.name.begins_with("Pipes"):
            pipe_nodes.push_back(node)

    for node in pipe_nodes:
        main_node.remove_child(node)

func get_pipe(parent: Node) -> Node:
    return parent.find_node("Pipes*", false)

func pipe_reset() -> void:
    pipe_spawn(NEW_PIPE_POSITION_X)

func pipe_spawn(x_position : int) -> void:
    var pipe_instance := Pipe.instance()
    pipe_instance.position = Vector2(x_position, rand_range(NEW_PIPE_POSITION_Y_RANGE_TOP, NEW_PIPE_POSITION_Y_RANGE_BOTTOM))
    get_tree().get_root().get_child(0).call_deferred("add_child", pipe_instance)

func _on_Spawn_area_entered(area: Area2D) -> void:
    if area.name == "Pipes":
        area.queue_free()
        pipe_reset()
