class CreateEnderecos < ActiveRecord::Migration[8.1]
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :numero
      t.string :cidade
      t.string :cep
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
