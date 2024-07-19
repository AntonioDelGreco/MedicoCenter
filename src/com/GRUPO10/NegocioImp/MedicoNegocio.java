package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoMedico;
import com.GRUPO10.Entidades.Medico;
import com.GRUPO10.Negocio.IMedicoNegocio;


public class MedicoNegocio implements IMedicoNegocio {
		private IDaoMedico daoMedico;

		public MedicoNegocio() {
		
		}

		public MedicoNegocio(IDaoMedico daoMedico) {
			this.daoMedico = daoMedico;
		}

		public IDaoMedico getDaoMedico() {
			return daoMedico;
		}

		public void setDaoMedico(IDaoMedico daoMedico) {
			this.daoMedico = daoMedico;
		}
		
		//ABML		
		
		public boolean insertarMedico(Medico medico) {
			medico.setEstado(true);
	        return daoMedico.InsertarMedico(medico);
	    }

	    public boolean editarMedico(Medico medico) {
	        return daoMedico.EditarMedico(medico);
	    }

	    public boolean bajaLogicaMedico(Medico medico) {
	        return daoMedico.BajaLogicaMedico(medico);
	    }

	    public List<Medico> obtenerTodosLosMedicos() {
	        return daoMedico.getAllMedicos();
	    }

	    public Medico obtenerMedicoPorLegajo(Long legajo) {
	        return daoMedico.getMedico(legajo);
	    }

	    public boolean existeMedico(Medico medico) {
	        return daoMedico.ExisteMedico(medico);
	    }
	    
	    public List<Medico> obtenerMedicosPorEspecialidad(String especialidad) {
	    	return daoMedico.obtenerMedicosPorEspecialidad(especialidad);
	    }

}
