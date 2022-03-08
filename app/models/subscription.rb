class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  # ensure a user can only have a single subscription
  validates_uniqueness_of :user_id, scope: :plan_id, 
                          message: "User can only have one subscription!"

end
