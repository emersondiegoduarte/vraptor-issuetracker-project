<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
	</head>
	<body>

		<%@ include file="/templates/menu.jsp" %>
	
		<div class="wrapper">
			<div class="container">
				
				<%@ include file="/templates/messages.jsp" %>
				
				<legend>Cadastro de Issues</legend>
				<form action="lista" method="get">
					<div class="pull-right">
						<a href="novo" class="btn">Novo</a>
						<button class="btn btn-primary" type="submit">Listar</button>
					</div>
				</form>
				<br /><br />
				<table class="table table-striped ">
					<thead>
						<tr>
							<th>#</th>
							<th>Sumário</th>
							<th>Projeto</th>
							<th>Tipo</th>
							<th>Status</th>
							<th>Última Autalização</th>
							<th>Assinado para</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="issue" items="${issueList}">
							<tr>
								<td>${issue.id }</td>
								<td>${issue.sumario }</td>
								<td>${issue.projeto.nome }</td>
								<td>${issue.tipo }</td>
								<td>${issue.status }</td>
								<td><fmt:formatDate value="${issue.atualizadoEm }" type="both"/></td>
								<td>${issue.assinadoPara.nome }</td>
								<td class="nowrap">
									<a href="edita?id=${issue.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
	    							<a href="remove?id=${issue.id }" onclick="return confirm('Deseja realmente remover esa issue?');"><i class="icon-trash"></i> Excluir</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<%@ include file="/templates/footer.jsp" %>
		
	</body>
</html>