package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoPaciente;
import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Negocio.IPacienteNegocio;

public class PacienteNegocio implements IPacienteNegocio{

		private IDaoPaciente daoPaciente;
		
		public PacienteNegocio() {
		
		}
		
		public PacienteNegocio(IDaoPaciente daoPaciente) {
			this.daoPaciente = daoPaciente;
		}
		
		public IDaoPaciente getDaoPaciente() {
			return daoPaciente;
		}
		
		public void setDaoPaciente(IDaoPaciente daoPaciente) {
			this.daoPaciente = daoPaciente;
		}
		

		//ABML
		
		public boolean insertarPaciente(Paciente paciente) {
			paciente.setEstado(true);
		    return daoPaciente.InsertarPaciente(paciente);
		}
		
		public boolean editarPaciente(Paciente paciente) {
		    return daoPaciente.EditarPaciente(paciente);
		}
		
		public boolean bajaLogicaPaciente(Paciente paciente) {
		    return daoPaciente.BajaLogicaPaciente(paciente);
		}
		
		public List<Paciente> obtenerTodosLosPacientes() {
		    return daoPaciente.getAllPacientes();
		}
		
		public Paciente obtenerPacientePorDNI(Integer dni) {
		    return daoPaciente.getPaciente(dni);
		}
		
		public boolean existePaciente(Paciente paciente) {
		    return daoPaciente.ExistePaciente(paciente);
		}
		
		public Paciente buscarPacienteTurno(int dni) {
			return daoPaciente.buscarPacienteTurno(dni);
		}
}
