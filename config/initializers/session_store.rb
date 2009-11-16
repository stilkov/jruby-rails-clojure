# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jtestapp_session',
  :secret      => 'c62595aca4d28827302df53e7f92ac03117043c801d1e4ee39dab104fbcaa29ac43f835427725c11a0aecc5e622817773a2761e8da2d40d7ab99af5d1d34e386'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
