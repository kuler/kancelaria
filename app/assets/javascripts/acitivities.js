function ActivitiesHelper(){
	$(document).ready($.proxy(this.init, this));
}

ActivitiesHelper.prototype.init = function(){
	var hi = $("input#activity_invoice_time");
	if(hi.length){
		this.hours_invoice = hi;
		
			
		this.started_at = $("#activity_started_at_time").change($.proxy(this.completed_at_changed, this));
		this.finished_at = $("#activity_finished_at_time").change($.proxy(this.completed_at_changed, this));
		this.hours_invoice.change($.proxy(this.hours_invoice_changed, this));
		
		if(this.hours_invoice.val()){
			var s = TimeHelper.time2int(this.started_at.val())
			var f = TimeHelper.time2int(this.finished_at.val())
			var h = TimeHelper.time2int(this.hours_invoice.val())
			if(f-s!=h)
				this.hours_invoice.addClass("do-not-update");
		}
		
	}
	
}

ActivitiesHelper.prototype.hours_invoice_changed = function(e){
	this.hours_invoice.addClass("do-not-update");
}

ActivitiesHelper.prototype.completed_at_changed = function(e){
	
	var which;
	if($(e.target).attr("id")==this.started_at.attr("id"))
		which = this.started_at
	else
		which = this.finished_at
	
	var s = 0;
    var f = 0;

    if(!this.started_at.val() && !this.finished_at.val())
		return;
    else if(!this.started_at.val()){
        f = TimeHelper.time2int(this.finished_at.val());
        s = f;
        this.started_at.val(TimeHelper.int2time(s));
    }
    else if(!this.finished_at.val()){
        s = TimeHelper.time2int(this.started_at.val());
        f = s;
        this.finished_at.val(TimeHelper.int2time(f));
    }
    else{
        s = TimeHelper.time2int(this.started_at.val())
        f = TimeHelper.time2int(this.finished_at.val())
    }
		
	if(f<s){
		if(which == this.started_at){
            f = s
			this.finished_at.val(TimeHelper.int2time(f));
        }
		else{
            s = f
			this.started_at.val(TimeHelper.int2time(s));
        }
	}
	
	if(!this.hours_invoice.hasClass("do-not-update"))
		this.hours_invoice.val(TimeHelper.int2time(f-s))
}

ah = new ActivitiesHelper();
