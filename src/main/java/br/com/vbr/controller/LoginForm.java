package br.com.vbr.controller;

import org.hibernate.validator.constraints.NotBlank;


/**
 * Created by vanderson on 15/04/2016.
 */
public class LoginForm {

	@NotBlank
	private String usuario;

	@NotBlank
	private String senha;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
