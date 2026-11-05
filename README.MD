# HDMessageDlg

HDMessageDlg foi projetado para ser uma forma simples e elegante de exibir mensagens no delphi.

Support: rtinformatica.ti@gmail.com 

## Instalação

#### Para instalar em seu projeto usando [boss](https://github.com/HashLoad/boss):
```sh
$ boss install github.com/Rtrevisan20/HDMessageDlg
```

#### Instalação Manual

Adicione as seguintes pastas ao seu projeto, em *Project > Options > Delphi Compiler > Search path*

```
../hdmessagedlg/src
../hdmessagedlg/src/FMX
```

## Como usar

#### **Uses necessárias**

```
uses HDMessageDlg.Interfaces, HDMessageDlg;
``` 

## **Idioma dos botões**

Por padrão os botões são exibidos em português (`SIM (ENTER)`, `NÃO (ESC)`, `OK (ENTER)`).
Para inglês, defina o idioma global uma vez na aplicação:

```delphi
THDMessageDlg.DefaultLanguage := lgEnglish;
```

ou por diálogo:

```delphi
Msg.MsgLanguage(lgEnglish)
```

Idiomas suportados: `lgPortuguese` (padrão), `lgEnglish`.

## **Tipos de Uso**

#### **Mensagem de Alerta**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Mensagem de Alerta')
   .MsgQuestion('Essa é uma mensagem de Alerta?')
   .MsgBody('Mensagem de Alerta, Mensagem de Alerta')
   .MsgIcon(TiAttention)
   .MsgType(TyOK)
   .DisplayMessage; 
end;   
```

#### **Mensagem de Atenção**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Mensagem de Atenção')
   .MsgQuestion('Essa é uma mensagem de Atenção?')
   .MsgBody('Mensagem de Atenção, Mensagem de Atenção')
   .MsgIcon(TiAttention)
   .MsgType(TyOK)
   .DisplayMessage;
end;   
```

#### **Mensagem de Erro**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Mensagem de Erro')
   .MsgQuestion('Essa é uma mensagem de Erro?')
   .MsgBody('Mensagem de Erro, Mensagem de Erro')
   .MsgIcon(TiError)
   .MsgType(TyOK)
   .DisplayMessage;
end;
```

#### **Mensagem de Joia**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Mensagem de Joia')
   .MsgQuestion('Essa é uma mensagem de Joia?')
   .MsgBody('Mensagem de Joia, Mensagem de Joia')
   .MsgIcon(TiLike)
   .MsgType(TyOK)
   .DisplayMessage; 
end;
```

#### **Apenas uma Mensagem**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Essa é apenas uma Mensagem')
   .MsgQuestion('Essa é uma mensagem?')
   .MsgBody('Essa é apenas uma Mensagem, Essa é apenas uma Mensagem')
   .MsgIcon(TiMessage)
   .MsgType(TyOK)
   .DisplayMessage;
end; 
```

#### **Mensagem de Pergunta**

```delphi
var
  MSG : iHDMessageDlg;
begin
  MSG := THDMessageDlg.New;  
  MSG
   .MsgTitle('Mensagem de Pergunta')
   .MsgQuestion('Em qual opção você vai clicar?')
   .MsgBody('Escolha uma das opções por favor!')
   .MsgIcon(TiMessage)
   .MsgType(TyQuestion)
   .DisplayQuestion;
end;   
```