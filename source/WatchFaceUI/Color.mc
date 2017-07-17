using Toybox.Graphics as Gfx;
using Toybox.Application as App;

class Color {
    
    static function getHourColor() {
    	var hourColor = App.getApp().getProperty("color_hour");
    	return hourColor ? checkConflictingColors(hourColor) : checkConflictingColors(Gfx.COLOR_WHITE);
    }
    
    static function getMinuteColor() {
    	var minuteColor = App.getApp().getProperty("color_minute");
    	return minuteColor ? checkConflictingColors(minuteColor) : Gfx.COLOR_RED;
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
		return App.getApp().getProperty("id_invert") ? Gfx.COLOR_BLACK : Gfx.COLOR_WHITE;
    }
    
    static function getBackgroundColor() {
    	return App.getApp().getProperty("id_invert") ? Gfx.COLOR_WHITE : Gfx.COLOR_BLACK;
    }
}