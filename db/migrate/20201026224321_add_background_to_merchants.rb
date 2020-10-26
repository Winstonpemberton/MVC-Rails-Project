class AddBackgroundToMerchants < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :background, :string
  end
end
