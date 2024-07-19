package com.GRUPO10.Dao;

import java.util.List;

import com.GRUPO10.Entidades.Paciente;

public interface IDaoPaciente {
	public boolean InsertarPaciente(Paciente paciente);
	public boolean EditarPaciente(Paciente paciente);
	public boolean BajaLogicaPaciente(Paciente paciente);
	public List<Paciente> getAllPacientes();
	public Paciente getPaciente(Integer dni);
	public boolean ExistePaciente(Paciente paciente);
	public Paciente buscarPacienteTurno(int dni);
}
