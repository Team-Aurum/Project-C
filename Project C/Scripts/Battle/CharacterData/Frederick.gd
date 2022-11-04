extends Character

class_name Frederick

var p = load("res://Sprites/FrederickBetaPortrait.png");

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
	return "Frederick";

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
	rawResistance = [8, 0.73];

func loadTechs():
	techs[12001] = FrederickTech1.new();
	techs[12002] = FrederickTech2.new();
	techs[12003] = DummyPhysTech.new();
	magicTechs[29001] = Izo.new();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
