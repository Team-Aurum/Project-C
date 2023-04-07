extends Node

class_name Tech

var id:int;
var type:int;
#var attackName:String;
var power:float;
var resistance:Array;
var anim; #Implementation currently unknown
var sound; #Implementation currently unknown
var hitNum:int;
var target:Array;
var epCost:int;
var hpCost:int;
var buff:Array;
var debuff:Array;
var status:Array;
var hpRegen: int;
var epRegen: int;

func _init():
	pass

func getColors():
	return [Color("#FF00FF"), Color("#FF00FF")];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
