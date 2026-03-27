extends Node

class_name StatusEffect

var icon: Texture2D;
var id: int;
# var name: String;
var type: int;
var stackTurnNum: int;
var stackMode: bool;

func _init(turnNum: int, s: bool, p=Texture2D):
	stackTurnNum = turnNum;
	icon = p;
	stackMode = s;
	if(icon == null):
		icon = load("res://Sprites/StatusEffects/Missing.png");

func effect(_c=Character):
	print("Generic version is being called, please overload this function!!");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func toString():
	return "(" + name + " for " + str(stackTurnNum) + " turns)"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
