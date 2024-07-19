package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Provincia;

public interface IDaoProvincia {
	public List<Provincia> getAllProvincias();
	public Provincia getProvincia(Long idProvincia);
}
