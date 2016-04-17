<%--
Created by IntelliJ IDEA.
User: vande
Date: 15/04/2016
Time: 13:51
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="loginForm" scope="request" type="br.com.vbr.controller.LoginForm"/>

<t:template centralizar="true">
    <jsp:attribute name="body">
         <%--@elvariable id="exibirAlertasLogin" type="java.lang.Boolean"--%>
        <c:if test="${exibirAlertasLogin}">
            <div class="alert alert-danger" style="width: 40%;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <%--@elvariable id="errors" type="br.com.caelum.vraptor.validator.MessageList"--%>
                <c:forEach items="${errors}" var="error">
                    <%--@elvariable id="error" type="br.com.caelum.vraptor.validator.Message"--%>
                    ${error.message} <br/>
                </c:forEach>
            </div>
        </c:if>
         <div class="panel panel-default" style="width: 40%;">

             <div class="panel-body">
                 <form action="<c:url value="/entrar" />" method="POST">
                     <div class="row">
                         <div class="col-md-12">
                             <c:set var="campo" value="loginForm.usuario"/>
                             <a:formGroup campo="${campo}">
                                 <label for="usuario" class="control-label">Usuário</label>
                                 <input id="usuario" type="text" maxlength="30" name="${campo}" value="${loginForm.usuario}" class="form-control" autofocus/>
                             </a:formGroup>
                         </div>
                     </div>

                     <div class="row">
                         <div class="col-md-12">
                             <c:set var="campo" value="loginForm.senha"/>
                             <a:formGroup campo="${campo}">
                                 <label for="senha" class="control-label">Senha</label>
                                 <input id="senha" type="password" name="${campo}" maxlength="30" value="${loginForm.senha}" class="form-control"/>
                             </a:formGroup>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-md-12">
                             <a href="<c:url value="/recuperacao" />" class="pull-left pull-down">
                                 Esqueceu a Senha?
                             </a>
                         </div>
                         <div class="col-md-12">
                             <button type="submit"  style="text-align: center;" class="btn btn-primary pull-right">Login</button>
                         </div>
                     </div>
                 </form>
             </div>
         </div>
        </jsp:attribute>
</t:template>