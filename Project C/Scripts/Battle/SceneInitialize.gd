extends Node2D

var play1: Character; var play2: Character; var play3: Character; var play4: Character; var playerList: Dictionary;
var enemy1: Character; var enemy2: Character; var enemy3: Character; var enemy4: Character;

var techOptions: Array;
var currentMenu: int = 0; var currentPlayer: int;

# Called when the node enters the scene tree for the first time.
func _ready(): # Lots of this is still like test code and stuff, will have to eventually change it. With the playerList that should make it easier I think
	OS.window_size = Vector2(1920, 1080);
	#TODO: make this declaration a little shorter ya?
	play1 = Frederick.new($Player1, 100);
	play2 = Zurine.new($Player2, 100);
	#play3 = Zurine.new($Player3, 100);
	#play4 = Frederick.new($Player4, 100);
	enemy1 = Zurine.new($Enemy1, 20);
	playerList[1] = play1;
	playerList[2] = play2;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AttackButton_pressed():
	print("Attacking");
	$AnimationPlayer.play("AttackPhase");

func display_TechMenu(p=0):
	$TechMenu.visible = true;
	$ControlPalette.visible = false;
	for n in $TechMenu/ScrollContainer/VBoxContainer.get_children():
		$TechMenu/ScrollContainer/VBoxContainer.remove_child(n);
	match(currentMenu):
		0:
			$TechMenu/Header/Label.text = "Techs";
			$TechMenu/Header/Label2.text = "Techs";
			#set_TechButton_details(p);
		1:
			$TechMenu/Header/Label.text = "Magic";
			$TechMenu/Header/Label2.text = "Magic";
			#set_TechButton_details(p);
		2:
			$TechMenu/Header/Label.text = "Items";
			$TechMenu/Header/Label2.text = "Items";
		_:
			pass
	set_TechButton_details(p);

func set_TechButton_details(p=0):
	var data; var i = 0;
	var scene = load("res://Scenes/Elements/TechMenuOption.tscn");
	match(p): #Get the required information for each player's techs. May change this later to just an arraylist accessor instead of a match statement
		1:
			data = play1.getTags(currentMenu);
		2:
			data = play2.getTags(currentMenu);
		3:
			data = play3.getTags(currentMenu);
		4:
			data = play4.getTags(currentMenu);
		_:
			pass
	for d in data:
		var node = scene.instance();
		match(d[1]): #Assigning colors
			0: #Special case for Hybrid/Techs
				var colors;
				match(p): #Getting colors directly from a function that is unique to each tech using its id
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
			1: #Fire
				node.get_node("MainBody/ElementColor1").color = Color("#f65858");
				node.get_node("MainBody/ElementColor2").color = Color("#f65858");
			2: #Ice
				node.get_node("MainBody/ElementColor1").color = Color("#58b0f6");
				node.get_node("MainBody/ElementColor2").color = Color("#58b0f6");
			3: #Lightning
				node.get_node("MainBody/ElementColor1").color = Color("#e6f658");
				node.get_node("MainBody/ElementColor2").color = Color("#e6f658");
			4: #Wind
				node.get_node("MainBody/ElementColor1").color = Color("#58f69d");
				node.get_node("MainBody/ElementColor2").color = Color("#58f69d");
			5: #Phys/Special
				node.get_node("MainBody/ElementColor1").color = Color("#7c8491");
				node.get_node("MainBody/ElementColor2").color = Color("#7c8491");
			6: #Healing
				node.get_node("MainBody/ElementColor1").color = Color("#7cbd5e");
				node.get_node("MainBody/ElementColor2").color = Color("#7cbd5e");
			7: #Buffing
				node.get_node("MainBody/ElementColor1").color = Color("#db914f");
				node.get_node("MainBody/ElementColor2").color = Color("#db914f");
			8: #Debuffing
				node.get_node("MainBody/ElementColor1").color = Color("#4f79db");
				node.get_node("MainBody/ElementColor2").color = Color("#4f79db");
			9: #Burst Tech
				node.get_node("MainBody/ElementColor1").color = Color("#ce9be3");
				node.get_node("MainBody/ElementColor2").color = Color("#ce9be3");
			_: #Default Fallback
				node.get_node("MainBody/ElementColor1").color = Color("#FF00FF");
				node.get_node("MainBody/ElementColor2").color = Color("#FF00FF");
		node.get_node("MainBody/Label").text = d[2];
		node.get_node("TextureButton").connect("pressed", self, "_executeTech", [d[0]]);
		$TechMenu/ScrollContainer/VBoxContainer.add_child(node);

func _executeTech(id):
	var executingPlayer = playerList[currentPlayer];
	var baseAttack = executingPlayer.attack;
	var baseMagic = executingPlayer.magic;
	var baseDamage; var currentTech;
	match(id/10000):
		1:
			currentTech = executingPlayer.techs[id];
		2:
			currentTech = executingPlayer.magicTechs[id];
		3:
			pass
	if(currentTech.type == 0): baseDamage = (baseAttack + baseMagic)/2 + currentTech.power;
	elif(currentTech.type == 5): baseDamage = baseAttack + currentTech.power;
	else: baseDamage = baseMagic + currentTech.power;
	$Dialog/Label.text = currentTech.name + " Base Damage: " + str(baseDamage);
	print(currentTech.name + " Base Damage: " + str(baseDamage));

func _on_Player1Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftUp");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(1);
	currentPlayer = 1;

func _on_Player2Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftUp");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(2);
	currentPlayer = 2;

func _on_Player3Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftUp");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(3);
	currentPlayer = 3;

func _on_Player4Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftUp");
	display_TechMenu(4);
	currentPlayer = 4;

func _on_TechMenuExitButton_pressed():
	$TechMenu.visible = false;
	$ControlPalette.visible = true;
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	currentPlayer = 0;

func _on_RButton_pressed():
	currentMenu += 1;
	if currentMenu > 2:
		currentMenu = 0;
	display_TechMenu(currentPlayer);

func _on_LButton_pressed():
	currentMenu -= 1;
	if currentMenu < 0:
		currentMenu = 2;
	display_TechMenu(currentPlayer);
