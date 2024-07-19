package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoEspecialidad;
import com.GRUPO10.Entidades.Especialidad;
import com.GRUPO10.Negocio.IEspecialidadNegocio;

public class EspecialidadNegocio implements IEspecialidadNegocio {

	private IDaoEspecialidad daoEspecialidad;

	public EspecialidadNegocio() {
	
	}

	public EspecialidadNegocio(IDaoEspecialidad daoEspecialidad) {
		this.daoEspecialidad = daoEspecialidad;
	}

	public IDaoEspecialidad getDaoEspecialidad() {
		return daoEspecialidad;
	}

	public void setDaoEspecialidad(IDaoEspecialidad daoEspecialidad) {
		this.daoEspecialidad = daoEspecialidad;
	}
	
	//ABML
	@Override
	public boolean insertarEspecialidad(Especialidad especialidad) {
		return daoEspecialidad.InsertarEspecialidad(especialidad);
	}

	@Override
	public boolean editarEspecialidad(Especialidad especialidad) {
		return daoEspecialidad.EditarEspecialidad(especialidad);
	}

	@Override
	public boolean bajaLogicaEspecialidad(Especialidad especialidad) {
		return daoEspecialidad.BajaLogicaEspecialidad(especialidad);
	}

	@Override
	public List<Especialidad> obtenerTodasLasEspecialidades() {
		return daoEspecialidad.getAllEspecialidades();
	}

	@Override
	public Especialidad obtenerEspecialidadPorId(int idEspecialidad) {
		return daoEspecialidad.obtenerEspecialidadPorId(idEspecialidad);
	}

	@Override
	public boolean existeEspecialidad(Especialidad especialidad) {
		return daoEspecialidad.ExisteEspecialidad(especialidad);
	}

}
