class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :position
      t.boolean :visible, :default => false
      t.references :subject, index: true, foreign_key: true
      t.string :permalink

      t.timestamps null: false
    end
  end
end
