package com.GRUPO10.Negocio;

import java.util.List;

import com.GRUPO10.Entidades.Especialidad;

public interface IEspecialidadNegocio {
	public boolean insertarEspecialidad(Especialidad especialidad);
	public boolean editarEspecialidad(Especialidad especialidad);
	public boolean bajaLogicaEspecialidad(Especialidad especialidad);
	public List<Especialidad> obtenerTodasLasEspecialidades();
	public Especialidad obtenerEspecialidadPorId(int idEspecialidad);
	public boolean existeEspecialidad(Especialidad especialidad);
}
