extends Tech

class_name DummyPhysTech

func _init():
	id = 12003; #Might be redundant
	type = 5;
	name = "FOR TESTING ONLY";
	power = 50;
	resistance = [1]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [1, 1];
	epCost = 50;
	hpCost = 0;
	buff = [[4, 1, [1, 0]]];
	debuff = [];
	status = [];
	hpRegen = 0;
	epRegen = 0;

func getColors():
	return [Color("#7c8491"), Color("#db914f")]; #Physical/Buff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
