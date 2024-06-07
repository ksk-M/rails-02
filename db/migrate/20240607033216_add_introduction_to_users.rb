class AddIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introducrion, :string
    # introducrionミスタイプ
  end
end
