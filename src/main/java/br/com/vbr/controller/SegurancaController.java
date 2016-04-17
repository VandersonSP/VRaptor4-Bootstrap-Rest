package br.com.vbr.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

import javax.inject.Inject;
import javax.validation.Valid;

/**
 * Created by vanderson on 15/04/2016.
 */
@Controller
public class SegurancaController {

    public static final String PATH = "/";
    public static final String PATH_ENTRAR = "/entrar";
    public static final String PATH_SAIR = "/sair";
    public static final String PATH_RECUPERACAO = "/recuperacao";
    private static final String EXIBIR_ALERTAS = "exibirAlertasLogin";

    @Inject
    Result result;
    @Inject
    Validator validator;

    @Get(PATH)
    public void login() {
        result.include("loginForm", new LoginForm());
    }

    @Post(PATH_ENTRAR)
    public void logar(@Valid LoginForm loginForm) {
        if (!validator.hasErrors()) {
            result.include(EXIBIR_ALERTAS, true);
        }
        validator.onErrorUsePageOf(this).login();
    }

    @Get(PATH_SAIR)
    public void logout() {
        result.redirectTo(this).login();
    }

    @Get(PATH_RECUPERACAO)
    public void recuperacao() {
        result.redirectTo("#");
    }

}
