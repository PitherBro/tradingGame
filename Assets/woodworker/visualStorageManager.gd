extends TextureProgressBar

var tickLimit = 2.5
var counter = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(counter >= tickLimit):
		counter =0
		
		
	pass
