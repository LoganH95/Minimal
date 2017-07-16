using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class TimeDisplay {
	hidden var width, height, font; 


	function initialize() { 
		 font = Ui.loadResource(Rez.Fonts.id_font);
    }
	
    function displayTime(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	
    	var hour = calculateHour(); 
		
	    var hourOnes = hour % 10; 
	    var hourTens = hour / 10; 
	    var hourStringOnes = Lang.format("$1$", [hourOnes]);
	    var hourStringTens = Lang.format("$1$", [hourTens]);
	    
	    var minOnes = Sys.getClockTime().min % 10; 
	    var minTens = Sys.getClockTime().min / 10;
	    var minStringOnes = Lang.format("$1$", [minOnes]);
	    var minStringTens = Lang.format("$1$", [minTens]); 
	    
	    drawTime(dc, hourStringTens, hourStringOnes, minStringTens, minStringOnes); 
    }
    
    function drawTime(dc, hourTens, hourOnes, minTens, minOnes) {
    	dc.setColor(Color.getHourColor(), Gfx.COLOR_TRANSPARENT);
	    dc.drawText(width/8 + 5, 20, font, hourTens, Gfx.TEXT_JUSTIFY_CENTER);
	    dc.drawText(width/8 * 3 + 5, 20, font, hourOnes, Gfx.TEXT_JUSTIFY_CENTER);
	    
	    dc.setColor(Color.getMinuteColor(), Gfx.COLOR_TRANSPARENT);
	    dc.drawText(width/8 * 5 + 5, 20, font, minTens, Gfx.TEXT_JUSTIFY_CENTER);
	    dc.drawText(width/8 * 7 + 5, 20, font, minOnes, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    function calculateHour() {
    	var time = Sys.getClockTime(); 
    	var mode = Sys.getDeviceSettings().is24Hour;
    	
    	if (!mode && time.hour > 12) {
	    	return  time.hour - 12; 
	    } else {
	        if (!mode && time.hour == 0) {
	        	return time.hour + 12;
	        } else {
	       	 	return time.hour; 
	       	}
	    }
    }
}