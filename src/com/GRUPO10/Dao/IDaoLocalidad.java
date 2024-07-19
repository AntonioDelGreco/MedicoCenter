package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Localidad;
import com.GRUPO10.Entidades.Provincia;

public interface IDaoLocalidad {
	public List<Localidad> getAllLocalidades();
	public List<Localidad> getLocalidadesSegunProvincia(Provincia provincia);
	public Localidad getLocalidad(Long idLocalidad);
}
