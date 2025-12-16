# app/models/pessoa.rb

class Pessoa < ApplicationRecord
  # --- 1. VALIDAÇÕES DE PRESENÇA E UNICIDADE ---
  validates :nome, presence: true
  validates :cpf, uniqueness: true, presence: true
  validates :rg, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :telefone, uniqueness: true, presence: true

  # --- 2. RANSACK (ALLOWLIST DE CAMPOS BUSCÁVEIS) ---
  def self.ransackable_attributes(auth_object = nil)
    [
      "nome",
      "cpf",
      "email",
      "rg",
      "telefone",
      "created_at",
      "updated_at"
    ]
  end

  # --- 3. CHAMADA DA VALIDAÇÃO CUSTOMIZADA ---
  validate :nome_deve_estar_no_email

  # --- 4. DEFINIÇÃO DO MÉTODO DE VALIDAÇÃO CUSTOMIZADA ---
  private

  def nome_deve_estar_no_email
    return if nome.blank? || email.blank?

    nome_normalizado = ActiveSupport::Inflector
                          .transliterate(nome)
                          .downcase
                          .gsub(/\s+/, "")
                          .delete("^a-z0-9")

    email_prefix = email.split("@").first.downcase

    unless email_prefix.include?(nome_normalizado)
      errors.add(
        :email,
        "deve conter o nome da pessoa (#{nome_normalizado}) para ser um e-mail válido/funcional."
      )
    end
  end
end
