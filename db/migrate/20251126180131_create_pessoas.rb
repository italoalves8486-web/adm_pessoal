class CreatePessoas < ActiveRecord::Migration[8.1]
  def change
    create_table :pessoas do |t|
      t.timestamps
    end
  end
end
