class Profile < ApplicationRecord
	# Associations
	belongs_to :user

	# Validations
	# validates :fullname, presence: true
	validates_presence_of :first_name, :second_name, :last_name
		# :adress, :city, :state, :gender, :birthday, :rol, :bio

	# validates_format_of :phone_number,
	# 	with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
	# 	message: " - El número de telefono debe tener el formato xxx-xxx-xxxx."

	# Scopes para consultas en ActiveRecord
	scope :mayor_que, ->(date) { where("birthday > ?", date) }

	# Para obtener la edad en las vistas
	def age(birthday)
		(Time.now.to_s(:number).to_i - birthday.to_time.to_s(:number).to_i)/10e9.to_i
	end
end
