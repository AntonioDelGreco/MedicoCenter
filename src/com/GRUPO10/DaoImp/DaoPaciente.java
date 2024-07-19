package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoPaciente;
import com.GRUPO10.Entidades.Paciente;

public class DaoPaciente implements IDaoPaciente {
    private Conexion conexion;
    
    public DaoPaciente() {
        
    }

    public DaoPaciente(Conexion conexion) {
        this.conexion = conexion;
    }

    public Conexion getConexion() {
        return conexion;
    }

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }

    @Override
    public boolean InsertarPaciente(Paciente paciente) {
        boolean estado = false;
        Session session = null;
        try {
        	int dni=paciente.getDni();
        	Paciente.compararDni(String.valueOf(dni));
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.save(paciente);
            session.flush();
            session.getTransaction().commit();
            
            Paciente pacienteNuevo = (Paciente) session.get(Paciente.class, paciente.getDni());
            
            if (pacienteNuevo == null) {
                estado = false;
            } else {
                estado = true;
            }
            
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    @Override
    public boolean EditarPaciente(Paciente paciente) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(paciente);
            session.flush();
            session.getTransaction().commit();
            
            Paciente pacienteNuevo = (Paciente) session.get(Paciente.class, paciente.getDni());
            
            if (!pacienteNuevo.equals(paciente)) {
                estado = false;
            } else {
                estado = true;
            }
            
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    @Override
    public boolean BajaLogicaPaciente(Paciente paciente) {
        boolean estado = false;
        Session session = null;
        try {
            paciente.setEstado(false);
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(paciente);
            session.flush();
            session.getTransaction().commit();
            
            Paciente pacienteNuevo = (Paciente) session.get(Paciente.class, paciente.getDni());
            
            if (pacienteNuevo.isEstado()) {
                estado = false;
            } else {
                estado = true;
            }
            
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    @Override
    public List<Paciente> getAllPacientes() {
        List<Paciente> allPacientes = null;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            String hql = "FROM Paciente";
            Query query = session.createQuery(hql);
            allPacientes = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return allPacientes;
    }
    
    public Paciente getPaciente(Integer dni) {
		Session session= conexion.abrirConexion();
		session.beginTransaction();
		Paciente paciente=(Paciente)session.get(Paciente.class,dni);
        return paciente;
	}

    @Override
    public boolean ExistePaciente(Paciente paciente) {
        boolean estado;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            Paciente pacienteNuevo = (Paciente) session.get(Paciente.class, paciente.getDni());
            
            estado = pacienteNuevo != null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return estado;
    }
    
    public Paciente buscarPacienteTurno(int dni) {
    	Session session= conexion.abrirConexion();
		session.beginTransaction();
		Paciente paciente=(Paciente)session.get(Paciente.class, dni);
        return paciente;
    }
}
