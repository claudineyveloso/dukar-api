# frozen_string_literal: true

require 'bcrypt'

# Class User
class User < ApplicationRecord
  include BCrypt

  has_secure_password
  # mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                              message: 'O formato do e-mail está inválido.' }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  # validates :password,
  #          format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
  #                    message: 'A senha deve ter pelo menos uma letra minúscula,
  #                              uma letra maiúscula e um caracter especial'
  #                  }, on: :create
end
