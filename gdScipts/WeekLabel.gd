extends Label

var weeks_passed = 0  # Initialize the number of weeks
var elapsed_real_time = 0  # Initialize the elapsed real-time
var seconds_per_gameplay_week = 10 * 60  # 10 minutes in seconds

func _ready():
	update_weeks_display()

func _process(delta):
	# Update elapsed real-time
	elapsed_real_time += delta
	
	# Check if a week has passed
	if elapsed_real_time >= seconds_per_gameplay_week:
		weeks_passed += 1
		elapsed_real_time -= seconds_per_gameplay_week
		update_weeks_display()
		
	#check if the game should end after 12 weeks
	if weeks_passed >=12:
		end_game() # call a function to end the game

func get_gameplay_time():
	# Return the total gameplay time in seconds
	return weeks_passed * seconds_per_gameplay_week

func update_weeks_display():
	text = "Week: " + str(weeks_passed)
	
func end_game():
	#access the current scene make call to exit game
	get_tree().quit()
	