package com.GRUPO10.Negocio;

import java.util.List;

import com.GRUPO10.Entidades.Turno;

public interface ITurnoNegocio {
	public boolean insertarTurno(Turno turno);
	public boolean editarTurno(Turno turno);
	public boolean bajaLogicaTurno(Turno turno);
	public List<Turno> obtenerTodosLosTurnos();
	public Turno obtenerTurnoPorId(Integer idTurno);
	public boolean existeTurno(Turno turno);
	List<String> turnosNoDisponibles(String legajo, String formattedDate, String horarios);
}
