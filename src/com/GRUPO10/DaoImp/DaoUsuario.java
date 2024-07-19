package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoUsuario;
import com.GRUPO10.Entidades.Usuario;

public class DaoUsuario implements IDaoUsuario {
    private Conexion conexion;

    public DaoUsuario() {
    }

    public DaoUsuario(Conexion conexion) {
        this.conexion = conexion;
    }

    public Conexion getConexion() {
        return conexion;
    }

    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }

    public boolean InsertarUsuario(Usuario usuario) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.save(usuario);
            session.flush();
            session.getTransaction().commit();

            Usuario usuarioNuevo = (Usuario) session.get(Usuario.class, usuario.getNombre());
            estado = usuarioNuevo != null;
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    public boolean EditarUsuario(Usuario usuario) {
        boolean estado = false;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(usuario);
            session.flush();
            session.getTransaction().commit();

            Usuario usuarioNuevo = (Usuario) session.get(Usuario.class, usuario.getNombre());
            estado = usuarioNuevo.equals(usuario);
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    public boolean BajaLogicaUsuario(Usuario usuario) {
        boolean estado = false;
        Session session = null;
        try {
            usuario.setEstado(false);
            session = conexion.abrirConexion();
            session.beginTransaction();
            session.update(usuario);
            session.flush();
            session.getTransaction().commit();

            Usuario usuarioNuevo = (Usuario) session.get(Usuario.class, usuario.getNombre());
            estado = !usuarioNuevo.isEstado();
        } catch (Exception e) {
            if (session != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return estado;
    }

    public List<Usuario> getAllUsuarios() {
        List<Usuario> allUsuarios = null;
        Session session = null;
        try {
            session = conexion.abrirConexion();
            String hql = "FROM Usuario";
            Query query = session.createQuery(hql);
            allUsuarios = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allUsuarios;
    }

    public Usuario getUsuario(Usuario usuario) {
        Session session = conexion.abrirConexion();
        session.beginTransaction();
        Usuario usuarioEncontrado = (Usuario) session.get(Usuario.class, usuario.getNombre());
        return usuarioEncontrado;
    }

    public boolean ExisteUsuario(Usuario usuario) {
        boolean estado;
        Session session = conexion.abrirConexion();
        session.beginTransaction();
        Usuario usuarioNuevo = (Usuario) session.get(Usuario.class, usuario.getNombre());
        estado = usuarioNuevo != null;
        return estado;
    }
}
