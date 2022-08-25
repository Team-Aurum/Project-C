extends Character

class_name Frederick

var p = load("res://Sprites/FrederickBetaPortrait.png");

func _init(c=Node2D, s=Sprite, hp=Polygon2D, ep=Polygon2D, hpn=Label, epn=Label, l=1).(c, p, s, hp, ep, hpn, epn, l):
	loadStats();
	calcStats();
	currentHP = 192;
	currentEP = 382;
	applyCardDetails();
	statPrintout();
	#maxHP = 100.0;
	#maxEP = 100.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func statPrintout():
	print("Frederick Stats");
	print("Max HP: " + String(maxHP));
	print("Max EP: " + String(maxEP));
	print("Attack: " + String(attack));
	print("Magic: " + String(magic));
	print("Speed: " + String(speed));
	print("Defense: " + String(defense));
	print("Resistance: " + String(resistance));

func loadStats():
	rawMaxHP = [90, 7.27];
	rawMaxEP = [50, 4.55];
	rawAttack = [5, 0.46];
	rawMagic = [4, 0.36];
	rawSpeed = [3, 0.27];
	rawDefense = [10, 0.9];
	rawResistance = [8, 0.73]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
