package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Especialidad;

public interface IDaoEspecialidad {
	public boolean InsertarEspecialidad(Especialidad especialidad);
	public boolean EditarEspecialidad(Especialidad especialidad);
	public boolean BajaLogicaEspecialidad(Especialidad especialidad);
	public List<Especialidad> getAllEspecialidades();
	public Especialidad obtenerEspecialidadPorId(int idEspecialidad);
	public boolean ExisteEspecialidad(Especialidad especialidad);
}
