extends StaticBody2D

onready var animation_tree = $AnimationTree
onready var state_machine = animation_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	Global.connect("Switch_Segment",self,"on_Switch_Segment")
# warning-ignore:return_value_discarded
	Global.connect("cliff_turn",self,"on_cliff_turn")
	state_machine.travel("scroll3")
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if Global.game_started:
		animation_tree.set_active(true)
	if Global.game_over:
		animation_tree.set_active(false)

func on_cliff_turn():
	state_machine.travel("fullscroll")

func on_Switch_Segment():
	state_machine.travel("scroll3")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "ComeUp":
		state_machine.travel("scroll3")
	pass
