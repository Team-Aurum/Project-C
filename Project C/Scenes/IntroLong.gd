extends AudioStreamPlayer

var triggered = false;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playback = get_playback_position();
	var stopTime = get_stream().get_length() - 0.02;
	if((playback >= stopTime) && !triggered):
		get_node("Loop").set_volume_db(0.0);
		get_node("Loop").play(0.0);
		print(get_node("Loop").is_playing());
		triggered = true;


func _on_IntroLong_finished():
	pass
#	play(get_playback_position() - 0.1);
#	get_node("Loop").set_volume_db(0.0);
#	get_node("Loop").play(0.0);
#	print(get_node("Loop").is_playing());
