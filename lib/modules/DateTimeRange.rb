module Modules
  module DateTimeRange
    def self.included(base)
      base.extend(self)
    end
  
    def has_datetime_range(name, params)      
      start_at = params[:from]
      finish_at = params[:to]
      
      attr_accessible start_at.to_sym, finish_at.to_sym, "#{start_at}_date".to_sym, "#{start_at}_time".to_sym, "#{finish_at}_date".to_sym, "#{finish_at}_time".to_sym
      attr_accessor name.to_sym, "#{start_at}_date".to_sym, "#{start_at}_time".to_sym, "#{finish_at}_date".to_sym, "#{finish_at}_time".to_sym
      
      # Range methos
      
      define_method name.to_sym do
        {
          from: send(start_at),
          _from_symbol: start_at,
          to: send(finish_at),
          _to_symbol: finish_at
        }
      end
      
      # Start methods      
      
      define_method "#{start_at}_date".to_sym do
        return nil if not send(start_at)
        send(start_at).strftime("%d/%m/%Y")
      end
            
      define_method "#{start_at}_date=".to_sym do |date|        
        if date == ""
          send("#{start_at}=", nil)
          send("#{finish_at}=", nil)
        else
          send("#{start_at}=", DateTime.new) if send(start_at) == nil
          send("#{finish_at}=", DateTime.new) if send(finish_at) == nil
          d = date.to_date
          send("#{start_at}=", send(start_at).change(year: d.year, month: d.month, day: d.day))
          send("#{finish_at}=", send(finish_at).change(year: d.year, month: d.month, day: d.day))
        end 
      end
      
      define_method "#{start_at}_time".to_sym do
        return nil if not send(start_at)
        send(start_at).strftime("%H:%M")
      end
       
      define_method "#{start_at}_time=".to_sym do |time|
        if time == ""
          return if send("#{start_at}=", nil)
          time = "00:00" 
        end
             
        send("#{start_at}=", DateTime.new) if send(start_at) == nil
        t = Time.parse(time)
        send("#{start_at}=", send(start_at).change( hour: t.hour, min: t.min))
      end
    
    # Finish methods
    
      define_method "#{finish_at}_date".to_sym do
        return nil if not send(finish_at)
        send(finish_at).strftime("%d/%m/%Y")
      end
            
      define_method "#{finish_at}_date=".to_sym do |date|
        
      end
      
      define_method "#{finish_at}_time".to_sym do
        return nil if not send(finish_at)
        send(finish_at).strftime("%H:%M")
      end
       
      define_method "#{finish_at}_time=".to_sym do |time|
        if time == ""
          return if send("#{finish_at}=", nil)
          time = "00:00" 
        end
             
        send("#{finish_at}=", DateTime.new) if send(finish_at) == nil
        t = Time.parse(time)
        send("#{finish_at}=", send(finish_at).change( hour: t.hour, min: t.min))
      end
      
    
    end
  end
end