extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var loop;
var first = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	#loop = load("res://NjordNightLoop.wav");
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_playback_position() > 1 && first && get_volume_db() == 0):
		get_node("Audio2").set_volume_db(0);
		set_volume_db(-80);
		print(volume_db);
		first = false;
#	pass

func _on_Audio2_finished():
	print(get_node("Audio2").volume_db); #potentially remove if the loop mode works
