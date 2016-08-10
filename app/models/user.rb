class User < ApplicationRecord
	# Associations
	has_one :profile, dependent: :destroy, autosave: true

	# Allow saving of attributes on associated records through the parent,
	# :autosave option is automatically enabled on every association
	accepts_nested_attributes_for :profile

	# === Devise Configs ===
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:confirmable
end
