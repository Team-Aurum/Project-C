extends Character

class_name Oskar

var p = load("res://Sprites/OskarBetaPortrait.png");

func _init(c=Node2D, l=1).(c, p, l):
	loadStats();
	loadTechs();
	calcStats();
	currentHP = -1; #Temp override to see max HP values
	currentEP = -1;
	applyCardDetails();
	statPrintout();
	#maxHP = 100.0;
	#maxEP = 100.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getName():
	return "Oskar";

func statPrintout():
	print("Oskar Stats");
	print("Max HP: " + String(maxHP));
	print("Max EP: " + String(maxEP));
	print("Attack: " + String(attack));
	print("Magic: " + String(magic));
	print("Speed: " + String(speed));
	print("Defense: " + String(defense));
	print("Resistance: " + String(resistance));

func loadStats():
	rawMaxHP = [70, 6.36];
	rawMaxEP = [90, 9.18];
	rawAttack = [4, 0.36];
	rawMagic = [10, 0.9];
	rawSpeed = [7, 0.64];
	rawDefense = [5, 0.46];
	rawResistance = [8, 0.73];
	resistances = [1, 3, 0, 2];

func loadTechs():
	magicTechs[29025] = Datu.new();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
