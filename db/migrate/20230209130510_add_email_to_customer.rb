class AddEmailToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :email, :string, null: false, default: ""
  end
end
