using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;


class Color {
    
    static function getHourColor() {
    	var hourColor = App.getApp().getProperty("color_hour");
    	if (hourColor == null) {
			hourColor = Gfx.COLOR_WHITE;  
		}
		hourColor = checkConflictingColors(hourColor); 
		
    	return hourColor;
    }
    
    static function getMinuteColor() {
    	var minuteColor = App.getApp().getProperty("color_minute");
    	if (minuteColor == null) {
			minuteColor = Gfx.COLOR_RED;  
		}
		minuteColor = checkConflictingColors(minuteColor); 
		
    	return minuteColor; 
    }
    
    static function checkConflictingColors(color) {
    	var invert = App.getApp().getProperty("id_invert");
    	if (!invert && color == Gfx.COLOR_BLACK) {
    		return Gfx.COLOR_WHITE; 
    	} else if (invert && color == Gfx.COLOR_WHITE) {
    		return Gfx.COLOR_BLACK; 
    	} else {
    		return color; 
    	}
    }
    
    static function getSecondaryColor() {
    	var invert = App.getApp().getProperty("id_invert");
    	if (!invert) {
			return Gfx.COLOR_WHITE; 
		}
		else {
			return Gfx.COLOR_BLACK; 
		}
    }
    
    static function getBackgroundColor() {
    	var invert = App.getApp().getProperty("id_invert");
    	if (!invert) {
			return Gfx.COLOR_BLACK;
		}
    	return Gfx.COLOR_WHITE; 
    }
}