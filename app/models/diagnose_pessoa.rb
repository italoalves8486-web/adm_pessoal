# diagnose_pessoa.rb
require_relative "config/environment"

puts "=== Diagnóstico do modelo Pessoa ==="
puts

puts "1. Arquivo existe?"
puts "   #{File.exist?('app/models/pessoa.rb')}"
puts

puts "2. Conteúdo do arquivo:"
puts "   #{'-' * 50}"
begin
  content = File.read("app/models/pessoa.rb")
  puts content
  puts "   #{'-' * 50}"

  puts "3. Contém 'class Pessoa'?"
  puts "   #{content.include?('class Pessoa')}"

  puts "4. Contém 'Pessoas' (plural) por engano?"
  puts "   #{content.include?('class Pessoas')}"

  puts "5. Tamanho do arquivo: #{content.size} bytes"
rescue => e
  puts "   ERRO ao ler arquivo: #{e.message}"
end
puts

puts "6. Tentando carregar a classe..."
begin
  pessoa
  puts "   SUCCESS: Classe pessoa carregada"
rescue NameError => e
  puts "   ERROR: #{e.message}"

  puts "7. Procurando constantes definidas..."
  puts "   Object.constants.grep(/Pessoa/) = #{Object.constants.grep(/Pessoa/)}"
  puts "   ApplicationRecord.descendants = #{ApplicationRecord.descendants.map(&:name)}"
end

puts "8. Zeitwerk logs:"
Rails.autoloaders.main.logger = Logger.new(STDOUT)
begin
  Rails.autoloaders.main.reload
rescue => e
  puts "   ERROR no reload: #{e.message}"
end
