class AddDetailsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :float
    add_column :books, :published, :date
  end
end
