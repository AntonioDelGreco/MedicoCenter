package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoEspecialidad;
import com.GRUPO10.Entidades.Especialidad;

public class DaoEspecialidad implements IDaoEspecialidad {
    private Conexion conexion;

    public DaoEspecialidad() {

    }

    public DaoEspecialidad(Conexion conexion) {
        this.conexion = conexion;
    }

    public Conexion getConexion() {
        return conexion;
    }

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }

    @Override
    public boolean InsertarEspecialidad(Especialidad especialidad) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.save(especialidad);
            session.flush();
            session.getTransaction().commit();

            Especialidad especialidadNueva = (Especialidad) session.get(Especialidad.class, especialidad.getId());

            if (especialidadNueva == null) {
                estado = false;
            } else {
                estado = true;
            }

        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return estado;
    }

    @Override
    public boolean EditarEspecialidad(Especialidad especialidad) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(especialidad);
            session.flush();
            session.getTransaction().commit();

            Especialidad especialidadNueva = (Especialidad) session.get(Especialidad.class, especialidad.getId());

            if (!especialidadNueva.equals(especialidad)) {
                estado = false;
            } else {
                estado = true;
            }

        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return estado;
    }

    @Override
    public boolean BajaLogicaEspecialidad(Especialidad especialidad) {
        boolean estado = false;
        Session session = null;
        try {
            especialidad.setEstado(false);
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(especialidad);
            session.flush();
            session.getTransaction().commit();

            Especialidad especialidadNueva = (Especialidad) session.get(Especialidad.class, especialidad.getId());

            if (especialidadNueva.isEstado()) {
                estado = false;
            } else {
                estado = true;
            }

        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return estado;
    }

    @Override
    public List<Especialidad> getAllEspecialidades() {
        List<Especialidad> allEspecialidades = null;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            String hql = "FROM Especialidad";
            Query query = session.createQuery(hql);
            allEspecialidades = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return allEspecialidades;
    }

    @Override
    public boolean ExisteEspecialidad(Especialidad especialidad) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            Especialidad especialidadNueva = (Especialidad) session.get(Especialidad.class, especialidad.getId());

            estado = especialidadNueva != null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return estado;
    }

    @Override
    public Especialidad obtenerEspecialidadPorId(int idEspecialidad) {
        Session session = null;
        Especialidad especialidad = null;
        
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            especialidad = (Especialidad) session.get(Especialidad.class, idEspecialidad);
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return especialidad;
    }

}
