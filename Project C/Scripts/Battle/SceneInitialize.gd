extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var testChar = Frederick.new($Player1/AnimationGroup/Portrait, $Player1/AnimationGroup/HPBar/color, $Player1/AnimationGroup/EPBar/color);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
