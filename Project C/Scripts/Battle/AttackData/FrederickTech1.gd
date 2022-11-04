extends Tech

class_name FrederickTech1

func _init():
	id = 12001; #Might be redundant
	type = 0;
	name = "Glimmer Slash";
	power = 30;
	resistance = [1, 4]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [0, 1];
	epCost = 30;
	hpCost = 0;
	buff = [];
	debuff = [];
	status = [[5, 100, [0, 1]]];
	hpRegen = 0;
	epRegen = 0;

func getColors():
	return [Color("#7c8491"), Color("#58b0f6")]; #Physical/Ice

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
