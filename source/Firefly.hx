package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;

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
		
		this.x = FlxG.mouse.screenX - this.width/2;
		this.y = FlxG.mouse.screenY - this.height/2;
		
		FlxSpriteUtil.screenWrap(this, true, true, true, true);
	}
	
}