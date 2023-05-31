extends StatusEffect

class_name Rage

var p = load("res://Sprites/StatusEffects/Rage.png");

func _init(turnNum: int).(turnNum, p):
	id = 0;
	type = 1;
	name = "Rage";

func effect(c=Character):
	return c;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
