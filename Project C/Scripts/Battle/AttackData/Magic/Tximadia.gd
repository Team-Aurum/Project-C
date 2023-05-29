extends Tech

class_name Tximadia

func _init():
	id = 29007; #Might be redundant
	type = 3;
	name = "Tximadia";
	power = 50;
	resistance = [4]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [0, 1];
	epCost = 30;
	hpCost = 0;
	buff = [];
	debuff = [];
	status = [];
	hpRegen = 0;
	epRegen = 0;

#func getColors():
	#return [Color("#7c8491"), Color("#db914f")]; #Physical/Buff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
