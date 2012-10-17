package br.com.triadworks.issuetracker.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.triadworks.issuetracker.model.Usuario;
import br.com.triadworks.issuetracker.service.Autenticador;

@Resource
public class LoginController {
	
	private final Autenticador autenticador;
	private final UsuarioWeb usuarioWeb;
	private final Validator validator;
	private final Result result;

	public LoginController(Autenticador autenticador, UsuarioWeb usuarioWeb, Validator validator, Result result) {
		this.autenticador = autenticador;
		this.usuarioWeb = usuarioWeb;
		this.validator = validator;
		this.result = result;
	}

	@Get("/login")
	public void formulario() { }
	
	@Post("/login")
	public void logar(String login, String senha) {
		
		Usuario usuario = autenticador.autentica(login, senha);
		if (usuario != null) {
			usuarioWeb.loga(usuario);
			result.redirectTo(IssueController.class).lista(); // TODO: alterar para DashBoard
		}
		
		validator.add(new ValidationMessage("Login e/ou senha inválidos", "usuario.login"));
		validator.onErrorUsePageOf(this).formulario();
	}
	
	@Get("/logout")
	public void sair() {
		usuarioWeb.logout();
		result.redirectTo(this).formulario();
	}
	
}
