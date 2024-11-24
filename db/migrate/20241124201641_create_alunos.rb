class CreateAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.integer :matricula
      t.date :data_nascimento
      t.string :curso

      t.timestamps
    end
  end
end
