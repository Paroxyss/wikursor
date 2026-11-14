class_name LevelProperties extends Node2D
var player : CharacterBody2D
@onready
var size = ($Fond.get_rect().end - $Fond.get_rect().position) * $Fond.scale
@export var playerSpawn : Node2D
@export var spawnList : Array[Spawner]
