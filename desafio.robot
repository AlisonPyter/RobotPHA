*** Settings ***
Documentation        Cenário de Cadastro + Login - Validar se o usuário
...                  permanece em funcionamento após o cadastro

Resource             desafio1_resources.robot

Test Setup           Abri o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
 Caso de Teste 01 - 
    [Tags]        menus  categorias
    Dado que o cliente tenha realizado o cadastro com sucesso
    E realize o logout
    Quando tentar logar com o mesmo usuário cadastro novamente
    Então o login deverá ser realizado com sucesso.