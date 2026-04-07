extends Node2D

func _ready() -> void:
	var folder_path = "assets/optimizer/dist/optimizer/"
	var exe_path = folder_path + "optimizer.exe"
	var infile_path = folder_path + "test_infile.plant"
	
	OS.create_process(exe_path, [infile_path], true)
	
