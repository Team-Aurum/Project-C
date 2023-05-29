extends Tech

class_name Datu

func _init():
	id = 29025; #Might be redundant
	type = 6;
	name = "Datu";
	power = 0.4;
	resistance = [8]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [0, 0];
	epCost = 10;
	hpCost = 0;
	buff = [];
	debuff = [];
	status = [];
	hpRegen = 0; #Might be useless
	epRegen = 0; #Might be useless

#func getColors():
	#return [Color("#7c8491"), Color("#db914f")]; #Physical/Buff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
