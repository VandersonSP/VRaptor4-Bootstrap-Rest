<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="body" required="true" fragment="true" %>
<%@ attribute name="script" fragment="true" %>
<%@ attribute name="centralizar" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="author" content="VBR"/>
    <meta name="reply-to" content="contato@VBR.com.br"/>
    <meta name="description" content="Vraptor Bootstrap Rest"/>
    <meta name="keywords" content="sites, web, java"/>
    <title>VBR</title>

    <link href="<c:url value="/img/icon.jpg" />" rel="shortcut icon"/>
    <link href="<c:url value="/img/iconVbr.jpg" />" rel="icon"/>

    <link href="<c:url value="/lib/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>" rel="stylesheet"
          type="text/css"/>
    <link href="<c:url value="/lib/bootstrap-jasny/css/jasny-bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/lib/selectize/css/selectize.bootstrap3.css" />" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/lib/selectize/css/selectize.loading.css" />" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/lib/datatables/media/css/dataTables.bootstrap.css" />" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/lib/datatables/media/css/dataTables.responsive.css" />" rel="stylesheet"
          type="text/css"/>

    <!--[if lt IE 7]>
    <script src="http://ie7-js.googlecode.com/svn/version/2.0(beta3)/IE7.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/es5-shim/2.0.8/es5-shim.min.js"></script><![endif]-->
</head>
<body>
<c:choose>
<c:when test="${centralizar}">
<div class="container"
     style="min-height: 100vh; display: flex; align-items: center; justify-content: center; flex-direction: column;">
    </c:when>
    <c:otherwise>
    <div class="container-fluid">
        </c:otherwise>
        </c:choose>
        <div>
            <img src="<c:url value="/img/iconVbr.jpg" />" alt="icoVBR" style="text-align: center;" class="image-logo">
        </div>

        <%--@elvariable id="exibirAlertas" type="java.lang.Boolean"--%>
        <c:if test="${exibirAlertas}">
            <div class="alert alert-danger"
                 <c:if test="${centralizar}">style="width: 40%;"</c:if> >
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <%--@elvariable id="errors" type="br.com.caelum.vraptor.validator.MessageList"--%>
                <c:forEach items="${errors}" var="error">
                    <%--@elvariable id="error" type="br.com.caelum.vraptor.validator.Message"--%>
                    ${error.message} <br/>
                </c:forEach>
            </div>
        </c:if>

        <jsp:useBean id="notice" scope="request" class="java.lang.String"/>
        <c:if test="${not empty notice}">
            <div class="alert alert-success"
                 <c:if test="${centralizar}">style="width: 40%;"</c:if> >
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${notice}</strong>
            </div>
        </c:if>

        <jsp:useBean id="warning" scope="request" class="java.lang.String"/>
        <c:if test="${not empty warning}">
            <div class="alert alert-warning"
                 <c:if test="${centralizar}">style="width: 40%;"</c:if> >
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${warning}</strong>
            </div>
        </c:if>

        <div class="modal fade" id="modal-erro-ajax" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-body">
                        Ocorreu um erro no acesso ao servidor, por favor, tente novamente mais tarde.
                    </div>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-sm btn-default" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:invoke fragment="body"/>

        <c:if test="${not centralizar}">
            <div class="footer v-footer">
                <p>© 2015, todos os direitos reservados.</p>
            </div>
        </c:if>
    </div>
    <!-- fim da div class=container -->

    <script src="<c:url value='/lib/jquery/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/lib/jquery/jquery.mask.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/lib/moment/moment.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/lib/moment/moment.pt-br.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/lib/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js'/>"
            type="text/javascript"></script>
    <script src="<c:url value='/lib/bootstrap-jasny/js/jasny-bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/selectize/js/selectize.js" />" type="text/javascript"></script>
    <script src="<c:url value="/lib/datatables/media/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/lib/datatables/media/js/dataTables.bootstrap.js" />" type="text/javascript"></script>
    <script src="<c:url value="/lib/datatables/media/js/dataTables.responsive.js" />" type="text/javascript"></script>
    <script src="<c:url value="/lib/datatables/media/js/datetime-moment.js" />" type="text/javascript"></script>

    <jsp:invoke fragment="script"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.pull-down').each(function () {
                $(this).css('margin-top', $(this).parent().height() - $(this).height())
            });

            $.fn.dataTable.moment('D/MM/YYYY HH:mm');
            $.fn.dataTable.moment('D/MM/YYYY');
            $(".datatable").DataTable({
                stateSave: true,
                stateDuration: -1,
                pagingType: "full_numbers",
                autoWidth: false,
                responsive: true,
                order: [],
                language: {
                    "emptyTable": "Nenhum registro encontrado",
                    "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 até 0 de 0 registros",
                    "infoFiltered": "(Filtrados de _MAX_ registros)",
                    "infoPostFix": "",
                    "infoThousands": ".",
                    "lengthMenu": "_MENU_ resultados por página",
                    "loadingRecords": "Carregando...",
                    "processing": "Processando...",
                    "zeroRecords": "Nenhum registro encontrado",
                    "search": "Pesquisar",
                    "paginate": {
                        "next": "Próximo",
                        "previous": "Anterior",
                        "first": "Primeiro",
                        "last": "Último"
                    },
                    "aria": {
                        "sortAscending": ": Ordenar colunas de forma ascendente",
                        "sortDescending": ": Ordenar colunas de forma descendente"
                    }
                }
            });

            $('.combobox').each(function () {
                if ($(this).is("select") && !$(this).hasClass("selectized")) {
                    $(this).selectize({
                        plugins: ['remove_button']
                    });
                }
            });

            moment.locale('pt-BR');

            $('.input-group.date').datetimepicker({
                sideBySide: true,
                format: 'DD/MM/YYYY'
            });

            $('.input-group.datetime').datetimepicker({
                sideBySide: true
            });

            $("input#sigla").attr("maxlength", 5);

            $("input[type=checkbox]").click(function () {
                this.value = this.checked;
            });

            $(document).ajaxError(function () {
                $('#modal-erro-ajax').modal();
            });
        });
    </script>
</body>
</html>
