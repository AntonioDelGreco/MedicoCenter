package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoProvincia;
import com.GRUPO10.Entidades.Provincia;
import com.GRUPO10.Negocio.IProvinciaNegocio;

public class ProvinciaNegocio implements IProvinciaNegocio{

	private IDaoProvincia daoProvincia;
	
	public ProvinciaNegocio() {
	
	}
	
	public ProvinciaNegocio(IDaoProvincia daoProvincia) {
		this.daoProvincia = daoProvincia;
	}
	
	public IDaoProvincia getDaoProvincia() {
		return daoProvincia;
	}
	
	public void setDaoProvincia(IDaoProvincia daoProvincia) {
		this.daoProvincia = daoProvincia;
	}
	
	@Override
	public List<Provincia> getAllProvincias() {
		return daoProvincia.getAllProvincias();
	}
	
	public Provincia getProvincia(Long idProvincia) {
		return daoProvincia.getProvincia(idProvincia);
	}
}
