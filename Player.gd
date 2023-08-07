extends CharacterBody2D

var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = $'.' # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = Input.get_axis("ui_left", "ui_right")
	velocity.y = Input.get_axis("ui_up", "ui_down")
	velocity.y /= 2
	velocity = velocity.normalized() * speed
func _physics_process(delta):
	move_and_slide()
