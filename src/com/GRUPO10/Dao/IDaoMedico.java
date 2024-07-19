package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Medico;

public interface IDaoMedico {
	public boolean InsertarMedico(Medico medico);
	public boolean EditarMedico(Medico medico);
	public boolean BajaLogicaMedico(Medico medico);
	public List<Medico> getAllMedicos();
	public boolean ExisteMedico(Medico medico);
	public Medico getMedico(Long legajo);
	public List<Medico> obtenerMedicosPorEspecialidad(String especialidad);
	
}
