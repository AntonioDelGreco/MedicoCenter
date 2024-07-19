package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoMedico;
import com.GRUPO10.Entidades.Medico;


public class DaoMedico implements IDaoMedico{
	private Conexion conexion;
	
	public DaoMedico() {
		
	}

	public DaoMedico(Conexion conexion) {
		this.conexion = conexion;
	}

	public Conexion getConexion() {
		return conexion;
	}

	public void setConexion(Conexion conexion) {
		this.conexion = conexion;
	}

	public boolean InsertarMedico(Medico medico) {
		boolean estado=false;
		
		Session session=null;
		try {
			session=conexion.abrirConexion();
			session.beginTransaction();
			session.save(medico);
			session.flush();
			session.getTransaction().commit();
			
			Medico medicoNuevo = (Medico) session.get(Medico.class, medico.getLegajo());
	        
	        if (medicoNuevo == null) {
	            estado = false;
	        }else {
	        	estado=true;
	        }
	        
		}catch (Exception e) {
	        if (session != null) {
	            session.getTransaction().rollback();
	        }
	        e.printStackTrace();
	    }
		return estado;
	}
	
	public boolean EditarMedico(Medico medico) {
		boolean estado=false;
		Session session=null;
		try {
			session=conexion.abrirConexion();
			session.beginTransaction();
			session.update(medico);
			session.flush();
			session.getTransaction().commit();
			
			Medico medicoNuevo = (Medico) session.get(Medico.class, medico.getLegajo());
	        
	        if (medicoNuevo.equals(medico) == false) {
	            estado = false;
	        }else {
	        	estado=true;
	        }
	        
		}catch (Exception e) {
	        if (session != null) {
	            session.getTransaction().rollback();
	        }
	        e.printStackTrace();
	    }
		return estado;
	}
	
	public boolean BajaLogicaMedico(Medico medico) {
		boolean estado=false;
		Session session=null;
		try {
			medico.setEstado(false);
			session=conexion.abrirConexion();
			session.beginTransaction();
			session.update(medico);
			session.flush();
			session.getTransaction().commit();
			
			Medico medicoNuevo = (Medico) session.get(Medico.class, medico.getLegajo());
	        
	        if (medicoNuevo.isEstado()) {
	            estado = false;
	        }else {
	        	estado=true;
	        }
	        
		}catch (Exception e) {
	        if (session != null) {
	            session.getTransaction().rollback();
	        }
	        e.printStackTrace();
	    }
		return estado;
	}
	
	public List<Medico> getAllMedicos() {
		List<Medico> allMedicos=null;
		Session session=null;
		try {
			session=conexion.abrirConexion();
		    String hql = "FROM Medico";
		    Query query = session.createQuery(hql);
		    allMedicos = query.list();
		} catch (Exception e) {
		    e.printStackTrace();
		}		
		return allMedicos;
	}
	
	public Medico getMedico(Long legajo) {
		Session session= conexion.abrirConexion();
		session.beginTransaction();
        Medico medico=(Medico)session.get(Medico.class, legajo);
        return medico;
	}
	
	public boolean ExisteMedico(Medico medico) {
		boolean estado;
		Session session=conexion.abrirConexion();
		session.beginTransaction();
		Medico medicoNuevo = (Medico) session.get(Medico.class, medico.getLegajo());
 
        if (medicoNuevo!=null) {
            estado = true;
        }else {
        	estado=false;
        }
		return estado;
	}
	
	public List<Medico> obtenerMedicosPorEspecialidad(String especialidad) {
	    List<Medico> medicosPorEspecialidad = null;
	    Session session = null;
	    
	    int idEspecialidad;
	    try {
	        idEspecialidad = Integer.parseInt(especialidad);
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        return medicosPorEspecialidad; // Retorna null si la conversión falla
	    }
	    
	    try {
	        session = conexion.abrirConexion();
	        String hql = "FROM Medico m WHERE m.especialidad.id = :idEspecialidad"; // Asumiendo que especialidad tiene un atributo id
	        Query query = session.createQuery(hql);
	        query.setParameter("idEspecialidad", idEspecialidad);
	        medicosPorEspecialidad = query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return medicosPorEspecialidad;
	}

	
}
