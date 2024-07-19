package com.GRUPO10.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GRUPO10.Entidades.Especialidad;
import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Entidades.Turno;
import com.GRUPO10.Entidades.TurnoEstadoEnum;
import com.GRUPO10.Entidades.Medico;
import com.GRUPO10.NegocioImp.EspecialidadNegocio;
import com.GRUPO10.NegocioImp.TurnoNegocio;
import com.GRUPO10.NegocioImp.MedicoNegocio;
import com.GRUPO10.NegocioImp.PacienteNegocio;

@Controller
public class TurnoController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("com/GRUPO10/Resources/Beans.xml");
	
    // Negocios
    TurnoNegocio turnoNegocio = (TurnoNegocio) appContext.getBean("beanTurnoNegocio");
    EspecialidadNegocio especialidadNegocio = (EspecialidadNegocio) appContext.getBean("beanEspecialidadNegocio");
    MedicoNegocio medicoNegocio = (MedicoNegocio) appContext.getBean("beanMedicoNegocio");
    PacienteNegocio pacienteNegocio = (PacienteNegocio) appContext.getBean("beanPacienteNegocio");
	
    @RequestMapping("buscarTurnoEditar.html")
    public ModelAndView buscarTurnoEditar(Integer idTurno,HttpSession session) {
        ModelAndView MV = new ModelAndView();
        Boolean esDeMedicoLogueado=false;
        Turno turno = turnoNegocio.obtenerTurnoPorId(idTurno);
        if(turno!=null) {
        	List<Turno> turnosMedicoLogueado=turnoNegocio.obtenerTurnosPorMedico((Medico)session.getAttribute("medicoLogueado"));
    	    for (Turno t : turnosMedicoLogueado) {
    			if(t.getId_turno()==(turno.getId_turno())) {
    				if((turno.getEstadoTurno().equals(TurnoEstadoEnum.Pendiente))||(turno.getEstadoTurno().equals(TurnoEstadoEnum.Confirmado))) {
    					MV.addObject("turno", turno);
        	    	}else {
        	    		MV.addObject("mensaje", "No se puede cambiar su estado. Ya se encuentra "+turno.getEstadoTurno());
        	    	}
    				esDeMedicoLogueado=true;
    			}
    	    }
    	    if(!esDeMedicoLogueado) {   	    	
    	    	MV.addObject("mensaje", "No pertenece al Medico Logueado");
    	    }
   
        }else {
        	MV.addObject("mensaje", "No existe turno con ID "+idTurno);
        }
        
        MV.setViewName("cargarEstadosTurnos");
        return MV;
    }
    
    @RequestMapping(value = "actualizarTurno.html", method = RequestMethod.POST)
    public ModelAndView actualizarTurno(@RequestParam Integer idTurno,
                                        @RequestParam String estado,
                                        @RequestParam(required = false) String observaciones) {
        ModelAndView MV = new ModelAndView();
        Turno turno = turnoNegocio.obtenerTurnoPorId(idTurno);
        
        turno.setEstadoTurno(TurnoEstadoEnum.valueOf(estado));
        turno.setObservacion(observaciones);
        if (turnoNegocio.editarTurno(turno)) {
            MV.addObject("mensajeOK", "Turno actualizado correctamente");
        } else {
            MV.addObject("mensaje", "Error al actualizar el turno");
        }
        
        MV.setViewName("cargarEstadosTurnos");
        return MV;
    }


    @RequestMapping("redireccionar_listarTurnos.html")
    public ModelAndView eventoRedireccionarListadoTurnos(HttpSession session) {
        ModelAndView MV = new ModelAndView();
        MV.addObject("estadoTurnos",TurnoEstadoEnum.values()); //Carga todos los posibles estados de Turnos
        Medico medicoLogueado=(Medico)session.getAttribute("medicoLogueado"); // Obtenemos todos los turnos del m�dico logueado
        List<Turno> todosLosTurnosMedico=turnoNegocio.obtenerTurnosPorMedico(medicoLogueado);
        session.setAttribute("turnosSession", todosLosTurnosMedico);
        MV.addObject("turnos", todosLosTurnosMedico);
        MV.setViewName("listarTurnos");
        return MV;
    }
    

    
    @RequestMapping("buscarTurnoPorDNI.html")
    public ModelAndView eventoBuscarTurnoDNI(Paciente pacienteDNI,HttpSession session) {
        ModelAndView MV = new ModelAndView();
        List<Turno> turnosDNI = turnoNegocio.obtenerTurnosPorDNI(pacienteDNI);
        List<Turno> turnosFiltrados = new ArrayList<Turno>();
        Medico medicoLogueado=(Medico)session.getAttribute("medicoLogueado");
        for (Turno turno : turnosDNI) {
			if(turno.getMedico().getLegajo()==medicoLogueado.getLegajo()) {
				turnosFiltrados.add(turno);
			}
		}
        session.setAttribute("turnosSession", turnosFiltrados);
        MV.addObject("turnos", turnosFiltrados);
        MV.addObject("estadoTurnos",TurnoEstadoEnum.values());
        MV.setViewName("listarTurnos");
        return MV;
    }
    

    @RequestMapping("filtrarFechasTurno.html")
    public ModelAndView eventofiltrarFechasTurno(HttpSession session,String fecha) {
        ModelAndView MV = new ModelAndView();       
        List <Turno> turnosBase=(ArrayList<Turno>)session.getAttribute("turnosSession");
        List<Turno> turnosFiltrados=new ArrayList<Turno>();
        for (Turno turno : turnosBase) {     	
			if(turno.getFecha().toString().equals(fecha)) {
				turnosFiltrados.add(turno);
			}
		}     
        MV.addObject("estadoTurnos",TurnoEstadoEnum.values()); 
        session.setAttribute("turnosSession", turnosFiltrados);
        MV.addObject("turnos", turnosFiltrados);
        MV.setViewName("listarTurnos");
        return MV;
    }
    
    @RequestMapping("filtrarEstadoTurno.html")
    public ModelAndView eventofiltrarEstadoTurno(HttpSession session,String estadoTurno) {
        ModelAndView MV = new ModelAndView(); 
        if(!estadoTurno.equals("-1")) {
        	List <Turno> turnosBase=(ArrayList<Turno>)session.getAttribute("turnosSession");
            List<Turno> turnosFiltrados=new ArrayList<Turno>();
            for (Turno turno : turnosBase) {  
    			if(turno.getEstadoTurno().toString().equals(estadoTurno)) {
    				turnosFiltrados.add(turno);
    			}
    		}     
            
            session.setAttribute("turnosSession", turnosFiltrados);
        }else {
        	MV.addObject("mensajeFiltro2", "Por favor seleccione una opci�n v�lida.");
        }
        MV.addObject("estadoTurnos",TurnoEstadoEnum.values()); 
        MV.addObject("turnos", session.getAttribute("turnosSession"));
        MV.setViewName("listarTurnos");
        return MV;
    }
    
    
    @RequestMapping("obtenerDetalleTurno.html")
    public ModelAndView obtenerDetalleTurno(Turno turnoID,Paciente pa) {
        ModelAndView MV = new ModelAndView();
        Turno turno = turnoNegocio.obtenerTurnoPorId(turnoID.getId_turno());
        
        if(pacienteNegocio.existePaciente(pa)) {
        	Paciente paciente=pacienteNegocio.obtenerPacientePorDNI(pa.getDni());
        	if(paciente!=null) {
        		MV.addObject("pacienteBuscado", paciente);
        	}else {
        		MV.addObject("mensaje", "Ocurri� un error al recuperar al paciente con DNI "+pa.getDni());
        	}        	
        }else{
        	MV.addObject("mensaje", "No existe paciente con DNI "+pa.getDni());
        };     

        MV.addObject("turno", turno);   	
        MV.setViewName("listarDetallesTurno");
        return MV;
    }
    
    @RequestMapping("asignarTurno.html")
    public ModelAndView asignarTurno() {
        ModelAndView MV = new ModelAndView();
        List<Especialidad> especialidades = especialidadNegocio.obtenerTodasLasEspecialidades();
        MV.addObject("especialidades", especialidades);
        MV.setViewName("asignarTurno");
        return MV;
    }
    
    @RequestMapping(value = "/cargarMedicosPorEspecialidad.html", method = RequestMethod.GET)
    public ModelAndView cargarMedicosPorEspecialidad(@RequestParam("idEspecialidad") String especialidad) {
        ModelAndView mv = new ModelAndView();
        List<Medico> medicos = medicoNegocio.obtenerMedicosPorEspecialidad(especialidad);
        
        
        mv.setViewName("asignarTurno");
        mv.addObject("medicos", medicos);
        
        return mv;
    }
    
    @RequestMapping("confirmarTurno.html")
    public ModelAndView confirmarTurno(String especialidad, String medico,
            String fecha, String horario, String dniPaciente) {
    	
    	ModelAndView MV = new ModelAndView();

        List<Especialidad> especialidades = especialidadNegocio.obtenerTodasLasEspecialidades();
        MV.addObject("especialidades", especialidades);
        
    	
    	// Formato de fecha esperado
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        try {
            Date date = inputFormat.parse(fecha);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        int pacienteDni = Integer.parseInt(dniPaciente);
        Paciente pacienteTurno = pacienteNegocio.buscarPacienteTurno(pacienteDni);
        
        Long legajoMedico = Long.parseLong(medico);
        Medico medicoTurno = medicoNegocio.obtenerMedicoPorLegajo(legajoMedico);
        
        Turno turno = new Turno();
        
        turno.setMedico(medicoTurno);
        turno.setFecha(formattedDate);
        turno.setHora(Time.valueOf(horario));
        turno.setPaciente(pacienteTurno);
        
        turnoNegocio.insertarTurno(turno);
        
        MV.addObject("mensaje", "Turno agregado correctamente");
        MV.setViewName("asignarTurno");
        return MV;
    }

    @RequestMapping(value = "/turnosNoDisponibles.html", method = RequestMethod.GET)
    public ModelAndView turnosNoDisponibles(@RequestParam("legajo") String legajo,
    		@RequestParam("fecha") String fecha, @RequestParam("horario") String horario) {
    	
        ModelAndView mv = new ModelAndView();
        
        
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        try {
            Date date = inputFormat.parse(fecha);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        

        List<String> turnos = turnoNegocio.turnosNoDisponibles(legajo, formattedDate, horario);
        
        
        mv.setViewName("asignarTurno");
        mv.addObject("turnos", turnos);
        
        return mv;
    }
}
