extends Character

class_name Zurine

var p = load("res://Sprites/ZurineBetaPortrait.png");

func _init(c=Node2D, s=Sprite, hp=Polygon2D, ep=Polygon2D, hpn=Label, epn=Label, l=1).(c, p, s, hp, ep, hpn, epn, l):
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
