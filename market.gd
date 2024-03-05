extends Control

class_name Market

@export var woodOutput:RichTextLabel
@export var chairOutput:RichTextLabel

@export var tradeGood = "wood"
#@export_category("{0} Work".format(tra))

@export var wood_supply = 0
@export var wood_price = 1.0
@export var demand_history = []
@export var supply_history = []
@export var workerListEntities:Array[]
@export var chairs_made = 0

var totalWoodSupply = 0

var time = 0
var interval = 2.5

#var w = Woodsman.new()

func simulateMarket():
	workerListEntities.append(Woodsman.new())
	#var genWood = w.gatherwood()
	#w.updateVisuals()

func _ready():
	workerListEntities.append(Woodsman.new())
	#workerList.append(Woodsman.new())
	# Setup market update timer
	#var market_timer = Timer.new()
	#market_timer.wait_time = 2.5 / 60.0  # Assuming 60 FPS, adjust for your frame rate
	#market_timer.autostart = true
	#market_timer.one_shot = false
	#market_timer.connect("timeout", self, "_on_market_update")
	#add_child(market_timer)
	
	
func _process(delta):
	time +=delta
	
	if time >= interval:
		simulateMarket()
		time =0
	

func _on_market_update():
	# Generate wood
	var wood_generated = randi_range(1, 100)
	wood_supply += wood_generated
	totalWoodSupply += wood_generated
	woodOutput.text = wood_supply
	# Adjust price based on historical supply and demand
	adjust_wood_price()
	
	# Log supply for the current frame
	supply_history.append(wood_generated)
	
	# Assume demand calculation happens elsewhere, and demand history is updated accordingly
	# ...

	# Update wood supply in market owned by woodworker
	# ...

	# Here, implement player interactions with the market, buying and crafting
	# ...


func adjust_wood_price():
	# Simplified price adjustment logic
	var timeOfDemand = demand_history.size()
	
#	var demand = demand_history.size() > 0 ? demand_history.back() : 0
#	var supply = supply_history.size() > 0 ? supply_history.back() : wood_supply

#	wood_price = max(0.1, wood_price * (demand / max(supply, 1)))
	# Ensure price doesn't fall below a minimum value for game balance reasons

func player_craft_chair(player_id, amount_of_wood_used):
	var base_value = 4
	var chair_value = base_value * (1 - (chairs_made / max(wood_price, 1)))
	# Here you would check if the player has enough wood to craft the chair
	# and then update the number of chairs made
	chairs_made += 1
	# Update the player's inventory and currency accordingly
	# ...

# ... Rest of your game logic ...
