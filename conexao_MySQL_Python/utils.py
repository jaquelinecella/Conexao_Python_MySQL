
import MySQLdb
from time import sleep
from datetime import datetime


def conectar():
    """
    Função para conectar ao servidor
    """
    try:
        conn=MySQLdb.connect(
            db='faculdade_nova_geracao',
            host='127.0.0.1',
            user='jaqueline',
            passwd='cella'
        )
        return conn
    except MySQLdb.Error as e:
        print(f'Há erro na conexão com o MySQL Server: {e}')

def desconectar(conn=conectar()):
    """ 
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()


def listar():
    """
    Função para listar as matrículas
    """

    conn = conectar()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM matriculas')
    matriculas = cursor.fetchall() #este comando vai listar os valores

    if len(matriculas) > 0: # Se houver dados digitados
        print('Listando Matrículas...')
        sleep(2)
        print('-'*25)
        for matricula in matriculas:
            print(f'id: {matricula[0]}') # estas posições são as colunas da tabela
            print(f'alunos_id: {matricula[1]}')
            print(f'cursos_id: {matricula[2]}')
            print(f'data_matricula: {matricula[3]}')
            print(f'status_matricula: {matricula[4]}')
            print(f'numero_matricula: {matricula[5]}')
            print('-' * 25)
    else:
        print ('Não há matrículas efetivadas até o momento')

    desconectar(conn)


def inserir():
    """
    Função para inserir uma matrícula
    """
    conn = conectar()
    cursor = conn.cursor()

    alunos_id = int(input('Digite o id do aluno:'))

    cursos_id = int(input('Digite o id do curso:'))

    data_matricula = str(input('Digite a data da matricula (ano-mês-dia):'))
    date = datetime.strptime(data_matricula, '%Y-%m-%d').date()

    status_matricula = str(input('Status da matricula(ativa,cancelada ou trancada):'))
    numero_matricula = int(input('Número da matrícula:'))


    cursor.execute(f"INSERT INTO matriculas (alunos_id, cursos_id,data_matricula,status_matricula, numero_matricula) VALUES"
                   f" ({alunos_id}, {cursos_id}, '{data_matricula}','{status_matricula}', {numero_matricula})")
    conn.commit()

    if cursor.rowcount ==1:
        print(f'o aluno {alunos_id} foi cadastrado com sucesso')
    else:
        print('Não foi possível inserir este aluno no sistema. Verifique os dados lançados')
    desconectar(conn)


def atualizar():
    """
    Função para atualizar uma matrícula
    """
    conn = conectar()
    cursor = conn.cursor()

    id = int(input('Informe o id da matrícula:'))

    alunos_id = int(input('Digite o id do aluno:'))

    cursos_id = int(input('Digite o id do curso ou o novo id do curso(em caso de alteração):'))

    data_matricula = str(input('Digite a data da matricula (ano-mês-dia) ou a nova data da matrícula:'))
    date = datetime.strptime(data_matricula, '%Y-%m-%d').date()

    status_matricula = str(input('Informe o novo status da matricula(ativa,cancelada ou trancada):'))
    numero_matricula = int(input('Número da matrícula do aluno:'))

    cursor.execute(f"UPDATE matriculas SET alunos_id={alunos_id}, cursos_id={cursos_id}, data_matricula='{data_matricula}',"
                   f" status_matricula='{status_matricula}', numero_matricula={numero_matricula} WHERE id ={id}")
    conn.commit()

    if cursor.rowcount ==1:
        print(f'o id {id} referente ao aluno {alunos_id} foi atualizado com sucesso')
    else:
        print(f'Erro ao atualizar os dados da matrícula')
    desconectar(conn)


def deletar():
    """
    Função para deletar uma matrícula
    """  
    conn = conectar()
    cursor = conn.cursor()

    id = int(input('Informe o id da matrícula que você quer deletar:'))

    cursor.execute(f'DELETE FROM matriculas WHERE id={id}')
    conn.commit()

    if cursor.rowcount ==1:
        print(f'A matrícula referente ao id {id} foi excluída com sucesso')
    else:
        print(f'Erro ao excluir a matrícula de id = {id}.Verifique se digitou corretamente um id válido. Esta informação'
              f'está na primeira coluna da tabela "matriculas')
    desconectar(conn)


def menu():
    """
    Função para gerar o menu inicial
    """
    while True:
        print('=========Gerenciamento de Vendas de Cursos==============')
        print('Selecione uma opção: ')
        print('1 - Listar matrículas efetivadas')
        print('2 - Inserir novas matrículas')
        print('3 - Atualizar matrículas')
        print('4 - Deletar matrículas')
        print('Digite a opção escolhida:')
        opcao = int(input())
        if opcao in [1, 2, 3, 4]:
            if opcao == 1:
                listar()
            elif opcao == 2:
                inserir()
            elif opcao == 3:
                atualizar()
            elif opcao == 4:
                deletar()
        else:
            print('Opção inválida. Você deve digitar uma opção informada.')
        resp = input('Deseja continuar? Digite N para sair ou qualquer tecla para continuar.:').upper()
        if resp in 'N':
            break
