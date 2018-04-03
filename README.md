# Screen Print
A Godot 3.X addon that allows you to print inside of the game window.

## Features
* Easy to use - just do `ScreenPrint.print("Hello world!")`
* Change display time and color per `print`
* Fully customizable settings
* Can optionally print to the Output log as well

## Installation
1. Download `/src/dist/addons.zip`
2. Go to the AssetLib in Godot
3. Click `Import` navigate to your downloads folder
4. Import `addons.zip` making sure to select all of the files.
5. Go to the `AutoLoad` tab in your project settings
6. Add `res://addons/screen_print` with the name `ScreenPrint` to AutoLoad

## How-to guide
### Printing
Messages are printed using the `ScreenPrint.print(string, color=default_color, time=default_time)` method.
##### Parameters:
*  `string`: string to print
* `color`: Text color, default value is `Color(1,0,1)` unless changed.
* `time`: Time the printed line is displayed, default value is `2.0` unless changed.
### Customization
Most values in Screen Print are customizable. Here's the list of settings that can be used.
##### `set_top_padding(int)`
* Default value: `5 `
* Sets padding from the top of the screen
##### `set_left_padding(int)`
* Default value: `5`
* Sets padding from the left of the screen
##### `set_default_color(Color)`
* Default value: `Color(1, 0, 1)`
* Sets default text color
##### `set_default_time(float)`
* Default value: `2.0`
* How long text is displayed on screen
##### `set_spacing(int)`
* Default value: `10`
* Sets the spacing between each printed line
##### `set_print_to_output(bool)`
* Default value: `false`
* If `true`, it will also print lines to the Output box.
## Tester/Showcase
The `/addons/screen_print/test_level` folder includes a scene with a bunch of controls for testing, but it also serves as a good showcase for the addon. Plus it's just kind of fun to play with. So if you're curious or just want to tinker with the settings, play the scene and experiment away!