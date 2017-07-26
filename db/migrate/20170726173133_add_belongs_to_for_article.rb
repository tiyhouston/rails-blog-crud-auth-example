class AddBelongsToForArticle < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
      t.references :user
    end
  end
end
