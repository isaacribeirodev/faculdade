class Aluno < ApplicationRecord
    validates :nome, :matricula, :data_nascimento, :curso, presence: true
end
