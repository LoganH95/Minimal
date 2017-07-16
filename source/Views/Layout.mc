using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class Layout {
	hidden var width, height; 
	hidden var stats = new StatsDisplay(); 

	function initialize() {
    }
    
    function displayInfo(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	
    	dc.setColor(Color.getSecondaryColor(), Gfx.COLOR_TRANSPARENT);
    	
    	var inverter = checkInverted(); 
    	var symbol = new Symbol(); 
    	
    	symbol.drawBluetooth(dc, width/2 - 24, 3, inverter);
    	symbol.drawNotification(dc, width/2 + 10, 2, inverter);
    	stats.drawDate(dc, width/2, 17, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
    	symbol.drawBattery(dc, width);
    }
    
    function checkInverted() {
    	var background = Color.getBackgroundColor();
    	
    	if (background == Gfx.COLOR_BLACK) {
    		return false; 
    	}
    	return true; 
    }
}