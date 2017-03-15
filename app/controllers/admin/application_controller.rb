class Admin::ApplicationController < ApplicationController
	
	protect_from_forgery
	before_filter :authenticate_admin!
    before_filter :admin_user

    def admin_user
     Sessionadmin.current = current_admin
    end
end
