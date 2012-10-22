<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Issue Tracker</title>
		<%@ include file="/templates/head.jsp" %>
		<script type="text/javascript">
			$(function() {
				$("#form").validate({
					rules: {
						"issue.sumario": {
							required: true,
							minlength: 3
						},
						"issue.descricao": {
							required: true,
							minlength: 10,
							maxlength: 100
						},
						"issue.projeto.id": {
							required: true
						},
						"issue.tipo": {
							required: true
						},
						"issue.reportadoEm": {
							required: true
						},
						"issue.assinadoPara.id": {
							required: true
						}
					}
				});
			});
		</script>
	</head>
	<body>

		<%@ include file="/templates/menu.jsp" %>
	
		<div class="wrapper">
			<div class="container">
			
				<%@ include file="/templates/messages.jsp" %>
				
				<form id="form"
					action="adiciona" 
					method="post" class="form-horizontal">
					<legend>Cadastro de Issues</legend>
					<div class="control-group required">
						<label class="control-label">Sumário</label>
						<div class="controls">
							<input type="text" class="span7"
								name="issue.sumario">
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Descrição</label>
						<div class="controls">
							<textarea rows="4" class="span7"
								name="issue.descricao"></textarea>
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Projeto</label>
						<div class="controls">
							<select class="span4" name="issue.projeto.id">
								<option value="">-- Selecione um projeto --</option>
								<c:forEach var="projeto" items="${projetos}">
									<option value="${projeto.id}">${projeto.nome}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Tipo</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="issue.tipo" value="BUG" checked>
								Bug
							</label>
							<label class="radio">
								<input type="radio" name="issue.tipo" value="FEATURE">
								Feature
							</label>
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Reportado em</label>
						<div class="controls">
							<input type="text" class="span2"
								name="issue.reportadoEm">
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Reportado por</label>
						<div class="controls">
							<input type="text" class="span4" 
								value="Rafael Ponte" readonly="readonly">
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Assinado para</label>
						<div class="controls">
							<select class="span4" name="issue.assinadoPara.id">
								<option value="">-- Selecione um usuário --</option>
								<c:forEach var="usuario" items="${usuarios}">
									<option value="${usuario.id}">${usuario.nome}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-actions">
						<div class="pull-right">
							<a href="lista" class="btn">Cancelar</a>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="/templates/footer.jsp" %>
		
	</body>
</html>