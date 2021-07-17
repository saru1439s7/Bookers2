class AddUsersToIntroduction < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :string
  end
end

#一番最後に作った　schemaに反映　最新版 introducctionは２００字なのでstringdでもOK