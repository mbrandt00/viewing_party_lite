# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_parties
  has_many :user_viewing_parties

  validates_presence_of :name
  validates_uniqueness_of :email
  validates_presence_of :password, require: true
  has_secure_password
end
