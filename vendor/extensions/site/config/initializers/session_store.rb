# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mystore_session',
  :secret      => 'ed5c4ec96754cf9db473c101c00286ef9791b2c9b228ade3a804e7ab822c3f8701a4d03471823ea73d0d2a2fe1c8de914407fc3e84b395a95631b7cd2aa250b9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store