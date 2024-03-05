extends Control
 
class_name Woodsman

static var totalWoodSupply = 0

@export var sprite: TextureRect
@export var statblock: RichTextLabel
@export var upgradeBtn: Button
@export var workerProgress: TextureProgressBar
@export var entity: woodcutter


enum workerSkills{
	woodcutter=0
}
##########################################
class Skill extends  Resource:
	func _init( id =0 ,name = "woodcutter"):
		self.maxValue = 42
		self.minValue = 1
		self.level = self.randLevel()
		self.name = "{0}-{1}-{2}".format([id, name, self.level])
		self.baseCost = 2

		self.skillIncrease = .25
	func randLevel():
		return randi_range(self.minValue,self.maxValue)
	func getSkillCost():
		return (self.baseCost * self.level)/(self.level/self.maxValue)
##########################################
class woodcutter extends Resource:
	func _init( id = 0, skill=Skill.new(),diff=self.genDiff()):
		self.id = id
		self.skill = skill
		self.name = "{0}-{1}".format([self.skill.name,id])
		self.diff = diff
		self.inv = 0
		self.wealth = 0
		self.effBoonus = 0
		self.personalLog = []
	func gatherWood():
		var rawYeild = int(genDiff()/self.skill.level)
		var bounusYeild = self.effBoonus * rawYeild
		var yeild = rawYeild + bounusYeild
		return yeild
	func genDiff():
		return randi_range(1,(9*6*3*42))
	func trainSkill():
		if self.wealth >= self.skill.getSkillCost():
			self.effboonus += self.skillIncrease
##########################################
func updateVisuals(resourceYeild = 0):
		statblock.text = """
Worker: {0}
Yeild: {1}
Wealth: {2}
""".format([self.name, resourceYeild, self.wealth])


# Called when the node enters the scene tree for the first time.
func _ready():
	statblock = $VBoxContainer/VBoxContainer/HBoxContainer/statblock
	upgradeBtn = $VBoxContainer/VBoxContainer/HBoxContainer/Button
	sprite = $VBoxContainer/VBoxContainer/HBoxContainer/TextureRect
	workerProgress = $VBoxContainer/VBoxContainer/ProgressBar
	entity = woodcutter.new()
	pass # Replace with function body.

