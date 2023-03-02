class MakeSpotIdNullableInCustomers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :customers, :spot_id, true
  end
end
