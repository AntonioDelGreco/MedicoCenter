package com.GRUPO10.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GRUPO10.Entidades.Localidad;
import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Entidades.Provincia;
import com.GRUPO10.NegocioImp.LocalidadNegocio;
import com.GRUPO10.NegocioImp.PacienteNegocio;
import com.GRUPO10.NegocioImp.ProvinciaNegocio;


@Controller
public class PacienteController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("com/GRUPO10/Resources/Beans.xml");
	
    // Negocios
    PacienteNegocio pacienteNegocio = (PacienteNegocio) appContext.getBean("beanPacienteNegocio");
    LocalidadNegocio localidadNegocio = (LocalidadNegocio) appContext.getBean("beanLocalidadNegocio");
    ProvinciaNegocio provinciaNegocio = (ProvinciaNegocio) appContext.getBean("beanProvinciaNegocio");
	
    
    
    @RequestMapping("redireccionar_altaPaciente.html")
    public ModelAndView eventoRedireccionarAltaPacientes() {
        ModelAndView MV = new ModelAndView();
        List<Provincia> provincias = provinciaNegocio.getAllProvincias();
        MV.addObject("provincias", provincias);
        MV.setViewName("altaPaciente");
        return MV;
    }
    
    @RequestMapping("redireccionar_bajaPaciente.html")
    public ModelAndView eventoRedireccionarBajaPacientes() {
        ModelAndView MV = new ModelAndView();
        List<Paciente> pacientes = pacienteNegocio.obtenerTodosLosPacientes();
        MV.addObject("paciente", pacientes);
        MV.setViewName("bajaPaciente");
        return MV;
    }
    
    @RequestMapping("redireccionar_modificarPaciente.html")
    public ModelAndView eventoRedireccionarModificarPacientes() {
        ModelAndView MV = new ModelAndView();
        List<Paciente> pacientes = pacienteNegocio.obtenerTodosLosPacientes();
        MV.addObject("paciente", pacientes);
        MV.setViewName("modificarPaciente");
        return MV;
    }
    
    @RequestMapping("altaPaciente.html")
    public ModelAndView c(int dni, String nombre, String apellido,
            String nacimiento, Long provincia, Long localidad, String direccion,
            String correo, String telefono) {
    	
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        try {
            Date date = inputFormat.parse(nacimiento);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        PacienteNegocio pacienteNegocio = (PacienteNegocio) appContext.getBean("beanPacienteNegocio");
        Paciente paciente = (Paciente) appContext.getBean("beanPaciente");
        paciente.setDni(dni);
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setFechaNacimiento(formattedDate);
        paciente.setProvincia(provinciaNegocio.getProvincia(provincia));
        paciente.setLocalidad(localidadNegocio.getLocalidad(localidad));
        paciente.setDireccion(direccion);
        paciente.setEmail(correo);
        paciente.setTelefono(telefono);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("altaPaciente");
        List<Provincia> provincias = provinciaNegocio.getAllProvincias();
        modelAndView.addObject("provincias", provincias);
        if (pacienteNegocio.insertarPaciente(paciente)) {
            modelAndView.addObject("mensaje", "Paciente creado correctamente");
        } else {
            modelAndView.addObject("mensaje", "No se pudo crear el paciente");
        }
        return modelAndView;
    }
    
    @RequestMapping("buscarPacienteEliminar.html")
    public ModelAndView eventoBuscarPacienteEliminar(Paciente pa, String viewName) {
        ModelAndView MV = new ModelAndView();
        if (pacienteNegocio.existePaciente(pa)) {
            Paciente paciente = pacienteNegocio.obtenerPacientePorDNI(pa.getDni());
            if (paciente != null && paciente.isEstado()) { // Verifica que el estado sea true
                MV.addObject("pacienteEliminar", paciente);
            } else {
                MV.addObject("mensaje", "No está habilitado el paciente con DNI " + pa.getDni());
            }
        } else {
            MV.addObject("mensaje", "No existe paciente con DNI " + pa.getDni());
        }
        MV.setViewName(viewName);
        return MV;
    }

    
    @RequestMapping("eliminarPaciente.html")
    public ModelAndView eventoBajaPaciente(Integer dni) {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("bajaPaciente");
        Paciente paciente = pacienteNegocio.obtenerPacientePorDNI(dni);
        if(pacienteNegocio.bajaLogicaPaciente(paciente)) 
		{
			MV.addObject("mensaje", "Paciente eliminado correctamente");
		}
		else 
		{
			MV.addObject("mensaje", "No se pudo eliminar al paciente");
		}
        return MV;
    }
    
    @RequestMapping("buscarPaciente.html")
    public ModelAndView eventoBuscarPaciente(Paciente pa,String viewName) {
        ModelAndView MV = new ModelAndView();
        if(pacienteNegocio.existePaciente(pa)) {
        	Paciente paciente=pacienteNegocio.obtenerPacientePorDNI(pa.getDni());
        	if(paciente!=null) {
        		MV.addObject("pacienteBuscado", paciente);
        		List<Provincia> provincias = provinciaNegocio.getAllProvincias();
    	        List<Localidad> localidades = localidadNegocio.getLocalidadesSegunProvincia(paciente.getProvincia());
    	        MV.addObject("provincias", provincias);
    	        MV.addObject("localidades", localidades);
        	}else {
        		MV.addObject("mensaje", "Ocurrió un error al recuperar al paciente con DNI "+pa.getDni());
        	}        	
        }else{
        	MV.addObject("mensaje", "No existe paciente con DNI "+pa.getDni());
        };     
        MV.setViewName(viewName);
        return MV;
    }
    
    @RequestMapping("modificarPaciente.html")
    public ModelAndView eventoModificarPaciente(int dni, String nombre, String apellido,
            String fechaNacimiento, Long provincia, Long localidad, String direccion,
            String email, String telefono, Boolean estado) {
        ModelAndView MV = new ModelAndView();
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        Paciente pa = (Paciente) appContext.getBean("beanPaciente");
        try {
            Date date = inputFormat.parse(fechaNacimiento);
            formattedDate = outputFormat.format(date);
            
            pa.setDni(dni);
            pa.setNombre(nombre);
            pa.setApellido(apellido);
            pa.setFechaNacimiento(formattedDate);
            pa.setProvincia(provinciaNegocio.getProvincia(provincia));
            pa.setLocalidad(localidadNegocio.getLocalidad(localidad));
            pa.setDireccion(direccion);
            pa.setEmail(email);
            pa.setTelefono(telefono);
            pa.setFechaNacimiento(formattedDate);
            pa.setEstado(estado);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(pacienteNegocio.editarPaciente(pa)) {
        	MV.addObject("mensaje2", "Se ha editado correctamente el paciente con DNI "+pa.getDni());
        }else {
        	MV.addObject("mensaje", "Ha ocurrido un error al modificar el paciente con DNI"+pa.getDni());
        }
        MV.setViewName("modificarPaciente");
        return MV;
    }
    
    @RequestMapping("redireccionar_listarPaciente.html")
    public ModelAndView eventoRedireccionarListPacientes() {
        ModelAndView MV = new ModelAndView();
        List<Paciente> pacientes = pacienteNegocio.obtenerTodosLosPacientes();
        MV.addObject("pacientes", pacientes);
        MV.setViewName("listarPaciente");
        return MV;
    }
    
    @RequestMapping(value = "/buscarPacienteTurno.html", method = RequestMethod.GET)
    public ModelAndView buscarPaciente(@RequestParam("dni") int dni) {
        ModelAndView mv = new ModelAndView();
        
        Paciente paciente = pacienteNegocio.buscarPacienteTurno(dni);
        
        
        mv.setViewName("asignarTurno");
        mv.addObject("paciente", paciente);
        
        return mv;
    }

}
