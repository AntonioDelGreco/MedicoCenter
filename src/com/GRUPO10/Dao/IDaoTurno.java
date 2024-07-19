package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Entidades.Turno;

public interface IDaoTurno {
	public boolean InsertarTurno(Turno turno);
	public boolean ModificarTurno(Turno turno);
	public boolean BorrarTurno(Turno turno);
	public Turno getTurno(Integer idTurno);
	public List<Turno> getAllTurnos();
	public List<Turno> getTurnosDNI(Paciente pac);
	public List<Turno> turnosNoDisponibles(String legajo, String formattedDate);
}
