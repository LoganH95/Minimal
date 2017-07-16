using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class StatsDisplay {

	function drawDate(dc, x, y, font, justification) {
		var date = Calendar.info(Time.now(), Time.FORMAT_MEDIUM);
		var dateFormat = App.getApp().getProperty("dateFormat");
		var dateString; 
		if (!dateFormat) {
			dateString = Lang.format("$1$ $2$ $3$" , [date.day_of_week, date.month, date.day]);
		  	if (date.day_of_week.equals("Thurs") || date.day_of_week.equals("Thur")) {
				dateString = Lang.format("$1$ $2$ $3$" , ["Thu", date.month, date.day]);
			}
		}
		else {
			dateString = Lang.format("$1$ $2$ $3$" , [date.day_of_week, date.day, date.month]);
		  	if (date.day_of_week.equals("Thurs") || date.day_of_week.equals("Thur")) {
				dateString = Lang.format("$1$ $2$ $3$" , ["Thu", date.day, date.month]);
			}
		}
		dc.drawText(x, y, font, dateString, justification);
	}
}