extends Node

class_name Character

var portrait:Texture;
var sprite:Sprite; var HPBar:Polygon2D; var EPBar:Polygon2D;
var rawMaxHP:Array; var rawMaxEP: Array;
var maxHP:float; var currentHP:float; var maxEP:float; var currentEP:float;
var level:int;
var StatusEffects:Array;
var rawAttack:Array; var rawMagic:Array; var rawSpeed:Array; var rawDefense:Array; var rawResistance:Array;
var attack:int; var magic:int; var speed:int; var defense:int; var resistance:int;
var Resistances:Array;
var Attacks:Array;

func _init(p=Texture, s=Sprite, hp=Polygon2D, ep=Polygon2D):
	portrait = p;
	sprite = s;
	HPBar = hp;
	EPBar = ep;
	
func calcStats():
	maxHP = rawMaxHP[0] + rawMaxHP[1] * level;
	maxEP = rawMaxEP[0] + rawMaxEP[1] * level;
	attack = rawAttack[0] + rawAttack[1] * level;
	magic = rawMagic[0] + rawMagic[1] * level;
	speed = rawSpeed[0] + rawSpeed[1] * level;
	defense = rawDefense[0] + rawDefense[1] * level;
	resistance = rawResistance[0] + rawResistance[1] * level;

func applyCardDetails():
	sprite.texture = portrait;
	var hpFill = 125 * (currentHP/maxHP);
	HPBar.polygon = [Vector2(0,0), Vector2(hpFill,0), Vector2(hpFill,20), Vector2(0, 20)];
	var epFill = 125 * (currentEP/maxEP);
	EPBar.polygon = [Vector2(0,0), Vector2(epFill,0), Vector2(epFill,20), Vector2(0, 20)];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
