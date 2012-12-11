class SearchController < ApplicationController
    def results
    
        @query = params[:query]
        @results = {}
        @count = 0
        
        @results[:users]   = User.find(:all, :conditions => ['name LIKE ? or firstname LIKE ? or lastname LIKE ?', "%#{@query}%", "%#{@query}%", "%#{@query}%"])
        @count+=@results[:users].size
        
        @results[:clients] = Client.find(:all, :conditions => ['shortname LIKE ? or fullname LIKE ?', "%#{@query}%", "%#{@query}%"])
        @count+=@results[:clients].size
        
        @results[:cases]   = Case.find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%#{@query}%", "%#{@query}%"])
        @count+=@results[:cases].size           

        respond_to do |format|
            format.html # results.html.erb
            format.json { render json: @results }
        end
    end
end
