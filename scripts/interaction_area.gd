extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass


func _on_body_entered(body) -> void:
	print("entered")
	InteractionManager.register_area(self)
	


func _on_body_exited(body) -> void:
	print("exited")
	InteractionManager.unregister_area(self)
	
