extends Tech

class_name ZSute

func _init():
	id = 27001; #Might be redundant
	type = 0;
	name = "Sute Bullet";
	power = 20;
	resistance = [1, 2]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [1, 1];
	epCost = 10;
	hpCost = 0;
	buff = [];
	debuff = [];
	status = [];
	hpRegen = 0;
	epRegen = 0;

func getColors():
	return [Color("#7c8491"), Color("#f65858")]; #Physical/Fire

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
