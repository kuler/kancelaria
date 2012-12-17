class DatetimeRangeInput < SimpleForm::Inputs::Base
  def input
    date_input_html = input_options[:date_input_html]
    date_input_html[:class] = "date-selector"
    time_input_html = input_options[:time_input_html]
    time_input_html[:class] = "time-selector"
    
    out = template.content_tag :div, class: "input-append" do                          
      o = @builder.input "#{object.send(attribute_name)[:_from_symbol]}_date", wrapper: :simple, input_html: date_input_html
      o += template.content_tag :span, class: "add-on" do 
        template.content_tag :i, nil, class: "icon-calendar"
      end
    end   
    out += template.raw "&nbsp;&nbsp;&nbsp;"
    out += template.content_tag :div, class: "input-append" do                          
      o = @builder.input "#{object.send(attribute_name)[:_from_symbol]}_time", wrapper: :simple, input_html: time_input_html
      o += template.content_tag :span, class: "add-on" do 
        template.content_tag :i, nil, class: "icon-time"
      end
    end
    out += template.raw " &dash; "
    out += template.content_tag :div, class: "input-append" do                          
      o = @builder.input "#{object.send(attribute_name)[:_to_symbol]}_time", wrapper: :simple, input_html: time_input_html
      o += template.content_tag :span, class: "add-on" do 
        template.content_tag :i, nil, class: "icon-time"
      end
    end   
       
  end  
end
