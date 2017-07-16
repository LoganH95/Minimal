using Toybox.Graphics as Gfx;

class Layout {
    
    static function displayInfo(dc) {
    	var width = dc.getWidth();
    	var height = dc.getHeight();
    	
    	dc.setColor(Color.getSecondaryColor(), Gfx.COLOR_TRANSPARENT);
    	
    	var inverter = checkInverted(); 
    	var symbol = new Symbol(); 
    	
    	symbol.drawBluetooth(dc, width/2 - 24, 4, inverter);
    	symbol.drawNotification(dc, width/2 + 10, 2, inverter);
    	symbol.drawBattery(dc, width);
    	StatsDisplay.drawDate(dc, width/2, 17, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    hidden static function checkInverted() {
    	return Color.getBackgroundColor() != Gfx.COLOR_BLACK;
    }
}