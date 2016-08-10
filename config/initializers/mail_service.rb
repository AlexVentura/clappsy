# For sending via SMTP, provide the string 'apikey' as the SMTP username, and use your API Key as the password.

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	# :address				=> 'smtp.gmail.com',
	:address				=> 'smtp.sendgrid.net',
	:port					=> '587',  # ports 587 and 2525 are also supported with STARTTLS
	:authentication			=> :plain,
	:user_name				=> 'apikey',
	:password				=> ENV['SECRET_SENDGRID_API_KEY'],
	:domain					=> 'matchxperience.com',
	:enable_starttls_auto	=> true
}
