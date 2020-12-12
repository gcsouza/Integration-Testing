#language: pt

Funcionalidade: CRUD de Processo Judicial

  Contexto:
    Dado que o usuário queira salvar um processo
    E o usuário informar "vara" com o valor igual a "Vara 3"
    E o usuário informar "numero_processo" com o valor igual a "00001732498"
    E o usuário informar "natureza" com o valor igual a "Criminal"
    E o usuário informar "partes" com o valor igual a "Gustavo"
    E o usuário informar "urgente" com o valor igual a "N"
    E o usuário informar "arbitramento" com o valor igual a "N"
    E o usuário informar "assistente_social" com o valor igual a "Ana Paula"
    E o usuário informar "data_entrada" com o valor igual a "05/12/2020"
    E o usuário informar "data_saida" com o valor igual a "12/02/2021"
    E o usuário informar "data_agendamento" com o valor igual a "11/02/2021"
    E o usuário informar "status" com o valor igual a "Em Andamento"
    E o usuário informar "observacao" com o valor igual a "N/A"

  @validarProcessos
  Cenário: Criar um Novo Processo Judicial - POST
    Quando o usuário clicar no botao salvar
    Então o usuário deverá ver a mensagem "salvo com sucesso"

  @validarProcessos
  Cenário: Consultar um Processo Judicial Já Criado - GET
    Dado o usuário clicar no botao salvar
    Quando o usuário clicar em mostrar
    Então o usuário deverá ver a mensagem "sucesso"
    E o usuário visualizará o campo "vara" com o valor "Vara 3"
    E o usuário visualizará o campo "numero_processo" com o valor "00001732498"
    E o usuário visualizará o campo "natureza" com o valor "Criminal"
    E o usuário visualizará o campo "partes" com o valor "Gustavo"
    E o usuário visualizará o campo "urgente" com o valor "N"
    E o usuário visualizará o campo "arbitramento" com o valor "N"
    E o usuário visualizará o campo "assistente_social" com o valor "Ana Paula"
    E o usuário visualizará o campo "data_entrada" com o valor "2020-12-05"
    E o usuário visualizará o campo "data_saida" com o valor "2021-02-12"
    E o usuário visualizará o campo "data_agendamento" com o valor "2021-02-11"
    E o usuário visualizará o campo "status" com o valor "Em Andamento"
    E o usuário visualizará o campo "observacao" com o valor "N/A"

  @validarProcessos
  Cenário: Atualizar um Processo Judicial Já Criado - PUT
    Dado o usuário clicar no botao salvar
    Quando alterar o campo "natureza" para  o valor "Tributario"
    E o usuário clicar em editar
    Então o usuário deverá ver a mensagem "sucesso"

    Quando o usuário clicar em mostrar
    Então o usuário visualizará o campo "vara" com o valor "Vara 3"
    E o usuário visualizará o campo "numero_processo" com o valor "00001732498"
    E o usuário visualizará o campo "natureza" com o valor "Tributario"
    E o usuário visualizará o campo "partes" com o valor "Gustavo"
    E o usuário visualizará o campo "urgente" com o valor "N"
    E o usuário visualizará o campo "arbitramento" com o valor "N"
    E o usuário visualizará o campo "assistente_social" com o valor "Ana Paula"
    E o usuário visualizará o campo "data_entrada" com o valor "2020-12-05"
    E o usuário visualizará o campo "data_saida" com o valor "2021-02-12"
    E o usuário visualizará o campo "data_agendamento" com o valor "2021-02-11"
    E o usuário visualizará o campo "status" com o valor "Em Andamento"
    E o usuário visualizará o campo "observacao" com o valor "N/A"

  @validarProcessos
  Cenário: Deletar um Processo Judicial Já Criado - DELETE
    Dado o usuário clicar no botao salvar
    Quando O usuário clicar em deletar
    Então o usuário deverá ver a mensagem "sem conteúdo"

    Quando o usuário clicar em mostrar
    Então o usuário deverá ver a mensagem "não encontrado"

  @validarProcessos
  Esquema do Cenário: Validação do POST Com Esquema de Cenário. Vara = <Vara>
    Dado que o usuário queira salvar um processo
    E o usuário informar "vara" com o valor igual a "<Vara>"
    E o usuário informar "numero_processo" com o valor igual a "00001732498"
    E o usuário informar "natureza" com o valor igual a "Criminal"
    E o usuário informar "partes" com o valor igual a "Cristina Oliveira"
    E o usuário informar "urgente" com o valor igual a "N"
    E o usuário informar "arbitramento" com o valor igual a "N"
    E o usuário informar "assistente_social" com o valor igual a "Ana Paula"
    E o usuário informar "data_entrada" com o valor igual a "05/12/2020"
    E o usuário informar "data_saida" com o valor igual a "12/02/2021"
    E o usuário informar "data_agendamento" com o valor igual a "11/02/2021"
    E o usuário informar "status" com o valor igual a "Em Andamento"
    E o usuário informar "observacao" com o valor igual a "N/A"
    Quando o usuário clicar no botao save
    Então o usuário deverá ver a mensagem "<Mensagem>"

    Exemplos:
      | Vara              | Mensagem                |
      | Vara de Curitiba  | salvo com sucesso       |
      |                   | entidade não processada |
      | Vara de Fortaleza | salvo com sucesso       |

