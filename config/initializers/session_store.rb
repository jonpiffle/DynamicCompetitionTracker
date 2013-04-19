# Be sure to restart your server when you modify this file.

Eecs341::Application.config.session_store :cookie_store, :key => '_eecs341_session'

# Use the database for hangouts instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the hangout table with "rails generate hangout_migration")
# Eecs341::Application.config.hangout_store :active_record_store
