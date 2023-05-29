extends Tech

class_name FrederickTech3

func _init():
	id = 12003; #Might be redundant
	type = 0;
	name = "Spark Slash";
	power = 30;
	resistance = [1, 4]; #Might be redundant
	anim = [0,0]; #Temporary
	sound = null; #Temporary
	hitNum = 1;
	target = [1, 1];
	epCost = 70;
	hpCost = 0;
	buff = [];
	debuff = [];
	status = [[5, 100, [1, 1]]];
	hpRegen = 0;
	epRegen = 0;

func getColors():
	return [Color("#7c8491"), Color("#e6f658")]; #Physical/Lightning

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
