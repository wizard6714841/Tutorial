#Das gibt and in was für einem Objekt man sich befinden dadurch
#kann man dann auch auf verschiedene / Speziele atribute zugreifen
#Als beispiel kann man bei dem Label dann auf die Varable text zugreifen
extends Area2D

# Hiermit "Sende" ich die Variable score an das Label
signal score_update()

#Das sind meine Variablen, den : und den Varablen typ
#muss man nicht schreiben aber das macht es sicherer
var is_on_box : bool = false

var rand_min_x : int = -500
var rand_max_x : int = 500
var rand_min_y : int = -275
var rand_max_y : int = 275

# Diese Funktion wird aufgerufen sobald das spiel gestartet wird
func _ready() -> void:
	random_pos()

#Diese funktion wird in jedem frame aufgerufen, das _delta ist erstmal egal
func _process(_delta: float) -> void:
	if is_on_box and (Input.is_action_just_pressed("click")):
		random_pos()
		score_change()

#Die namen sollten für sich sprechen
func random_pos_x() -> float:
	return randf_range(rand_min_x, rand_max_x)

func random_pos_y() -> float:
	return randf_range(rand_min_y, rand_max_y)

func random_pos() -> void:
	position.x = random_pos_x()
	position.y = random_pos_y()

func score_change() -> void:
	score_update.emit() #Mit .emit(score) sende ich das Signal

#Diese beiden Funktionen werden aufgerufen sobald ich mit der Maus
#in den bereich der Area2D komme oder den bereich verlasse

#Das sind beides auch Signale wie oben
func _on_mouse_entered() -> void:
	is_on_box = true

func _on_mouse_exited() -> void:
	is_on_box = false
