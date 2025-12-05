class AddFieldsToPessoas < ActiveRecord::Migration[8.1]
  def change
    add_column :pessoas, :nome, :string
    add_column :pessoas, :cpf, :string
    add_column :pessoas, :rg, :string
    add_column :pessoas, :email, :string
    add_column :pessoas, :whatsapp, :string
  end
end
