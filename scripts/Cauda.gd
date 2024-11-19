extends Marker2D

@onready var cauda: Marker2D = $"."
@onready var personagem: CharacterBody2D = $"../.."
@onready var ray_cast: RayCast2D = $"../../RayCast2D"


var caudaSen = 0
var chao = 203
var x = 0
var increment = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	caudaSen = sin(x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x = x + increment
	cauda.position.x = caudaSen
	if ray_cast.is_colliding():
		caudaSen = 100 * sin(x/4)
		cauda.position.y = ray_cast.position.y + 90
	if !ray_cast.is_colliding():
		caudaSen = 20 * sin(x/4)
		cauda.position.y = chao
