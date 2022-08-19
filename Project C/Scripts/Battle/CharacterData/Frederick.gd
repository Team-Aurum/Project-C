extends Character

class_name Frederick

var p = load("res://Sprites/FrederickBeta.png");

func _init(s=Sprite, hp=Polygon2D, ep=Polygon2D).(p, s, hp, ep):
	currentHP = 75.0;
	currentEP = 25.0;
	maxHP = 100.0;
	maxEP = 100.0;
	applyCardDetails();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
