extends Character

class_name Makoto

var p = load("res://Sprites/MakotoBetaPortrait.png");

func _init(c=Node2D, l=1).(c, p, l):
	loadStats();
	loadTechs();
	calcStats();
	currentHP = -1; #Temp override to see max HP values
	currentEP = -1;
	applyCardDetails();
	statPrintout();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getName():
	return "Makoto";

func statPrintout():
	print("Makoto Stats");
	print("Max HP: " + String(maxHP));
	print("Max EP: " + String(maxEP));
	print("Attack: " + String(attack));
	print("Magic: " + String(magic));
	print("Speed: " + String(speed));
	print("Defense: " + String(defense));
	print("Resistance: " + String(resistance));

func loadStats():
	rawMaxHP = [50, 4.54];
	rawMaxEP = [80, 7.27];
	rawAttack = [10, 0.9];
	rawMagic = [9, 0.82];
	rawSpeed = [7, 0.64];
	rawDefense = [3, 0.27];
	rawResistance = [4, 0.36];
	resistances = [3, 0, 1, 2];

func loadTechs():
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
