extends Label

var score : int = 0

#Hier setzte ich einfach am anfang den Text auf 0,
#sonst würde er den text anzeigen der rechts im Inspector steht
func _ready() -> void:
	text = str(0)

func score_update() -> void:
	score += 100
	text = str(score)

#Hier empfange ich das Signal und update text mit dem score
func _on_area_2d_score_update() -> void:
	score_update()
