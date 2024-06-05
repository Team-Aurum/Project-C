extends Character

class_name Zurine

var p = load("res://Sprites/ZurineBetaPortrait.png");

func _init(c=Node2D, l=1):
	super(c, p, l)
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
	return "Zurine";

func statPrintout():
	print("Zurine Stats");
	print("Max HP: " + str(maxHP));
	print("Max EP: " + str(maxEP));
	print("Attack: " + str(attack));
	print("Magic: " + str(magic));
	print("Speed: " + str(speed));
	print("Defense: " + str(defense));
	print("Resistance: " + str(resistance));

func loadStats():
	rawMaxHP = [60, 5.45];
	rawMaxEP = [80, 7.27];
	rawAttack = [9, 0.82];
	rawMagic = [7, 0.64];
	rawSpeed = [4, 0.36];
	rawDefense = [6, 0.55];
	rawResistance = [4, 0.36];
	resistances = [1, 0, 2, 3];

func loadTechs():
	magicTechs[27001] = ZSute.new();
	magicTechs[27002] = ZIzo.new();
	magicTechs[27003] = ZTxima.new();
	magicTechs[27004] = ZHaize.new();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
