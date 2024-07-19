package com.GRUPO10.Negocio;

import java.util.List;

import com.GRUPO10.Entidades.Paciente;

public interface IPacienteNegocio {
	public boolean insertarPaciente(Paciente paciente);
	public boolean editarPaciente(Paciente paciente);
	public boolean bajaLogicaPaciente(Paciente paciente);
	public List<Paciente> obtenerTodosLosPacientes();
	public Paciente obtenerPacientePorDNI(Integer dni);
	public boolean existePaciente(Paciente paciente);
	public Paciente buscarPacienteTurno(int dni);
}
