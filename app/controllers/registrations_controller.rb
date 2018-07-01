# class RegistrationsController < Devise::RegistrationsController
# 	before_filter :configure_account_update_params, only: [:update]
#
# 	protected
#
# 	def configure_account_update_params
# 		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
# 	end
#
# 	def update_resource(resource, params)
# 		resource.update_without_password(params)
# 	end
#
# end
