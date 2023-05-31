extends Node

class_name Character

var card:Node2D;
var portrait:Texture;
var sprite:Sprite; var HPBar:Node2D; var EPBar:Node2D;
var HPNum:Label; var EPNum:Label;
var rawMaxHP:Array; var rawMaxEP: Array;
var maxHP:float; var currentHP:float; var maxEP:float; var currentEP:float;
var level:int;
var buffs:Array; var debuffs:Array;
var statusEffects:Array;
var rawAttack:Array; var rawMagic:Array; var rawSpeed:Array; var rawDefense:Array; var rawResistance:Array;
var attack:int; var magic:int; var speed:int; var defense:int; var resistance:int;
var resistances:Array;
var techs:Dictionary; var magicTechs:Dictionary;

func _init(c=Node2D, p=Texture, l=1):
	card = c;
	portrait = p;
	sprite = c.get_node("AnimationGroup/Portrait");
	HPBar = c.get_node("AnimationGroup/HPBar");
	EPBar = c.get_node("AnimationGroup/EPBar");
	HPNum = c.get_node("AnimationGroup/HPBar/NumberSpace/Label");
	EPNum = c.get_node("AnimationGroup/EPBar/NumberSpace/Label");
	level = l;
	buffs = [0,0,0,0,0];
	debuffs = [0,0,0,0,0];

func calcStats():
	maxHP = ceil(rawMaxHP[0] + rawMaxHP[1] * (level-1));
	maxEP = ceil(rawMaxEP[0] + rawMaxEP[1] * (level-1));
	attack = ceil(rawAttack[0] + rawAttack[1] * (level-1));
	magic = ceil(rawMagic[0] + rawMagic[1] * (level-1));
	speed = ceil(rawSpeed[0] + rawSpeed[1] * (level-1));
	defense = ceil(rawDefense[0] + rawDefense[1] * (level-1));
	resistance = ceil(rawResistance[0] + rawResistance[1] * (level-1));

func applyCardDetails():
	if currentHP == -1:
		currentHP = maxHP;
	if currentEP == -1:
		currentEP = maxEP;
	sprite.texture = portrait;
	var hpFill = 120 * (currentHP/maxHP);
	HPBar.get_node("color").polygon = [Vector2(0,0), Vector2(hpFill,0), Vector2(hpFill,20), Vector2(0, 20)];
	HPBar.get_node("reduceColor").polygon = [Vector2(0,0), Vector2(hpFill,0), Vector2(hpFill,20), Vector2(0, 20)];
	HPNum.text = String(currentHP);
	var epFill = 120 * (currentEP/maxEP);
	EPBar.get_node("color").polygon = [Vector2(0,0), Vector2(epFill,0), Vector2(epFill,20), Vector2(0, 20)];
	EPBar.get_node("reduceColor").polygon = [Vector2(0,0), Vector2(epFill,0), Vector2(epFill,20), Vector2(0, 20)];
	EPNum.text = String(currentEP);
	
	card.visible = true;

func getName():
	return "NULL";

func getTags(cm=-1):
	var result = [];
	match(cm):
		0:
			for key in techs:
				var temp = [];
				var a = techs.get(key);
				temp.append(a.id);
				temp.append(a.type);
				temp.append(a.name);
				result.append(temp);
		1:
			for key in magicTechs:
				var temp = [];
				var a = magicTechs.get(key);
				temp.append(a.id);
				temp.append(a.type);
				temp.append(a.name);
				result.append(temp);
		_:
			pass
	return result;

func getColors(id=10000):
	var attacks: Dictionary;
	for key in techs:
		attacks[key] = techs[key];
	for key in magicTechs:
		attacks[key] = magicTechs[key];
	var tech = attacks.get(id);
	return tech.getColors();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
