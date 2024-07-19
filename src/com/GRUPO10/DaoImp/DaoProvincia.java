package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoProvincia;
import com.GRUPO10.Entidades.Provincia;

public class DaoProvincia implements IDaoProvincia{
	
	private Conexion conexion;
    
    public DaoProvincia() {
        
    }

    public DaoProvincia(Conexion conexion) {
        this.conexion = conexion;
    }

    public Conexion getConexion() {
        return conexion;
    }

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }
    
    @Override
    public List<Provincia> getAllProvincias() {
        List<Provincia> allProvincias = null;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            String hql = "FROM Provincia";
            Query query = session.createQuery(hql);
            allProvincias = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return allProvincias;
    }
    
    @Override
    public Provincia getProvincia(Long idProvincia) {
		Session session= conexion.abrirConexion();
		session.beginTransaction();
        Provincia Provincia=(Provincia)session.get(Provincia.class, idProvincia);
        return Provincia;
	}
}
