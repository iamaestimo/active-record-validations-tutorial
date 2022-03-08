class User < ApplicationRecord
    # validating presence
    # validates :name, presence: true
    validates :email, presence: true

    # validating confirmation (that 2 fields match)
    validates :email_confirmation, presence: true
    validates :email, confirmation: true

    # must match a string that looks like an email ie. <string 1>@<string 2>.<string 3>
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }

    # validating password length
    validates :password, length: 8..15

    # validate business email
    validates_with UserValidator

    # passing attributes to the name error message
    validates_presence_of :name, message: Proc.new { | user, data |
    "#{data[:attribute]} is needed for all registrations!" } 


    # associations
    has_many :subscriptions
    has_many :plans, through: :subscriptions
end
