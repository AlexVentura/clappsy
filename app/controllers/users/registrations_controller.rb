class Users::RegistrationsController < Devise::RegistrationsController
	# Add custom attributes to Devise
	before_filter :configure_permitted_parameters

	# GET /users/sign_up
	def new
		# Override Devise default behaviour and create a profile as well
		build_resource({})
		resource.build_profile
		respond_with self.resource
	end

	protected

	def configure_permitted_parameters
		# Permit Devise attributes + personalized ones in a hash
		devise_parameter_sanitizer.permit(:sign_up) { |user_params|
			user_params.permit(:email, :password, :password_confirmation,
				profile_attributes: [
					:first_name, :second_name, :last_name, :adress, :city, :state,
					:birthday
				]
			)
		}

		devise_parameter_sanitizer.permit(:account_update) do |user_params|
			user_params.permit(:password, :password_confirmation, :current_password,
				profile_attributes: [
					:first_name, :second_name, :last_name, :adress, :city, :state,
					:birthday
				]
			)
		end
	end

	def after_sign_up_path_for(resource)
		# session["user_return_to"] || root_path
		signed_in_root_path(resource)
		# events_path
	end

	def after_update_path_for(resource)
		signed_in_root_path(resource)
	end
end
