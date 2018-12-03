# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :role, :created_at, :updated_at, :last_login, :reset_password_token
end
