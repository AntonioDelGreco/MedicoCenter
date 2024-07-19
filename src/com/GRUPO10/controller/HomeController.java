package com.GRUPO10.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GRUPO10.NegocioImp.UsuarioNegocio;

import com.GRUPO10.Entidades.Medico;
import com.GRUPO10.Entidades.TurnoEstadoEnum;
import com.GRUPO10.NegocioImp.MedicoNegocio;

import com.GRUPO10.Entidades.Usuario;

@Controller
public class HomeController {
	ApplicationContext appContext = new ClassPathXmlApplicationContext("com/GRUPO10/Resources/Beans.xml");

	@RequestMapping("index.html")
	public ModelAndView home() {
		ModelAndView MV = new ModelAndView();
		MV.setViewName("index");
		return MV;
	}

	@RequestMapping("controller.html")
	public ModelAndView sideBarNavegacion(@RequestParam("page") String page) {
		ModelAndView mv = new ModelAndView();
		if(page.equals("listarTurnos")) {
			mv.setViewName("redirect:/redireccionar_listarTurnos.html");
		}else {
			mv.setViewName(page);
		}
		return mv;
	}

	@RequestMapping("redireccionar_login.html")
	public ModelAndView eventoRedireccionarLogin() {
		ModelAndView MV = new ModelAndView();
		MV.setViewName("login");
		return MV;
	}

	@RequestMapping("procesar_login.html")
	public ModelAndView eventoProcesarLogin(String username, String clave,HttpSession session) {

		UsuarioNegocio usuarioNegocio = (UsuarioNegocio) appContext.getBean("beanUsuarioNegocio");
		Usuario usuario = (Usuario) appContext.getBean("beanUsuario");
		usuario.setNombre(username);
		usuario.setContrasena(clave);

		ModelAndView MV = new ModelAndView();
		
		Usuario dataUsuario = usuarioNegocio.loginData(usuario);

		if(dataUsuario != null) {
			Medico medicoLogueado=dataUsuario.getMedico();
			if (medicoLogueado != null) {	
				MV.setViewName("medicPanel");
				session.setAttribute("medicoLogueado",medicoLogueado);
				MV.addObject("userType", "medico");
			} else {
				MV.setViewName("adminPanel");
				MV.addObject("userType", "admin");
			}

		} else {
			MV.setViewName("login");
			MV.addObject("mensaje", "Usuario o contraseña invalidos");
		}
		return MV;

	}
	
	@RequestMapping("cerrar_sesion.html")
	public ModelAndView cerrarSesion(HttpSession session) {
		ModelAndView MV = new ModelAndView();
		session.invalidate();
		MV.setViewName("login");
		return MV;
	}
}