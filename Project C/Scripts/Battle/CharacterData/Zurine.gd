extends Character

class_name Zurine

var p = load("res://Sprites/ZurineBetaPortrait.png");

func _init(c=Node2D, s=Sprite, hp=Polygon2D, ep=Polygon2D, hpn=Label, epn=Label, l=1).(c, p, s, hp, ep, hpn, epn, l):
	loadStats();
	calcStats();
	currentHP = -1; #Temp override to see max HP values
	currentEP = -1;
	applyCardDetails();
	statPrintout();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func statPrintout():
	print("Zurine Stats");
	print("Max HP: " + String(maxHP));
	print("Max EP: " + String(maxEP));
	print("Attack: " + String(attack));
	print("Magic: " + String(magic));
	print("Speed: " + String(speed));
	print("Defense: " + String(defense));
	print("Resistance: " + String(resistance));

func loadStats():
	rawMaxHP = [60, 5.45];
	rawMaxEP = [80, 7.27];
	rawAttack = [9, 0.82];
	rawMagic = [7, 0.64];
	rawSpeed = [4, 0.36];
	rawDefense = [6, 0.55];
	rawResistance = [4, 0.36];

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
