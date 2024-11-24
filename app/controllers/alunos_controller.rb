class AlunosController < ApplicationController
    def create
        # Cria um novo aluno com os dados retornados por aluno_params.
        @aluno = Aluno.new(aluno_params)

        # Salva o aluno no banco de dados. A função save retorna um booleano indicando se
        # o salvamento foi feito com sucesso.
        if @aluno.save
            # Caso o salvamento tenha sido feito com sucesso, responde com o JSON do aluno e status 201 (Created).
            render json: @aluno, status: :created
        else
            # Caso o salvamento falhe, responde com um JSON com erros e o status 422 (Unprocessable entity).
            render json: @aluno.errors, status: :unprocessable_entity
        end
    end

    def show
        # Busca no banco de dados um aluno com um ID específico.
        @aluno = Aluno.find(params[:id])
        # Responde com o JSON do aluno.
        render json: @aluno
    end

    def index
        # Busca no banco de dados todos os alunos existentes.
        @alunos = Aluno.all
        # Responde com o JSON de todos os alunos.
        render json: @alunos
    end

    private
        def aluno_params
            params.require(:aluno).permit(:nome, :matricula, :data_nascimento, :curso)
        end
end
