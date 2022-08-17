extends Node2D


# Colors
# Fire: f65858
# Ice: 58b0f6
# Lightning: e6f658
# Wind: 58f69d
# Physical/Special: c2d0e5
# Healing: 7cbd5e
# Buffing: db914f
# Debuffing: 4f79db
# Burst Tech: ce9be3



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func display_TechMenu():
	$TechMenu.visible = true;
	$ControlPalette.visible = false;

func _on_Player1Button_pressed():
	$Player1/AnimationPlayer.play("ShiftUp");
	$Player2/AnimationPlayer.play("ShiftDown");
	$Player3/AnimationPlayer.play("ShiftDown");
	$Player4/AnimationPlayer.play("ShiftDown");
	display_TechMenu();


func _on_Player2Button_pressed():
	$Player1/AnimationPlayer.play("ShiftDown");
	$Player2/AnimationPlayer.play("ShiftUp");
	$Player3/AnimationPlayer.play("ShiftDown");
	$Player4/AnimationPlayer.play("ShiftDown");
	display_TechMenu();


func _on_Player3Button_pressed():
	$Player1/AnimationPlayer.play("ShiftDown");
	$Player2/AnimationPlayer.play("ShiftDown");
	$Player3/AnimationPlayer.play("ShiftUp");
	$Player4/AnimationPlayer.play("ShiftDown");
	display_TechMenu();


func _on_Player4Button_pressed():
	$Player1/AnimationPlayer.play("ShiftDown");
	$Player2/AnimationPlayer.play("ShiftDown");
	$Player3/AnimationPlayer.play("ShiftDown");
	$Player4/AnimationPlayer.play("ShiftUp");
	display_TechMenu();


func _on_TechMenuExitButton_pressed():
	$TechMenu.visible = false;
	$ControlPalette.visible = true;
	$Player1/AnimationPlayer.play("ShiftDown");
	$Player2/AnimationPlayer.play("ShiftDown");
	$Player3/AnimationPlayer.play("ShiftDown");
	$Player4/AnimationPlayer.play("ShiftDown");
