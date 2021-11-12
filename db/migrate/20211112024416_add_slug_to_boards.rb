class AddSlugToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :slug, :string
  end
end
