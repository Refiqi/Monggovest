# frozen_string_literal: true

# Serializer for Whitelisting what Data can be Shown or Fetched in JSON.
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name,
             :role, :created_at, :updated_at,
             :last_login, :reset_password_token
end
