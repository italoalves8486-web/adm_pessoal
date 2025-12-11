class AddTelefoneToPessoas < ActiveRecord::Migration[8.1]
  def change
    add_column :pessoas, :telefone, :string
  end
end
