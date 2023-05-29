extends Tech

class_name FrederickTech2

func _init():
	id = 12002; #Might be redundant
	type = 0;
	name = "Armored Strike";
	power = 50;
	resistance = [1]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [0, 1];
	epCost = 50;
	hpCost = 0;
	buff = [[3, 1, [0, 0]]];
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
