package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	private var playBtn:FlxButton;
	
	private var star:FlxStarField2D;
	
	private var title:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		playBtn = new FlxButton(0, 0, "Start", startClick);
		
		FlxSpriteUtil.screenCenter(playBtn, true, true);
		
		star = new FlxStarField2D(0, 0, FlxG.width, FlxG.height);
		
		star.setStarSpeed(1, 20);
		star.setStarDepthColors(10, FlxColor.CHARTREUSE, FlxColor.YELLOW);
		star.bgColor = FlxColor.TRANSPARENT;
		
		title = new FlxText(0, 25, FlxG.width, "Fireflies", 72);
		title.alignment = "center";
		
		FlxSpriteUtil.screenCenter(title, true, false);
		
		add(title);
		add(star);
		add(playBtn);
	}
	
	private function startClick():Void {
		FlxG.switchState(new PlayState());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}