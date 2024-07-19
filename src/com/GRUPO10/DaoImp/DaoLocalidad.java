package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoLocalidad;
import com.GRUPO10.Entidades.Localidad;
import com.GRUPO10.Entidades.Provincia;

public class DaoLocalidad implements IDaoLocalidad{

	private Conexion conexion;
    
    public DaoLocalidad() {
        
    }

    public DaoLocalidad(Conexion conexion) {
        this.conexion = conexion;
    }

    public Conexion getConexion() {
        return conexion;
    }

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }
	
	@Override
	public List<Localidad> getAllLocalidades() {
		List<Localidad> allLocalidades = null;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            String hql = "FROM Localidad";
            Query query = session.createQuery(hql);
            allLocalidades = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return allLocalidades;
	}

	@Override
	public List<Localidad> getLocalidadesSegunProvincia(Provincia provincia) {
	    List<Localidad> localidades = null;
	    Session session = null;
	    try {
	        session = conexion.abrirConexion();
	        
	        String hql = "FROM Localidad WHERE provincia.id = :provinciaId";
	        Query query = session.createQuery(hql);
	        query.setParameter("provinciaId", provincia.getIdProvincia());
	        
	        localidades = query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return localidades;
	}

	@Override
    public Localidad getLocalidad(Long idLocalidad) {
		Session session= conexion.abrirConexion();
		session.beginTransaction();
        Localidad Localidad=(Localidad)session.get(Localidad.class, idLocalidad);
        return Localidad;
	}

}
