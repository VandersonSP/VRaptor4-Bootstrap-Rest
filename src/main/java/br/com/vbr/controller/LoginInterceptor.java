package br.com.vbr.controller;

import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Created by vanderson on 15/04/2016.
 */
@Intercepts
@RequestScoped
public class LoginInterceptor {

	private static final String URL_LOGIN = "/login";


	@Inject
    HttpServletRequest request;
	@Inject
    HttpServletResponse response;

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) throws IOException {
        System.out.println("Interceptando " + request.getRequestURI());
			stack.next();
			//response.sendRedirect(URL_LOGIN);
		}

}
