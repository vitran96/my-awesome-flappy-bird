#script: score
extends Label

var score := 0;

# Called when the node enters the scene tree for the first time.
func _ready():
    text = str(score);

func update_score():
    score = score + 1
    text = str(score)
