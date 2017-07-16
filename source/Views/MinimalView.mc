using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class MinimalView extends Ui.WatchFace {
	hidden var font; 
	hidden var time  = new TimeDisplay();
	
    function initialize() {
        WatchFace.initialize();
    }

    //! Update the view
    function onUpdate(dc) {
    	resetScreen(dc);
    	time.displayTime(dc);
    	Layout.displayInfo(dc);
    }
    
    hidden function resetScreen(dc) {
    	dc.setColor(Color.getBackgroundColor(), Color.getBackgroundColor());
		dc.clear();
    }
}
