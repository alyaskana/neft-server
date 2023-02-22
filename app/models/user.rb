class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 8 }, on: :create

  has_many :fishes, dependent: :destroy
  has_many :plots, dependent: :destroy
  has_many :resources, dependent: :destroy
  has_many :seeds, class_name: 'UserSeed', dependent: :destroy
  has_many :crops, dependent: :destroy
  has_one :wallet, dependent: :destroy
end
