<%@ page import="mini.asaas.Customer" %>
<g:set var="securityService" bean="springSecurityService" />

<% Customer customer = securityService.currentUser.customer %>

<!doctype html>
<html lang="pt-BR">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            rel="stylesheet"
            href="https://atlas.asaas.com/v26.2.0/atlas.css"
            crossorigin="anonymous">
    <script
            defer
            src="https://atlas.asaas.com/v26.2.0/atlas.js"
            crossorigin="anonymous"
    ></script>
    <link
            rel="stylesheet"
            href="https://atlas.asaas.com/reset.css"
            crossorigin="anonymous">
    <g:layoutHead/>
</head>

<body class="has-atlas">
<atlas-screen fullscreen>
    <g:render template="/templates/header" model="${[customer: customer]}" />
    <g:render template="/templates/sidebar" />
    <atlas-page class="js-atlas-page" container>
        <atlas-page-content slot="content" class="js-atlas-content">
            <g:render template="/templates/alert" />
            <g:layoutBody />
        </atlas-page-content>
    </atlas-page>
</atlas-screen>
<g:render template="/templates/notification/center"  />
<asset:javascript src="application.js"/>
<asset:javascript src="notifications.js"/>
</body>
</html>