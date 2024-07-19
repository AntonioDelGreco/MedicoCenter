package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoLocalidad;
import com.GRUPO10.Entidades.Localidad;
import com.GRUPO10.Entidades.Provincia;
import com.GRUPO10.Negocio.ILocalidadNegocio;

public class LocalidadNegocio implements ILocalidadNegocio {
	
	private IDaoLocalidad daoLocalidad;
	
	public LocalidadNegocio() {
	
	}
	
	public LocalidadNegocio(IDaoLocalidad daoLocalidad) {
		this.daoLocalidad = daoLocalidad;
	}
	
	public IDaoLocalidad getDaoLocalidad() {
		return daoLocalidad;
	}
	
	public void setDaoLocalidad(IDaoLocalidad daoLocalidad) {
		this.daoLocalidad = daoLocalidad;
	}
	
	@Override
	public List<Localidad> getAllLocalidades() {
		return daoLocalidad.getAllLocalidades();
	}

	@Override
	public List<Localidad> getLocalidadesSegunProvincia(Provincia provincia) {
		return daoLocalidad.getLocalidadesSegunProvincia(provincia);
	}
	
	@Override
	public Localidad getLocalidad(Long idLocalidad) {
		return daoLocalidad.getLocalidad(idLocalidad);
	}

}
