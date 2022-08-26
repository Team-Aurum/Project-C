extends Node2D

var play1: Character; var play2: Character; var play3: Character; var play4: Character;
var enemy1: Character; var enemy2: Character; var enemy3: Character; var enemy4: Character;

# Called when the node enters the scene tree for the first time.
func _ready():
	play1 = Frederick.new($Player1, $Player1/AnimationGroup/Portrait, $Player1/AnimationGroup/HPBar/color, $Player1/AnimationGroup/EPBar/color, $Player1/AnimationGroup/HPBar/NumberSpace/Label, $Player1/AnimationGroup/EPBar/NumberSpace/Label, 100);
	play2 = Zurine.new($Player2, $Player2/AnimationGroup/Portrait, $Player2/AnimationGroup/HPBar/color, $Player2/AnimationGroup/EPBar/color, $Player2/AnimationGroup/HPBar/NumberSpace/Label, $Player2/AnimationGroup/EPBar/NumberSpace/Label, 100);
	enemy1 = Zurine.new($Enemy1, $Enemy1/AnimationGroup/Portrait, $Enemy1/AnimationGroup/HPBar/color, $Enemy1/AnimationGroup/EPBar/color, $Enemy1/AnimationGroup/HPBar/NumberSpace/Label, $Enemy1/AnimationGroup/EPBar/NumberSpace/Label, 20);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pas

func _on_AttackButton_pressed():
	print("Attacking");
	$AnimationPlayer.play("AttackPhase");
