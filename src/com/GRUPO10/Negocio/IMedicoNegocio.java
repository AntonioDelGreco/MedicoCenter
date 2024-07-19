package com.GRUPO10.Negocio;

import java.util.List;

import com.GRUPO10.Entidades.Medico;

public interface IMedicoNegocio {
	
	public boolean insertarMedico(Medico medico);
	public boolean editarMedico(Medico medico);
	public boolean bajaLogicaMedico(Medico medico);
	public List<Medico> obtenerTodosLosMedicos();
	public Medico obtenerMedicoPorLegajo(Long legajo);
	public boolean existeMedico(Medico medico);
	public List<Medico> obtenerMedicosPorEspecialidad(String especialidad);
}
