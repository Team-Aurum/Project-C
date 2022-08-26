extends Node2D

var play1: Character; var play2: Character; var play3: Character; var play4: Character;
var enemy1: Character; var enemy2: Character; var enemy3: Character; var enemy4: Character;

var techOptions: Array;

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

func display_TechMenu(p=0):
	$TechMenu.visible = true;
	$ControlPalette.visible = false;
	for n in $TechMenu/ScrollContainer/VBoxContainer.get_children():
		$TechMenu/ScrollContainer/VBoxContainer.remove_child(n);
	set_TechButton_details(p);

func set_TechButton_details(p=0):
	var data; var i = 0;
	var scene = load("res://Scenes/Elements/TechMenuOption.tscn");
	match(p): #Get the required information for each player's techs
		1:
			data = play1.getTechTags();
		2:
			data = play2.getTechTags();
		3:
			data = play3.getTechTags();
		4:
			data = play4.getTechTags();
		_:
			pass
	for d in data:
		var node = scene.instance();
		match(d[1]): #Assigning colors. WIP.
			0:
				var colors;
				match(p): #Getting colors directly from a function that is unique to each tech
					1:
						colors = play1.getColors(d[0]);
					2:
						colors = play2.getColors(d[0]);
					3:
						colors = play3.getColors(d[0]);
					4:
						colors = play4.getColors(d[0]);
					_:
						pass
				node.get_node("MainBody/ElementColor1").color = colors[0];
				node.get_node("MainBody/ElementColor2").color = colors[1];
			1:
				node.get_node("MainBody/ElementColor1").color = Color("#f65858");
				node.get_node("MainBody/ElementColor2").color = Color("#f65858");
		node.get_node("MainBody/Label").text = d[2];
		$TechMenu/ScrollContainer/VBoxContainer.add_child(node);

func _on_Player1Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftUp");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(1);

func _on_Player2Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftUp");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(2);

func _on_Player3Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftUp");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(3);

func _on_Player4Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftUp");
	display_TechMenu(4);

func _on_TechMenuExitButton_pressed():
	$TechMenu.visible = false;
	$ControlPalette.visible = true;
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
