package com.GRUPO10.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RestController;



import com.GRUPO10.Entidades.Especialidad;
import com.GRUPO10.Entidades.Localidad;
import com.GRUPO10.Entidades.Medico;
import com.GRUPO10.Entidades.Provincia;
import com.GRUPO10.Entidades.Usuario;
import com.GRUPO10.NegocioImp.EspecialidadNegocio;
import com.GRUPO10.NegocioImp.LocalidadNegocio;
import com.GRUPO10.NegocioImp.MedicoNegocio;
import com.GRUPO10.NegocioImp.ProvinciaNegocio;
import com.GRUPO10.NegocioImp.UsuarioNegocio;


@Controller
public class MedicoController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("com/GRUPO10/Resources/Beans.xml");
	
    // Negocios
    MedicoNegocio medicoNegocio = (MedicoNegocio) appContext.getBean("beanMedicoNegocio");
    EspecialidadNegocio especialidadNegocio = (EspecialidadNegocio) appContext.getBean("beanEspecialidadNegocio");
    UsuarioNegocio usuarioNegocio=(UsuarioNegocio) appContext.getBean("beanUsuarioNegocio");
    ProvinciaNegocio provinciaNegocio = (ProvinciaNegocio) appContext.getBean("beanProvinciaNegocio");
    LocalidadNegocio localidadNegocio = (LocalidadNegocio) appContext.getBean("beanLocalidadNegocio");
	
    
    @RequestMapping("redireccionar_listarMedicos.html")
    public ModelAndView eventoRedireccionarListMedicos() {
        ModelAndView MV = new ModelAndView();
        List<Medico> medicos = medicoNegocio.obtenerTodosLosMedicos();
        MV.addObject("medicos", medicos);
        MV.setViewName("listarMedicos");
        return MV;
    }
    
    @RequestMapping("redireccionar_bajaMedico.html")
    public ModelAndView eventoRedireccionarBajaMedicos() {
        ModelAndView MV = new ModelAndView();
        List<Medico> medicos = medicoNegocio.obtenerTodosLosMedicos();
        MV.addObject("medicos", medicos);
        MV.setViewName("listarMedicos");
        return MV;
    }
    
    @RequestMapping("buscarMedicoEliminar.html")
    public ModelAndView eventoBuscarMedico(long legajo) {
        ModelAndView MV = new ModelAndView();
        Medico medico = medicoNegocio.obtenerMedicoPorLegajo(legajo);
        if (medico != null && medico.isEstado()) { // Verifica que el estado sea true
        	MV.addObject("medico", medico);
        } else {
            MV.addObject("mensaje", "No está habilitado el medico con legajo " + legajo);
        } 
        MV.setViewName("bajaMedico");
        return MV;
    }
    
    @RequestMapping("eliminarMedico.html")
    public ModelAndView eventoBajaMedico(Long legajo) {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("bajaMedico");
        Medico medico = medicoNegocio.obtenerMedicoPorLegajo(legajo);
        
        if(medicoNegocio.bajaLogicaMedico(medico)) 
		{
			MV.addObject("mensaje", "Medico eliminado correctamente");
		}
		else 
		{
			MV.addObject("mensaje", "No se pudo eliminar al medico");
		}
        return MV;
    }
    
    @RequestMapping("/redireccionar_verMedico.html")
    public ModelAndView verMedico(@RequestParam("legajo") Long legajo) {
        ModelAndView MV = new ModelAndView(); 
        Medico medico = medicoNegocio.obtenerMedicoPorLegajo(legajo);
        if(medico==null) 
		{
        	Medico medico2=(Medico) appContext.getBean("beanMedico");
        	medico2.setLegajo(legajo);
        	if(medicoNegocio.existeMedico(medico2)) {
        		MV.addObject("mensaje", "No se pudo obtener medico");
        	}else {
        		MV.addObject("mensaje", "No se existe medico con legajo "+legajo);
        	}
		}
		
        MV.addObject("medico", medico);
        MV.setViewName("verMedico");
        return MV;
    }
    
    @RequestMapping("/redireccionar_editarMedico.html")
    public ModelAndView editarMedico(@RequestParam("legajo") Long legajo) {
        ModelAndView MV = new ModelAndView();
        Medico medico = medicoNegocio.obtenerMedicoPorLegajo(legajo);
        List<Especialidad> especialidades = especialidadNegocio.obtenerTodasLasEspecialidades();
        List<Provincia> provincias = provinciaNegocio.getAllProvincias();
        List<Localidad> localidades = localidadNegocio.getLocalidadesSegunProvincia(provinciaNegocio.getProvincia(medico.getLocalidad().getProvincia().getIdProvincia()));
        MV.addObject("medico", medico);
        MV.addObject("especialidades", especialidades);
        MV.addObject("provincias", provincias);
        MV.addObject("localidades", localidades);
        MV.setViewName("modificarMedico");
        return MV;
    }
    
    @RequestMapping("/redireccionar_insertarMedico.html")
    public ModelAndView altaMedico() {
        ModelAndView MV = new ModelAndView();
        List<Especialidad> especialidades = especialidadNegocio.obtenerTodasLasEspecialidades();
        List<Provincia> provincias = provinciaNegocio.getAllProvincias();
        MV.addObject("provincias", provincias);
        MV.addObject("especialidades", especialidades);
        MV.setViewName("altaMedico");
        return MV;
    }
    
    
    @RequestMapping(value = "/modificarMedico.html", method = RequestMethod.POST)
    public ModelAndView modificarMedico(Long legajo, String nombre, String apellido, String sexo,
            String nacimiento, String direccion, Long localidad,
            String correo, String telefono, String dias,
            String horaInicio, String horaFin, Integer especialidad, Boolean estado) throws ParseException {
    	ModelAndView MV = new ModelAndView();
    	
    	DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime inicio, fin;
        
        try {
            inicio = LocalTime.parse(horaInicio.trim(), timeFormatter);
            fin = LocalTime.parse(horaFin.trim(), timeFormatter);
            
            if (!inicio.isBefore(fin)) {
                MV.addObject("error", "La hora de inicio debe ser anterior a la hora de fin.");
                MV.setViewName("altaMedico");
                return MV;
            }
        } catch (DateTimeParseException e) {
        	MV.addObject("error", "Formato de hora invalido. Use HH:mm.");
        	MV.setViewName("modificarMedico");
            return MV;
        }
        
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        
        try {
            Date date = inputFormat.parse(nacimiento);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Medico medico = (Medico) appContext.getBean("beanMedico");
        medico.setLegajo(legajo);
        medico.setNombre(nombre);
        medico.setApellido(apellido);
        medico.setSexo(sexo);
        medico.setNacimiento(formattedDate);
        medico.setDireccion(direccion);
        medico.setLocalidad(localidadNegocio.getLocalidad(localidad));
        medico.setCorreo(correo);
        medico.setTelefono(Long.parseLong(telefono));
        medico.setDias(dias);
        medico.setUsuario(medicoNegocio.obtenerMedicoPorLegajo(legajo).getUsuario());
        
        String horarios = horaInicio + " - " + horaFin;
        medico.setHorarios(horarios);
        
        medico.setEspecialidad(especialidadNegocio.obtenerEspecialidadPorId(especialidad));
        medico.setEstado(estado);
        boolean medicoUpdated = medicoNegocio.editarMedico(medico);

        if(!medicoUpdated) {
            MV.addObject("mensaje", "Medico no pudo ser actualizado correctamente");
            MV.setViewName("modificarMedico");
        } else {
            MV.setViewName("redirect:/redireccionar_verMedico.html?legajo=" + medico.getLegajo());
        }
        return MV;
    }

    
    @RequestMapping("altaMedico.html")
    public ModelAndView insertarMedico(String nombre, String apellido, String sexo,
                           String nacimiento, String direccion, Long localidad,
                           String correo, String telefono, String dias,
                           String horaInicio, String horaFin, Integer especialidad,
                           String usuario, String contrasena) {
        
        ModelAndView modelAndView = new ModelAndView();
        List<Especialidad> especialidades = especialidadNegocio.obtenerTodasLasEspecialidades();
        List<Provincia> provincias = provinciaNegocio.getAllProvincias();
        modelAndView.addObject("provincias", provincias);
        modelAndView.addObject("especialidades", especialidades);
        
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime inicio, fin;
        
        try {
            inicio = LocalTime.parse(horaInicio.trim(), timeFormatter);
            fin = LocalTime.parse(horaFin.trim(), timeFormatter);
            
            if (!inicio.isBefore(fin)) {
                modelAndView.addObject("error", "La hora de inicio debe ser anterior a la hora de fin.");
                modelAndView.setViewName("altaMedico");
                return modelAndView;
            }
        } catch (DateTimeParseException e) {
            modelAndView.addObject("error", "Formato de hora invalido. Use HH:mm.");
            modelAndView.setViewName("altaMedico");
            return modelAndView;
        }

        Usuario nuevoUsuario = (Usuario) appContext.getBean("beanUsuario");
        nuevoUsuario.setNombre(usuario);
        nuevoUsuario.setContrasena(contrasena);
        
        if(!usuarioNegocio.verificaNombre(usuario)) {
        	 modelAndView.addObject("error", "Nombre de usuario ya existente.");
             modelAndView.setViewName("altaMedico");
             return modelAndView;
        }
        if(dias==null) {
        	modelAndView.addObject("error", "Debe seleccionar al menos un dia");
            modelAndView.setViewName("altaMedico");
            return modelAndView;
        }
        usuarioNegocio.InsertarUsuario(nuevoUsuario);
        
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = null;
        
        try {
            Date date = inputFormat.parse(nacimiento);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Medico medico = (Medico) appContext.getBean("beanMedico");
        medico.setNombre(nombre);
        medico.setApellido(apellido);
        medico.setSexo(sexo);
        medico.setNacimiento(formattedDate);
        medico.setDireccion(direccion);
        medico.setLocalidad(localidadNegocio.getLocalidad(localidad));
        medico.setCorreo(correo);
        medico.setTelefono(Long.parseLong(telefono));
        medico.setDias(dias);
        
        String horarios = horaInicio + " - " + horaFin;
        medico.setHorarios(horarios);
        
        medico.setUsuario(nuevoUsuario);
        medico.setEspecialidad(especialidadNegocio.obtenerEspecialidadPorId(especialidad));

        if (medicoNegocio.insertarMedico(medico)) {
            modelAndView.addObject("mensaje", "Medico creado correctamente");
        } else {
            modelAndView.addObject("error", "No se pudo crear el medico");
        }
        
        return modelAndView;
    }

    
    @RequestMapping(value = "/cargarLocalidades", method = RequestMethod.POST)
    public void cargarLocalidades(@RequestParam("provinciaId") Long provinciaId, HttpServletResponse response) throws IOException {
        Provincia provincia = provinciaNegocio.getProvincia(provinciaId);
        List<Localidad> localidades = localidadNegocio.getLocalidadesSegunProvincia(provincia);

        StringBuilder sb = new StringBuilder();
        sb.append("<option value=\"\" disabled selected>Seleccione una localidad</option>");
        if (localidades != null && !localidades.isEmpty()) {
            for (Localidad localidad : localidades) {
                sb.append("<option value=\"").append(localidad.getIdLocalidad()).append("\">")
                  .append(localidad.getNombre()).append("</option>");
            }
        } else {
            sb.append("<option value=\"\">No se encontraron localidades</option>");
        }

        response.setContentType("text/html");
        response.getWriter().print(sb.toString());
    }
}
