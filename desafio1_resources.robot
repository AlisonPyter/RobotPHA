*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                            https://learningprime.com.br/
${IMAGEM}                         //*[@id="logo"]/a/img
 
*** Keywords ***
Abri o navegador
    Open Browser        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser    

Dado que o cliente tenha realizado o cadastro com sucesso
    Go To    url=${URL}
    Title Should Be                  Learning Prime Store
    Wait Until Element Is Visible    locator=${IMAGEM} 
    
    Wait Until Element Is Visible    //a[@href='/login']
    Click Element                    //a[@href='/login']

    Wait Until Element Is Visible    //a[@href='/signup']
    Click Element                    //a[@href='/signup']

    Wait Until Page Contains         Novo Cliente

    Input Text                       id=spree_user_email                    ALISON3@pha.com.br
    Input Text                       id=spree_user_password                 123456789
    Input Text                       id=spree_user_password_confirmation    123456789

    Click Element                    //input[@value="Criar" and @type="submit"]

E realize o logout
    Wait Until Element Is Visible    //a[contains(.,'Sair')]
    Click Element                    //a[contains(.,'Sair')]

Quando tentar logar com o mesmo usuário cadastro novamente
    Wait Until Element Is Visible    //a[@href='/login']
    Click Element                    //a[@href='/login']

    Wait Until Element Is Visible    //*[@id="spree_user_email"] 
    Input Text                       //*[@id="spree_user_email"]                    ALISON3@pha.com.br

    Wait Until Element Is Visible    //*[@id="spree_user_password"] 
    Input Text                       //*[@id="spree_user_password"]                   123456789

    Wait Until Element Is Visible    //input[contains(@name,'commit')]
    Click Element                    //input[contains(@name,'commit')]


Então o login deverá ser realizado com sucesso.
    Wait Until Element Is Visible    //a[contains(.,'Minha Conta')]    
    Wait Until Element Is Visible    //a[contains(.,'Sair')]

