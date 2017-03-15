class Allcommon < ActiveRecord::Base
   self.abstract_class = true

   def self.page_config(params)
     data = paginate(page: params[:page])
     return data
	end

    def self.pagesearch(params)
      value=search(params[:search])
  	return value
    end

end