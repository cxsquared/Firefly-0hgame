package ;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import openfl.display.BlendMode;
import flixel.util.FlxRandom;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Light extends FlxSprite
{	
	private var darkness:FlxSprite;

	public function new(x:Int, y:Int, darkness:FlxSprite):Void {
			super(x, y, AssetPaths.glowLight__png);
			
			this.darkness = darkness;
			this.blend = BlendMode.SCREEN;
	}
	
	override public function update():Void {
		if (FlxG.game.ticks % 60 == 0) {
			this.alpha = FlxRandom.floatRanged(0.5, 1.0);
		}
	}
	
	override public function draw():Void {
		var screenXY:FlxPoint = getScreenXY();
		
		darkness.stamp(this, Std.int(screenXY.x - this.width / 2), Std.int(screenXY.y - this.height / 2));
	}
	
}