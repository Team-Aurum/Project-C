extends StatusEffect

class_name Targeted

var p = load("res://Sprites/StatusEffects/Targeted.png");

func _init(turnNum: int):
	super(turnNum, false, p)
	id = 19002;
	type = 1;
	name = "Targeted";

func effect(c=Character):
	return c;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
