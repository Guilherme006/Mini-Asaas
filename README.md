# 💸 Mini Asaas

**Mini Asaas** é uma aplicação web desenvolvida com **Grails 5**, inspirada na estrutura do Asaas, voltada para o gerenciamento de **pagamentos, pagadores e notificações**. O projeto utiliza o padrão MVC e possui autenticação, com controle de permissões, geração de comprovantes em PDF, envio de notificações por e-mail e verificação automática de pagamentos vencidos com jobs agendados.

## 📚 Índice

- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Funcionalidades](#funcionalidades)
- [Instalação](#instalação)
- [Configuração de Ambiente](#configuração-de-ambiente)
- [Executando o Projeto](#executando-o-projeto)
- [Jobs e Notificações](#jobs-e-notificações)
- [Desenvolvedores](#desenvolvedores)

## 💻 Tecnologias Utilizadas

- Grails 5.x  
- Groovy  
- GORM (Hibernate)  
- Spring Security Core  
- Quartz Scheduler  
- MySQL  
- Docker (opcional)  
- JavaMail (envio de e-mails)  
- Flying Saucer (para geração de PDF)

## 🚀 Funcionalidades

- Cadastro, edição, listagem e exclusão de **pagadores (Payers)**  
- Cadastro, edição, listagem e exclusão de **pagamentos (Payments)**  
- Acompanhamento do **status de pagamentos**: `PENDING`, `PAID`, `EXPIRED`, `CANCELED`, `CONFIRMED_CASH`  
- **Confirmação manual** de pagamentos em dinheiro  
- **Restauração e exclusão lógica** de registros  
- Geração de **comprovantes em PDF**  
- Filtros inteligentes para busca por nome e e-mail  
- Notificações automáticas por e-mail para eventos de pagamento (`created`, `paid`, `expired`, `restored`, `confirmedCash`, `updated`)  
- Jobs Quartz para verificação diária de **pagamentos vencidos**  
- Controle de autenticação e autorização com base em papéis  
- Validações e mensagens multilíngues (`message.properties`)  
- Layout responsivo e adaptado para dispositivos móveis (`mobile-first`)

## ⚙️ Instalação

1. Clone o repositório:

```bash
git clone https://github.com/Guilherme006/Mini-Asaas.git
```

2. Configure o MySQL:

```bash
CREATE DATABASE `mini-asaas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## 🔐 Configuração de Ambiente

Edite o arquivo grails-app/conf/application.yml com suas credenciais:

```bash
dataSource:
  dbCreate: update
  url: jdbc:mysql://localhost:3306/mini-asaas
  username: seu_usuario
  password: sua_senha

grails:
  mail:
        host: smtp.gmail.com
        port: 465
        username: ${MAIL_USERNAME}
        password: ${MAIL_PASSWORD}
        props:
            mail.smtp.auth: true
            mail.smtp.socketFactory.port: 465
            mail.smtp.socketFactory.class: javax.net.ssl.SSLSocketFactory
            mail.smtp.socketFactory.fallback: false
        disabled: true
```

⚠️ **Importante:** Para envio de e-mails com Gmail, ative uma senha de app caso utilize autenticação em dois fatores.

## ▶️ Executando o Projeto

1. Execute o projeto:

```bash
grails run-app
```

2. Acesse no navegador:

```bash
http://localhost:8080
```

## ⏰ Jobs e Notificações

- **OverduePaymentsJob:** Executado diariamente para alterar o status de pagamentos vencidos para OVERDUE e notificar o cliente por e-mail.

- **EmailNotificationService:** Responsável por montar e enviar mensagens personalizadas com base em message.properties.

- **Quartz Plugin:** Utilizado para agendamentos.


## Desenvolvedores
Guilherme Felippe Lazari
Victor Yan Martinez


