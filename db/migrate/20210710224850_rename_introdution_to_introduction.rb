class RenameIntrodutionToIntroduction < ActiveRecord::Migration[5.2]
  def change
     add_column :introduction, :text
  end
end
