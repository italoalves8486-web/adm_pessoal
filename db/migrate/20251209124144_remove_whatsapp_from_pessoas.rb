class RemoveWhatsappFromPessoas < ActiveRecord::Migration[8.1]
  def change
    remove_column :pessoas, :whatsapp, :string
  end
end
