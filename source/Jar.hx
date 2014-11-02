package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxRandom;

/**
 * ...
 * @author ...
 */
class Jar extends FlxSprite
{
	public var dir:Int;
	public var speed:Int = 100;

	public function new()
	{
		dir = FlxRandom.intRanged(0, 3);
		if (dir == 0) {
			super(FlxRandom.intRanged(0, FlxG.width), FlxG.height + 50);
			makeGraphic(75, 100, FlxColor.BLUE);
		} else if (dir == 2) {
			super(FlxRandom.intRanged(0, FlxG.width), -50);
			makeGraphic(75, 100, FlxColor.BLUE);
		}  else if (dir == 3) {
			super( -50, FlxRandom.intRanged(0, FlxG.height));
			makeGraphic(100, 75, FlxColor.BLUE);
		}  else if (dir == 4) {
			super(FlxG.width + 50, FlxRandom.intRanged(0, FlxG.height));
			makeGraphic(100, 75, FlxColor.BLUE);
		}
		drag.x = 50;
		drag.y = 50;	
	}
	
	override public function update():Void {
		super.update();
		
		if (dir == 1) {
			velocity.y = -speed;
			if (y - height < 0) {
				if (this.alive){
				PlayState.score++;
				}
				kill();
			}
		} else if (dir == 2) {
			velocity.y = speed;
			if (y + height > FlxG.height) {
				if (this.alive){
				PlayState.score++;
				}
				kill();
			}
		} else if (dir == 3) {
			velocity.x = speed;
			if (x + width > FlxG.width) {
				if (this.alive){
				PlayState.score++;
				}
				kill();
			}
		} else if (dir == 4) {
			velocity.x = -speed;
			if (x - width < 0) {
				if (this.alive){
				PlayState.score++;
				}
				kill();
			}
		}
	}
	
}