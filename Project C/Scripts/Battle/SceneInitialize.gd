extends Node2D

var play1: Character; var play2: Character; var play3: Character; var play4: Character; var playerList: Dictionary;
var enemy1: Character; var enemy2: Character; var enemy3: Character; var enemy4: Character; var enemyList: Dictionary;

var techOptions: Array;
var currentMenu: int = 0; var currentPlayer: int;

var dwalla;
var nwalla;
var dlayer;
var nlayer; 
var nalayer;

var dWallaFadeIn: bool = false; var dWallaFadeOut: bool = false;
var nWallaFadeIn: bool = false; var nWallaFadeOut: bool = false;
var nLayerFadeIn: bool = false; var nLayerFadeOut: bool = false;
var dLayerFadeIn: bool = false; var dLayerFadeOut: bool = false;
var naLayerFadeIn: bool = false; var naLayerFadeOut: bool = false;

# Called when the node enters the scene tree for the first time.
# TODO: Lots of this is still like test code and stuff, will have to eventually change it. 
# With the playerList that should make it easier I think
func _ready(): 
	OS.window_size = Vector2(1920, 1080);
	#TODO: make this declaration a little shorter ya?
	play1 = Frederick.new($Player1, 100);
	play2 = Zurine.new($Player2, 100);
	play3 = Oskar.new($Player3, 100);
	play4 = Makoto.new($Player4, 100);
	enemy1 = Zurine.new($Enemy1, 20);
	enemy2 = Makoto.new($Enemy2, 50);
	enemy3 = Oskar.new($Enemy3, 40);
	enemy4 = Makoto.new($Enemy4, 70);
	
	print(play1.EPBar.get_node("reduceColor").polygon[1].x)
	print(play2.EPBar.get_node("reduceColor").polygon[1].x)
	print(play3.EPBar.get_node("reduceColor").polygon[1].x)
	print(play4.EPBar.get_node("reduceColor").polygon[1].x)
	
	playerList[1] = play1;
	playerList[2] = play2;
	playerList[3] = play3;
	playerList[4] = play4;
	enemyList[1] = enemy1;
	enemyList[2] = enemy2;
	enemyList[3] = enemy3;
	enemyList[4] = enemy4;
	dwalla = $DWalla;
	nwalla = $NWalla;
	nlayer = $NLayer;
	dlayer = $DLayer;
	nalayer = $NALayer;
	
	nwalla.set_volume_db(-80);
	nlayer.set_volume_db(-80);
	nlayer.get_node("Audio2").set_volume_db(-80);
	nalayer.set_volume_db(-80);
	nalayer.get_node("Audio2").set_volume_db(-80);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# buncha listeners and shit
	if(dWallaFadeIn):
		if(dwalla.get_volume_db() == 0): 
			dWallaFadeIn = false;
			print("DWalla Faded In");
		if(dwalla.get_volume_db() < 0):
			dwalla.set_volume_db(dwalla.get_volume_db() + 1);
	if(dWallaFadeOut):
		if(dwalla.get_volume_db() == -80): 
			dWallaFadeOut = false;
			print("DWalla Faded Out");
		if(dwalla.get_volume_db() > -80):
			dwalla.set_volume_db(dwalla.get_volume_db() - 1);
	
	if(nWallaFadeIn):
		if(nwalla.get_volume_db() == 0): 
			nWallaFadeIn = false;
			print("NWalla Faded In");
		if(nwalla.get_volume_db() < 0):
			nwalla.set_volume_db(nwalla.get_volume_db() + 1);
	if(nWallaFadeOut):
		if(nwalla.get_volume_db() == -80): 
			nWallaFadeOut = false;
			print("NWalla Faded Out");
		if(nwalla.get_volume_db() > -80):
			nwalla.set_volume_db(nwalla.get_volume_db() - 1);
	
	if(dLayerFadeIn):
		if(dlayer.get_node("Audio2").get_volume_db() == 0): 
			dLayerFadeIn = false;
			print("DLayer Faded In");
		if(dlayer.get_node("Audio2").get_volume_db() < 0):
			dlayer.get_node("Audio2").set_volume_db(dlayer.get_node("Audio2").get_volume_db() + 1);
	if(dLayerFadeOut):
		if(dlayer.get_node("Audio2").get_volume_db() == -80): 
			dLayerFadeOut = false;
			print("DLayer Faded Out");
		if(dlayer.get_node("Audio2").get_volume_db() > -80):
			dlayer.get_node("Audio2").set_volume_db(dlayer.get_node("Audio2").get_volume_db() - 1);
	
	if(nLayerFadeIn):
		if(nlayer.get_node("Audio2").get_volume_db() == 0): 
			nLayerFadeIn = false;
			print("NLayer Faded In");
		if(nlayer.get_node("Audio2").get_volume_db() < 0):
			nlayer.get_node("Audio2").set_volume_db(nlayer.get_node("Audio2").get_volume_db() + 1);
	if(nLayerFadeOut):
		if(nlayer.get_node("Audio2").get_volume_db() == -80): 
			nLayerFadeOut = false;
			print("NLayer Faded Out");
		if(nlayer.get_node("Audio2").get_volume_db() > -80):
			nlayer.get_node("Audio2").set_volume_db(nlayer.get_node("Audio2").get_volume_db() - 1);
	
	if(naLayerFadeIn):
		if(nalayer.get_node("Audio2").get_volume_db() == 0): 
			naLayerFadeIn = false;
			print("NALayer Faded In");
		if(nalayer.get_node("Audio2").get_volume_db() < 0):
			nalayer.get_node("Audio2").set_volume_db(nalayer.get_node("Audio2").get_volume_db() + 1);
	if(naLayerFadeOut):
		if(nalayer.get_node("Audio2").get_volume_db() == -80): 
			naLayerFadeOut = false;
			print("NALayer Faded Out");
		if(nalayer.get_node("Audio2").get_volume_db() > -80):
			nalayer.get_node("Audio2").set_volume_db(nalayer.get_node("Audio2").get_volume_db() - 1);

# TODO: Not done yet. Starts attack phase
func _on_AttackButton_pressed():
	print("Attacking");
	$AnimationPlayer.play("AttackPhase");

# Displays the tech menu. Cycles between Techs, Magic, and Items tabs
func display_TechMenu(p=0):
	$TechMenu.visible = true;
	$ControlPalette.visible = false;
	for n in $TechMenu/ScrollContainer/VBoxContainer.get_children():
		$TechMenu/ScrollContainer/VBoxContainer.remove_child(n);
		n.free();
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

# Sets the details for each action within each tech menu tab
# TODO: this is being done on the fly, not sure if it will cause slowdown on item page?
func set_TechButton_details(p=0):
	var data; var i = 0;
	var scene = load("res://Scenes/Elements/TechMenuOption.tscn");
	
	# Get the required information for each player's techs. 
	# TODO: May change this later to just an arraylist accessor instead of a match statement
	match(p):
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
	
	# Creates an instance of a TechMenuOption for each action that the player has in their tags
	# Each instance is then added to the parent VBoxContainer 
	for d in data:
		var node = scene.instance();
		
		# Assigning colors
		match(d[1]):
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
		
		# Setting other details like text and associated action before adding node to the tree
		node.get_node("MainBody/Label").text = d[2];
		node.get_node("TextureButton").connect("pressed", self, "_executeTech", [d[0]]);
		$TechMenu/ScrollContainer/VBoxContainer.add_child(node);

# Sets all details for calculating damage, and sets up dialog for target selection
# TODO: Some things may not be finished yet
func _executeTech(id):
	var executingPlayer = playerList[currentPlayer];
	var baseAttack = executingPlayer.attack;
	var baseMagic = executingPlayer.magic;
	var baseDamage: int; var currentTech;
	var currentEP;
	
	# Determines whether the given tech is in the techs or magicTechs array
	# The first digit of an ID determines whether it's a tech or magic, so id/10000 pulls off just that digit
	match(id/10000):
		1:
			currentTech = executingPlayer.techs[id];
		2:
			currentTech = executingPlayer.magicTechs[id];
		3:
			return false;
	currentEP = executingPlayer.currentEP;
	executingPlayer.currentEP -= currentTech.epCost;
	if(executingPlayer.currentEP < 0):
		executingPlayer.currentEP += currentTech.epCost;
		$Dialog.visible = true;
		$Dialog/Label.text = "Not enough EP";
		return false;
	
	var damageType = currentTech.type;
	
	# Does baseDamage calculations based on damage type
	# Also TODO: The base "else" case here is to do magic damage. Maybe change for error catching?
	if(damageType == 0): baseDamage = (baseAttack + baseMagic)/2 + currentTech.power;
	elif(damageType == 5): baseDamage = baseAttack + currentTech.power;
	elif(damageType == 6): baseDamage = round(baseMagic * currentTech.power);
	else: baseDamage = baseMagic + currentTech.power;
	
	# Sets the dialog text if a target is needed or, if an aoe skill, immediately begins calculating damage
	# First element of the target array determines single-target, aoe, or universal
	print(currentTech.name + " Base Damage: " + str(baseDamage));
	if(currentTech.target[0] == 1 || currentTech.target[0] == 2):
		_calcFinalDamage(baseDamage, damageType, -1, currentTech, false, currentEP);
	else:
		# Second element of the target array determines enemy or self targetting
		if(currentTech.target[1] == 0):
			$Dialog.visible = true;
			$Dialog/Label.text = "Choose an ally";
			
			#Connecting/disconnecting listeners
			$Player1/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player1Button_pressed");
			$Player2/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player2Button_pressed");
			$Player3/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player3Button_pressed");
			$Player4/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player4Button_pressed");
			
			$Player1/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, play1, currentTech, false, currentEP]);
			$Player2/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, play2, currentTech, false, currentEP]);
			$Player3/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, play3, currentTech, false, currentEP]);
			$Player4/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, play4, currentTech, false, currentEP]);
			
			$TechMenu/Header/ExitButton.disconnect("pressed", self, "_on_TechMenuExitButton_pressed");
			$TechMenu/Header/ExitButton.connect("pressed", self, "_cancelAction", [0]);
		elif(currentTech.target[1] == 1):
			$Dialog.visible = true;
			$Dialog/Label.text = "Choose an enemy";
			
			# Connecting/disconnecting listeners
			$Player1/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player1Button_pressed");
			$Player2/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player2Button_pressed");
			$Player3/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player3Button_pressed");
			$Player4/AnimationGroup/TextureButton.disconnect("pressed", self, "_on_Player4Button_pressed");
		
			$Enemy1/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, enemy1, currentTech, false, currentEP]);
			$Enemy2/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, enemy2, currentTech, false, currentEP]);
			$Enemy3/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, enemy3, currentTech, false, currentEP]);
			$Enemy4/AnimationGroup/TextureButton.connect("pressed", self, "_calcFinalDamage", [baseDamage, damageType, enemy4, currentTech, false, currentEP]);
		
			$TechMenu/Header/ExitButton.disconnect("pressed", self, "_on_TechMenuExitButton_pressed");
			$TechMenu/Header/ExitButton.connect("pressed", self, "_cancelAction", [1]);

# Old: Not finished yet, does the final damage calculations considering damage reduction
# Old: Finish the status effect application logic
# TODO: Verify everything else??? I mean it looks fine right now lmao
func _calcFinalDamage(baseDamage, damageType, target, attack, recurse: bool, casterCurrentEP):
	var currentHP; var currentEP; var buffsChanged: bool; var statusChanged: bool;
	
	buffsChanged = false; statusChanged = false;
		
	# Sets buffs
	if(attack.buff.size() != 0):
		buffsChanged = true;
		for b in attack.buff: # Applies buffs
			match(b[2][1]): # Checking if self or enemy target
				0:
					match(b[2][0]): # Checking if single, all, or universal target
						0:
							if(b[1] == 0): # If the value is 0, clears all buffs
								playerList[currentPlayer].buffs == [0,0,0,0,0];
							else:
								playerList[currentPlayer].buffs[b[0]] += b[1];
								if(playerList[currentPlayer].buffs[b[0]] > 5):
									playerList[currentPlayer].buffs[b[0]] = 5;
						1:
							if(b[1] == 0): # If the value is 0, clears all buffs
								for p in playerList:
									playerList[p].buffs = [0,0,0,0,0];
							else:
								for p in playerList:
									playerList[p].buffs[b[0]] += b[1]
									if(playerList[p].buffs[b[0]] > 5):
										playerList[p].buffs[b[0]] = 5;
						2:
							if(b[1] == 0): # If the value is 0, clears all buffs
								for p in playerList:
									playerList[p].buffs = [0,0,0,0,0];
								for e in enemyList:
									enemyList[e].buffs = [0,0,0,0,0];
							else:
								for p in playerList:
									playerList[p].buffs[b[0]] += b[1]
									if(playerList[p].buffs[b[0]] > 5):
										playerList[p].buffs[b[0]] = 5;
								for e in enemyList:
									enemyList[e].buffs[b[0]] += b[1]
									if(enemyList[e].buffs[b[0]] > 5):
										enemyList[e].buffs[b[0]] = 5;
				1:
					match(b[2][0]):
						0:
							if(b[1] == 0): # If the value is 0, clears all buffs
								target.buffs == [0,0,0,0,0];
							else:
								target.buffs[b[0]] += b[1];
								if(target.buffs[b[0]] > 5):
									target.buffs[b[0]] = 5;
						1:
							if(b[1] == 0): # If the value is 0, clears all buffs
								for e in enemyList:
									enemyList[e].buffs = [0,0,0,0,0];
							else:
								for e in enemyList:
									enemyList[e].buffs[b[0]] += b[1]
									if(enemyList[e].buffs[b[0]] > 5):
										enemyList[e].buffs[b[0]] = 5;
						2:
							if(b[1] == 0): # If the value is 0, clears all buffs
								for p in playerList:
									playerList[p].buffs = [0,0,0,0,0];
								for e in enemyList:
									enemyList[e].buffs = [0,0,0,0,0];
							else:
								for p in playerList:
									playerList[p].buffs[b[0]] += b[1]
									if(playerList[p].buffs[b[0]] > 5):
										playerList[p].buffs[b[0]] = 5;
								for e in enemyList:
									enemyList[e].buffs[b[0]] += b[1]
									if(enemyList[e].buffs[b[0]] > 5):
										enemyList[e].buffs[b[0]] = 5;
				_:
					pass
		
	# Damage shenanigans
	if(typeof(target) == TYPE_INT):
		print("How to loop this...");
		for enemy in enemyList:
			_calcFinalDamage(baseDamage, damageType, enemyList[enemy], attack, true, casterCurrentEP);
	else:
		currentHP = target.currentHP;
		currentEP = target.currentEP;
		print(str(baseDamage) + " Base damage of type " + str(damageType) + " on " + target.getName());
		var rawDamage = 0;
		var healPercent = 0.0;
		match(damageType):
			0: # Hybrid
				for i in attack.resistance.size():
					rawDamage += calcHybridDamage(int(baseDamage/attack.resistance.size()), target, attack, attack.resistance[i]);
			1: # Fire
				rawDamage = calcResistanceEffects(target.resistances[0], baseDamage - target.resistance);
			2: # Ice
				rawDamage = calcResistanceEffects(target.resistances[1], baseDamage - target.resistance);
			3: # Elec
				rawDamage = calcResistanceEffects(target.resistances[2], baseDamage - target.resistance);
			4: # Wind
				rawDamage = calcResistanceEffects(target.resistances[3], baseDamage - target.resistance);
			5: # Physical
				rawDamage = baseDamage - target.defense;
			6: # Heal
				healPercent = baseDamage * 0.01;
			9:
				pass
			_:
				pass
		# Somewhere in here, extra effects should be evaluated
		if(damageType != 6):
			print("Final damage: " + str(rawDamage));
			print("Target HP before damage: " + str(target.currentHP));
			target.currentHP -= rawDamage;
			if(target.currentHP < 0): target.currentHP = 0;
			print("Target Current HP: " + str(target.currentHP));
			print(playerList[currentPlayer].buffs);	
		elif(damageType == 6):
			print("Final heal amount: " + String(target.maxHP * healPercent));
			target.currentHP += int(round(target.maxHP * healPercent));
			if(target.currentHP > target.maxHP): target.currentHP = target.maxHP;
			print("Heal Percent: " + String(healPercent*100) + "%");
		_updateCharCards(target, currentHP != target.currentHP, currentEP != target.currentEP, buffsChanged, statusChanged);
	
	# Status Effect Evaluation (always happens after damage)
	if(attack.status.size() != 0 && !recurse):
		statusChanged = true;
		for sEffect in attack.status:
			match(sEffect[2][0]):
				0: # Single-target
					_applyStatusEffects(target, sEffect);
					_updateCharCards(target, false, false, buffsChanged, statusChanged);
				1: # All-target
					if(sEffect[2][1] == 1):
						for enemy in enemyList:
							_applyStatusEffects(enemyList[enemy], sEffect);
							_updateCharCards(enemyList[enemy], false, false, buffsChanged, statusChanged);
					elif(sEffect[2][1] == 2):
						for player in playerList:
							_applyStatusEffects(playerList[player], sEffect);
							_updateCharCards(playerList[player], false, false, buffsChanged, statusChanged);
						pass;
				2: # Universal-Target (Enemy only usually)
					pass;
				_:
					pass;
		
	if(!recurse):
		# This one sets the caster's EP values
		_updateCharCards(playerList[currentPlayer], false, casterCurrentEP != playerList[currentPlayer].currentEP, buffsChanged, statusChanged);
		_cancelAction(attack.target[1]);
		_on_TechMenuExitButton_pressed();

# Helper method for applying status effects
# TODO: Add all other status effects
func _applyStatusEffects(target, sEffect):
	# Does the status effect land?
	if((randi() % 101) <= sEffect[1]):
		# Loading the correct Status Effect object
		var status;
		match(sEffect[0]):
			19001: # Rage
				status = Rage.new(sEffect[3]);
			_:
				pass;
		
		# Targeting type
		match(sEffect[2][1]):
			0: # Self
				# If it already exists
				for existingStatus in playerList[currentPlayer].statusEffects:
					if(status.toString() == existingStatus.toString()):
						print("Overwriting status turn count!");
						existingStatus.stackTurnNum = status.stackTurnNum;
						return false;
				
				playerList[currentPlayer].statusEffects.append(status);
				print("Added Status Effect: " + status.toString() + " to " + playerList[currentPlayer].getName());
			1: # Enemy
				# If it already exists
				for existingStatus in target.statusEffects:
					if(status.toString() == existingStatus.toString()):
						print("Overwriting status turn count!");
						existingStatus.stackTurnNum = status.stackTurnNum;
						return false;
				
				target.statusEffects.append(status);
				print("Added Status Effect: " + status.toString() + " to " + target.getName());
	else:
		# TODO: Later on, should show some sort of visual to indicate that the status effect missed?
		pass;

# Specific helper method for handling hybrid damage
func calcHybridDamage(baseDamage: int, target, attack, targetedRes: int) -> int:
	var rawDamage: int;
	match(targetedRes):
		0:
			rawDamage = calcResistanceEffects(0, baseDamage);
		1:
			rawDamage = baseDamage - int(target.defense/attack.resistance.size());
		2:
			rawDamage = calcResistanceEffects(target.resistances[0], baseDamage - int(target.resistance/attack.resistance.size()));
		3:
			rawDamage = calcResistanceEffects(target.resistances[1], baseDamage - int(target.resistance/attack.resistance.size()));
		4:
			rawDamage = calcResistanceEffects(target.resistances[2], baseDamage - int(target.resistance/attack.resistance.size()));
		5:
			rawDamage = calcResistanceEffects(target.resistances[3], baseDamage - int(target.resistance/attack.resistance.size()));
		6:
			rawDamage = baseDamage - int(target.resistance/attack.resistance.size());
		7:
			rawDamage = 0;
		8:
			rawDamage = -1;
		_:
			rawDamage = 0;
	print("Part damage: " + str(rawDamage));
	return rawDamage;

# Counts multiplicative shenanigans for elemental resistances
func calcResistanceEffects(resNum: int, baseDamage: int) -> int:
	match(resNum):
		0:
			return int(baseDamage * 1.5);
		1:
			return baseDamage;
		2:
			return int(baseDamage * 0.5);
		3:
			return 0;
		4:
			return -1;
		5:
			return -1;
		_:
			return 0;

# Cancels the current action by resetting all listeners
# _calcFinalDamage() calls this as part of its routine to reset the game back to its base state
func _cancelAction(mode: int):
	if(mode == 0):
		$Player1/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Player2/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Player3/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Player4/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		
		$Player1/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player1Button_pressed");
		$Player2/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player2Button_pressed");
		$Player3/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player3Button_pressed");
		$Player4/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player4Button_pressed");
	elif(mode == 1):
		$Player1/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player1Button_pressed");
		$Player2/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player2Button_pressed");
		$Player3/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player3Button_pressed");
		$Player4/AnimationGroup/TextureButton.connect("pressed", self, "_on_Player4Button_pressed");
		
		$Enemy1/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Enemy2/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Enemy3/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
		$Enemy4/AnimationGroup/TextureButton.disconnect("pressed", self, "_calcFinalDamage");
	$TechMenu/Header/ExitButton.disconnect("pressed", self, "_cancelAction");
	$TechMenu/Header/ExitButton.connect("pressed", self, "_on_TechMenuExitButton_pressed");
	$Dialog.visible = false;

# Updates visual elements
# Old: Re-code literally all of this it's so bad
# Update: it's done. it's beautiful. I also hate it. bye.
# Update Update: There's still a couple glitches, but overall it works properly
func _updateCharCards(target, hpChanged: bool, epChanged: bool, buffsChanged: bool, statusChanged: bool):
	if(hpChanged):
		var hpFill = 120 * (target.currentHP/target.maxHP);
		target.HPBar.get_node("color").polygon = [Vector2(0,0), Vector2(hpFill, 0), Vector2(hpFill, 20), Vector2(0, 20)];
		target.HPNum.text = String(target.currentHP);
		if(target.HPBar.get_node("reduceColor").polygon[1].x > hpFill): createHPBarAnimation(target, hpFill);
		target.HPBar.get_node("reduceColor").polygon = [Vector2(0,0), Vector2(hpFill,0), Vector2(hpFill,20), Vector2(0, 20)];
	if(epChanged):
		var epFill = 120 * (target.currentEP/target.maxEP);
		target.EPBar.get_node("color").polygon = [Vector2(0,0), Vector2(epFill, 0), Vector2(epFill, 20), Vector2(0, 20)];
		target.EPNum.text = String(target.currentEP);
		print(target.EPBar.get_node("reduceColor").polygon[1].x);
		print(target.EPBar.get_node("color").polygon[1].x);
		print(epFill);
		if(target.EPBar.get_node("reduceColor").polygon[1].x > epFill): createEPBarAnimation(target, epFill);
		target.EPBar.get_node("reduceColor").polygon = [Vector2(0,0), Vector2(epFill,0), Vector2(epFill,20), Vector2(0, 20)];
	if(buffsChanged):
		var bdBar = target.card.get_node("AnimationGroup/BuffDebuffBar");
		for b in 5:
			for e in 5:
				if(e < target.buffs[b]):
					bdBar.get_node(String(b) + "Icon/Buffs/BuffArrow" + String(e)).visible = true;
				else:
					bdBar.get_node(String(b) + "Icon/Buffs/BuffArrow" + String(e)).visible = false;
	if(statusChanged):
		var statusEffectGrid = target.card.get_node("AnimationGroup/StatusEffects");
		var statuses = statusEffectGrid.get_children();
		for n in statusEffectGrid.get_children():
			statusEffectGrid.remove_child(n);
			n.free();
		
		for status in target.statusEffects:
			var statusEffectNode = load("res://Scenes/Elements/StatusIcon.tscn").instance();
			statusEffectNode.texture = status.icon;
			statusEffectGrid.add_child(statusEffectNode);

# Constructs an animation for HP Bar reducing on the fly
# TODO(?): Make a slowly increasing animation as well
func createHPBarAnimation(c: Character, hpFill: float):
	#c.HPBar.get_node("reduceColor/AnimationPlayer").remove_animation("HPReduce");
	var polygonPath = NodePath("polygon");
	var animation = Animation.new();
	var track_index = animation.add_track(Animation.TYPE_VALUE);
	animation.track_set_path(track_index, NodePath(c.HPBar.get_node("reduceColor").get_path() as String + polygonPath.get_as_property_path()));
	animation.track_insert_key(track_index, 0.0, c.HPBar.get_node("reduceColor").polygon);
	animation.track_insert_key(track_index, 0.5, c.HPBar.get_node("reduceColor").polygon);
	animation.track_insert_key(track_index, 1.0, c.HPBar.get_node("color").polygon);
	animation.length = 2.0;

	c.HPBar.get_node("reduceColor/AnimationPlayer").add_animation("HPReduce", animation);
	c.HPBar.get_node("reduceColor/AnimationPlayer").play("HPReduce");

# Constructs an animation for EP Bar reducing on the fly
func createEPBarAnimation(c: Character, epFill: float):
	c.EPBar.get_node("reduceColor/AnimationPlayer").remove_animation("EPReduce");
	var polygonPath = NodePath("polygon");
	var animation = Animation.new();
	var track_index = animation.add_track(Animation.TYPE_VALUE);
	animation.track_set_path(track_index, NodePath(c.EPBar.get_node("reduceColor").get_path() as String + polygonPath.get_as_property_path()));
	animation.track_insert_key(track_index, 0.0, c.EPBar.get_node("reduceColor").polygon);
	animation.track_insert_key(track_index, 0.5, c.EPBar.get_node("reduceColor").polygon);
	animation.track_insert_key(track_index, 1.0, c.EPBar.get_node("color").polygon);
	animation.length = 2.0;
	
	c.EPBar.get_node("reduceColor/AnimationPlayer").add_animation("EPReduce", animation);
	c.EPBar.get_node("reduceColor/AnimationPlayer").play("EPReduce");

# Listener for button on Player1. Shifts Player1 card up and displays their tech menu
func _on_Player1Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftUp");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(1);
	currentPlayer = 1;

# Listener for button on Player2. Shifts Player2 card up and displays their tech menu
func _on_Player2Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftUp");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(2);
	currentPlayer = 2;

# Listener for button on Player3. Shifts Player3 card up and displays their tech menu
func _on_Player3Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftUp");
	$"Player4/AnimationPlayer".play("ShiftDown");
	display_TechMenu(3);
	currentPlayer = 3;

# Listener for button on Player4. Shifts Player4 card up and displays their tech menu
func _on_Player4Button_pressed():
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftUp");
	display_TechMenu(4);
	currentPlayer = 4;

# Listener for the TechMenuExitButton. Closes the tech menu and shifts any up player cards down
func _on_TechMenuExitButton_pressed():
	$TechMenu.visible = false;
	$ControlPalette.visible = true;
	$Dialog.visible = false;
	$"Player1/AnimationPlayer".play("ShiftDown");
	$"Player2/AnimationPlayer".play("ShiftDown");
	$"Player3/AnimationPlayer".play("ShiftDown");
	$"Player4/AnimationPlayer".play("ShiftDown");
	currentPlayer = 0;

# Pans to next tab on Tech Menu
func _on_RButton_pressed():
	currentMenu += 1;
	if currentMenu > 2:
		currentMenu = 0;
	display_TechMenu(currentPlayer);

# Pans to previous tab on Tech Menu
func _on_LButton_pressed():
	currentMenu -= 1;
	if currentMenu < 0:
		currentMenu = 2;
	display_TechMenu(currentPlayer);

func _on_DayAr_pressed():
	print("dayAr pressed");
	dWallaFadeIn = true;
	nWallaFadeOut = true;
	dLayerFadeIn = true;
	nLayerFadeOut = true;
	naLayerFadeOut = true;


func _on_NightAr_pressed():
	print("nightAr pressed");
	dWallaFadeOut = true;
	nWallaFadeIn = true;
	dLayerFadeIn = true;
	nLayerFadeIn = true;
	naLayerFadeOut = true;


func _on_Day_pressed():
	print("day pressed");
	dWallaFadeIn = true;
	nWallaFadeOut = true;
	dLayerFadeOut = true;
	nLayerFadeOut = true;
	naLayerFadeOut = true;


func _on_Night_pressed():
	print("night pressed");
	dWallaFadeOut = true;
	nWallaFadeIn = true;
	dLayerFadeOut = true;
	nLayerFadeIn = true;
	naLayerFadeOut = true;


func _on_Hell_pressed():
	print("hell pressed");
	dWallaFadeOut = true;
	nWallaFadeOut = true;
	dLayerFadeOut = true;
	nLayerFadeOut = true;
	naLayerFadeIn = true;
