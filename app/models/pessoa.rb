class Pessoa < ApplicationRecord
  # --- VALIDAÇÕES DE PRESENÇA E UNICIDADE ---
  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true

  # --- VALIDAÇÃO DE EMAIL (CORRETA E UNIFICADA) ---
  validates :email,
            presence: true,
            format: {
              # A Regex está correta para exigir @gmail.com (com \. e \z)
              with: /\A[\w\.\-\_]+@gmail\.com\z/i,
              message: "deve ser um endereço @gmail.com válido."
            }

  # --- VALIDAÇÃO CUSTOMIZADA ---
  validate :cpf_valido

  private

  # --- MÉTODO DE VALIDAÇÃO CUSTOMIZADA ---
  def cpf_valido
    return if cpf.blank?

    cpf_limpo = cpf.to_s.gsub(/\D/, "")

    errors.add(:cpf, "deve ter 11 dígitos") unless cpf_limpo.length == 11

    if cpf_limpo.chars.uniq.length == 1
      errors.add(:cpf, "não pode ter todos os dígitos iguais")
      return
    end

    soma = 0
    9.times do |i|
      soma += cpf_limpo[i].to_i * (10 - i)
    end
    primeiro_digito = soma % 11
    primeiro_digito = primeiro_digito < 2 ? 0 : 11 - primeiro_digito

    soma = 0
    10.times do |i|
      soma += cpf_limpo[i].to_i * (11 - i)
    end
    segundo_digito = soma % 11
    segundo_digito = segundo_digito < 2 ? 0 : 11 - segundo_digito

    unless cpf_limpo[9].to_i == primeiro_digito && cpf_limpo[10].to_i == segundo_digito
      errors.add(:cpf, "inválido")
    end
  end
end
