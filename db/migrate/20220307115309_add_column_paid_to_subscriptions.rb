class AddColumnPaidToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :active, :boolean, default: false
  end
end
