# app/models/pessoa.rb

class Pessoa < ApplicationRecord
  # --- 1. VALIDAÇÕES DE PRESENÇA E UNICIDADE ---
  validates :nome, presence: true
  validates :cpf, uniqueness: true, presence: true
  validates :rg, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :telefone, uniqueness: true, presence: true

  # --- 2. CHAMADA DA VALIDAÇÃO CUSTOMIZADA ---
  # Isso diz ao Rails para rodar o método abaixo (Passo 3) antes de salvar
  validate :nome_deve_estar_no_email

  # --- 3. DEFINIÇÃO DO MÉTODO DE VALIDAÇÃO CUSTOMIZADA ---
  # Ele DEVE ser definido DEPOIS de 'private'
  private

  def nome_deve_estar_no_email
    # Se algum dos campos estiver vazio, as validações de presence já cuidam disso.
    return if nome.blank? || email.blank?

    # 1. Normaliza o nome (remove espaços, acentos, e deixa em minúsculo)
    nome_normalizado = ActiveSupport::Inflector.transliterate(nome).downcase.gsub(/\s+/, "").delete("^a-z0-9")

    # 2. Normaliza a parte do email antes do '@'
    email_prefix = email.split("@").first.downcase

    # 3. Verifica se o nome normalizado está contido no prefixo do email
    unless email_prefix.include?(nome_normalizado)
      errors.add(:email, "deve conter o nome da pessoa (#{nome_normalizado}) para ser um e-mail válido/funcional.")
    end
  end
end
