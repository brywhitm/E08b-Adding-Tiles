# E08b-Adding-Tiles

We will continue adding on to the first Godot project (E08a-Paddle-Ball). In this exercise, we will be learning more about groups and scenes and adding tiles to the game.

As usual, Fork and Clone this repository. Pay attention to where (on the file system) it is being saved.

 * Open Godot. In the project viewer, select Import.
 * Click Browse, and find the folder that contains your Cloned Project. Select the project.godot file and Open it. Import & Edit.
 * You should see the project in the state in which we left it at the end of class on Monday. We will now add the next steps.
 * In the Scene Panel, right-click on the World and Add Child Node. Add a "Node" and name it "Tiles"
 * Right-click on the new Tiles node and Add Child Node. Add a "Node" and name it "Gray Tiles"
 * Right-click on Gray Tiles and Add Child Node. Add a "StaticBody2D" and name it "Tile"
 * Right-click on Tile and Add Child Node. Add a "Sprite"
 * Select the Sprite and drag the "tile_gray.png" file from the Assets folder (in the FileSystem panel) to the Texture field in the Inspector Panel.
 * Right-click on Tile and Add Child Node. Add a "CollisionShape2D"
 * Select the CollisionShape2D and in the Inspector Panel, select the Shape dropdown. Select "New RectangleShape2D"
 * In the Viewport, change the dimensions of the CollisionShape2D to match the sprite. You may have to turn off Snapping
 * Select Tile in the Scene Panel, and "Make sure the children's objects are not selectable". You should see that icon appear next to the Tile Node in the Scene Panel
 * Drag the Tile about two-thirds of the way down the viewport, near the left side
 * Right-click on Tile and Attach Script. Save the script as "res://Scripts/tile.gd"
 * Remove lines 3–13 and replace them with the following:
 ```
 var gray = preload("res://Assets/tile_gray.png")
 var red = preload("res://Assets/tile_red.png")
 var blue = preload("res://Assets/tile_blue.png")
 var green = preload("res://Assets/tile_green.png")
 var purple = preload("res://Assets/tile_purple.png")

 onready var sprite = get_node("Sprite")
 var score = 10

func _ready():
    if get_parent().name == "Gray Tiles":
        sprite.set_texture(gray)
    if get_parent().name == "Red Tiles":
        sprite.set_texture(red)
        score = 20
    if get_parent().name == "Blue Tiles":
        sprite.set_texture(blue)
        score = 30
    if get_parent().name == "Green Tiles":
        sprite.set_texture(green)
        score = 40
    if get_parent().name == "Purple Tiles":
        sprite.set_texture(purple)
        score = 50
```
* Save Tile.gd
* Select the Tile and (in the tab next to the Inspector Panel), open the Node Panel
* Click the Groups tab, and type "Tiles" in the text box. Click the Add button
* Right-click on the Tile and select Save Branch as Scene. Save the scene in the Scenes folder as Tile.tscn
* Right-click on the Tile and Duplicate. Repeat this until you have Tile9 (nine tiles in total)
* Starting with Tile9, drag it toward the right side of the Viewport. Ultimately, you want a row of tiles, one grid space from each other. Repeat this process for Tile1–Tile8.
* Right-click on Tiles and Add Child Node. Add a "Node" and name it "Red Tiles"
* Right-click on Red Tiles and "Instance Child Scene". Choose Tile.tscn
* Move the new tile one space above the first tile in the Gray Tiles row. Duplicate it eight times and space them out so they resemble the tiles in the row below.
* Save the World scene and run the game. You should see a row of gray tiles and a row (above it) of red tiles.
* Repeat this process for "Blue Tiles", "Green Tiles", and "Purple Tiles"
* Right-click on Ball in the Scene Panel. Attach Script. Save the script as "res://Scripts/ball.gd"
* Remove lies 3–13 and replace them with the following:
```
func _ready():
    contact_monitor = true
    set_max_contacts_reported(4)

func _physics_process(delta):
    var bodies = get_colliding_bodies()
    for body in bodies:
        if body.is_in_group("Tiles"):
            body.queue_free()
    
    if position.y > get_viewport_rect().end.y:
        queue_free()
```
* Save the World Scene and run the game

If you have five rows of tiles that disappear when the ball hits them, and if the console prints "Died" when the ball falls off the bottom of the screen, you have completed the exercise. Save the Scene, edit your LICENSE and README, commit everything to Github, and turn in the URL of your repository on Canvas.
 
