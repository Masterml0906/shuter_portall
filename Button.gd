extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	cells_load()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	pass # Replace with function body.
	var cells = $ "../../TileMap".get_used_cells()
	print(cells)
	cells_save(cells)
	
	
	
func cells_save (cells):
	var file = File.new()
	file.open("res://save.dot",file.WRITE)
	var cells_new=[]
	for cell in cells:
		cells_new.append(Vector3(cell.x,cell.y,$"../../TileMap".get_cell(cell.x,cell.y)))
	file.store_var(cells_new)
	file.close() 

func cells_load():
	var file= File.new()
	if file.file_exists("res://save.dot"):
		file.open("res://save.dot",File.READ)
		var cells= file.get_var()
		file.close()
		var tilemap= $"../../TileMap"
		tilemap.clear()
		for cell in cells:
			#tilemap.set_cellv(cell,0)
			$"../../TileMap".set_cellv(Vector2(cell.x,cell.y), cell.z)
	
	
	