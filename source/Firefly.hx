package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Firefly extends FlxSprite
{
	
	private var speed:Int = 75;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		
		if (SimpleGraphic == null) {
			makeGraphic(25, 25, FlxColor.YELLOW);
		}
		
		drag.x = 50;
		drag.y = 50;
		
	}
	
	override public function update():Void {
		super.update();
		
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			velocity.x = -speed;
		}
		
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			velocity.x = speed;
		}
		
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			velocity.y = -speed;
		}
		
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			velocity.y = speed;
		}
		
		if (this.x + this.width / 4 > FlxG.width) {
			this.x = 0 + this.width/4;
		} 
		
		if (this.x - this.width / 4 < 0) {
			this.x = FlxG.width - this.width/4;
		}
		
		if (this.y + this.height / 4 > FlxG.height) {
			this.y = 0 + this.height/4;
		} 
		
		if (this.y - this.height / 4 < 0) {
			this.y = FlxG.height - this.height/4;
		}
	}
	
}