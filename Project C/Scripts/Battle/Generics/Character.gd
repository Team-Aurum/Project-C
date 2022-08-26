extends Node

class_name Character

var card:Node2D;
var portrait:Texture;
var sprite:Sprite; var HPBar:Polygon2D; var EPBar:Polygon2D;
var HPNum:Label; var EPNum:Label;
var rawMaxHP:Array; var rawMaxEP: Array;
var maxHP:float; var currentHP:float; var maxEP:float; var currentEP:float;
var level:int;
var StatusEffects:Array;
var rawAttack:Array; var rawMagic:Array; var rawSpeed:Array; var rawDefense:Array; var rawResistance:Array;
var attack:int; var magic:int; var speed:int; var defense:int; var resistance:int;
var Resistances:Array;
var Attacks:Array;

func _init(c=Node2D, p=Texture, s=Sprite, hp=Polygon2D, ep=Polygon2D, hpn=Label, epn=Label, l=1):
	card = c;
	portrait = p;
	sprite = s;
	HPBar = hp;
	EPBar = ep;
	HPNum = hpn;
	EPNum = epn;
	level = l;

func calcStats():
	maxHP = round(rawMaxHP[0] + rawMaxHP[1] * (level-1));
	maxEP = round(rawMaxEP[0] + rawMaxEP[1] * (level-1));
	attack = round(rawAttack[0] + rawAttack[1] * (level-1));
	magic = round(rawMagic[0] + rawMagic[1] * (level-1));
	speed = round(rawSpeed[0] + rawSpeed[1] * (level-1));
	defense = round(rawDefense[0] + rawDefense[1] * (level-1));
	resistance = round(rawResistance[0] + rawResistance[1] * (level-1));

func applyCardDetails():
	if currentHP == -1:
		currentHP = maxHP;
	if currentEP == -1:
		currentEP = maxEP;
	sprite.texture = portrait;
	var hpFill = 120 * (currentHP/maxHP);
	HPBar.polygon = [Vector2(0,0), Vector2(hpFill,0), Vector2(hpFill,20), Vector2(0, 20)];
	HPNum.text = String(currentHP);
	var epFill = 120 * (currentEP/maxEP);
	EPBar.polygon = [Vector2(0,0), Vector2(epFill,0), Vector2(epFill,20), Vector2(0, 20)];
	EPNum.text = String(currentEP);
	
	card.visible = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
