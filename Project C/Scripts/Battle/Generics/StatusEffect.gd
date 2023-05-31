extends Node

class_name StatusEffect

var id: int;
# var name: String;
var type: int;
var stackTurnNum: int;

func effect(c: Character):
	print("Generic version is being called, please overload this function!!");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
