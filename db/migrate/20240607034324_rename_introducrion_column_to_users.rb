class RenameIntroducrionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introducrion, :introduction
  end
end
