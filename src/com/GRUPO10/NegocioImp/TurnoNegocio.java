package com.GRUPO10.NegocioImp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.GRUPO10.Dao.IDaoMedico;
import com.GRUPO10.Dao.IDaoTurno;
import com.GRUPO10.Entidades.Medico;
import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Entidades.Turno;
import com.GRUPO10.Entidades.TurnoEstadoEnum;
import com.GRUPO10.Negocio.ITurnoNegocio;

public class TurnoNegocio implements ITurnoNegocio {
	private IDaoTurno daoTurno;
	private IDaoMedico daoMedico;
	
	public TurnoNegocio() {
		
	}
	
	public TurnoNegocio(IDaoTurno daoTurno, IDaoMedico daoMedico) {
		this.daoTurno = daoTurno;
		this.daoMedico = daoMedico;
	}


	public IDaoTurno getDaoTurno() {
		return daoTurno;
	}

	public void setDaoTurno(IDaoTurno daoTurno) {
		this.daoTurno = daoTurno;
	}

	@Override
	public boolean insertarTurno(Turno turno) {
		turno.setEstado(true);
		turno.setEstadoTurno(TurnoEstadoEnum.Pendiente);
		return daoTurno.InsertarTurno(turno);
	}

	@Override
	public boolean editarTurno(Turno turno) {
		return daoTurno.ModificarTurno(turno);
	}

	@Override
	public boolean bajaLogicaTurno(Turno turno) {
		return daoTurno.BorrarTurno(turno);
	}

	@Override
	public List<Turno> obtenerTodosLosTurnos() {
		return daoTurno.getAllTurnos();
	}

	@Override
	public Turno obtenerTurnoPorId(Integer idTurno) {
		return daoTurno.getTurno(idTurno);
	}
	
	public List<Turno> obtenerTurnosPorDNI(Paciente pac) {
		return daoTurno.getTurnosDNI(pac);
	}

	public List<Turno> obtenerTurnosPorMedico(Medico medicoLogueado){
		List<Turno> todosLosTurnos=obtenerTodosLosTurnos();
		List<Turno> turnosFiltrados=new ArrayList<Turno>();
		for (Turno turno : todosLosTurnos) {
			if(turno.getMedico().getLegajo().equals(medicoLogueado.getLegajo())) {
				turnosFiltrados.add(turno);
			}
		}
		return turnosFiltrados;
	}

	public List<Turno> obtenerTurnosPeriodo(Date fechaInicio, Date fechaFin){
		List<Turno> todosLosTurnos=obtenerTodosLosTurnos();
		List<Turno> turnosFiltrados=new ArrayList<Turno>();	
        
		for (Turno turno : todosLosTurnos) {
			if(turno.getFecha().after(fechaInicio)||turno.getFecha().equals(fechaInicio)) {
				if(turno.getFecha().before(fechaFin)||turno.getFecha().equals(fechaFin)) {
					turnosFiltrados.add(turno);
				}
			}

		}
		return turnosFiltrados;
	}
	
	
	@Override
	public boolean existeTurno(Turno turno) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public List<String> turnosNoDisponibles(String legajo, String fecha, String horarios) {
		
	    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
	    
	    
	    List<Turno> turnosNoDisponibles = daoTurno.turnosNoDisponibles(legajo, horarios);
	    List<String> horariosNoDisponibles = new ArrayList<>();
	    
	    for (Turno turno : turnosNoDisponibles) {
	        // Converti la fecha del turno a una cadena en el mismo formato que formattedDate
	        String turnoFechaString = outputFormat.format(turno.getFecha());

		    
	        if (turnoFechaString.equals(fecha)) {
	            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	            String timeString = sdf.format(turno.getHora());
	            horariosNoDisponibles.add(timeString);
	    	    
	        }
	    }
	    
	    String[] partes = horarios.split(" - ");
	    String horaInicio = partes[0];
	    String horaFin = partes[1];

	    String[] inicio = horaInicio.split(":");
	    String[] fin = horaFin.split(":");

	    int inicioHoras = Integer.parseInt(inicio[0]);
	    int finHoras = Integer.parseInt(fin[0])-1;
	    
	    List<String> listaHorarios = new ArrayList<>();

	    while (inicioHoras <= finHoras) {
	        String opcion = String.format("%02d:00:00", inicioHoras);
	        
	        // Verifico si la opción está en horariosNoDisponibles
	        if (!horariosNoDisponibles.contains(opcion)) {
	            listaHorarios.add(opcion);
	        }
	        inicioHoras++;
	    }
	    
	    if (turnosNoDisponibles == null) {
	        return null;
	    } else {
	        return listaHorarios;
	    }
	}


}
