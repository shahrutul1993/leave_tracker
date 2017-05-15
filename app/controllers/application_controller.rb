class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include DeviseWhitelist

	def after_sign_in_path_for(resource)
  		leave_index_path
	end

	def after_sign_out_path_for(resource_or_scope)
    	pages_path
  	end

end
