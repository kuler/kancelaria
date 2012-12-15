CalendarFilter = {
    btnSelectors: "#calendar-filters .filter-type",
    init: function(){
        $(CalendarFilter.btnSelectors).click(CalendarFilter.toggleType);
    },
    toggleType: function(e){
        tgl=$(e.target).attr("enables");
        CalendarFilter.applyFilters({ toggle: tgl })
    },                    
    applyFilters: function(params){
        $.post("filter.json", params!=undefined ? params : {}, CalendarFilter.setStates, "json");
    },
    setStates: function(filters){
        $.each(filters, function(k, v){
              $("button[enables="+k+"]").toggleClass("active", v);
        })
        $("#calendar").fullCalendar( 'refetchEvents' )
    }                    
                    
}

$(document).ready(CalendarFilter.init);