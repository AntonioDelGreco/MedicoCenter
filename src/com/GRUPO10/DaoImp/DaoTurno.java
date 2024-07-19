package com.GRUPO10.DaoImp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.GRUPO10.Dao.IDaoTurno;
import com.GRUPO10.Entidades.Paciente;
import com.GRUPO10.Entidades.Turno;

public class DaoTurno implements IDaoTurno{

	private Conexion conexion;

	public DaoTurno() {

	}

	public DaoTurno(Conexion conexion) {
		this.conexion = conexion;
	}

	public Conexion getConexion() {
		return conexion;
	}

	public void setConexion(Conexion conexion) {
		this.conexion = conexion;
	}

	@Override
	public boolean InsertarTurno(Turno turno) {
		boolean inserto=false;
		Session session = null;
		try {
			session = getConexion().abrirConexion();
			session.beginTransaction();
			session.save(turno);
			session.getTransaction().commit();

			Turno turno2=(Turno)session.get(Turno.class, turno.getId_turno());

			if (turno2 == null) {
				inserto = false;
			}else {
				inserto=true;
			}

		} catch (Exception e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		return inserto;
	}	

	@Override
	public boolean ModificarTurno(Turno turno) {
		boolean modifico=false;
		Session session = null;
		try {
			session = getConexion().abrirConexion();
			session.beginTransaction();
			session.update(turno);
			session.getTransaction().commit();

			Turno turno2=(Turno)session.get(Turno.class, turno.getId_turno());

			if (turno2.equals(turno) == false) {
				modifico = false;
			}else {
				modifico=true;
			}

		}catch (Exception e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		return modifico;
	}

	@Override
	public boolean BorrarTurno(Turno turno) { //BAJA LÓGICA DEL TURNO
		boolean borro=false;
	Session session = null;
	try {
		session = getConexion().abrirConexion();
		session.beginTransaction();
		session.update(turno);
		session.getTransaction().commit();

		Turno turno2=(Turno)session.get(Turno.class, turno.getId_turno());

		if (turno2.isEstado()) {
			borro = false;
		}else {
			borro=true;
		}
	} catch (Exception e) {
		if (session != null) {
			session.getTransaction().rollback();
		}
		e.printStackTrace();
	}

	return borro;
	}

	public Turno getTurno(Integer idTurno) {
		Session session= conexion.abrirConexion();
		session.beginTransaction();
		Turno turno=(Turno)session.get(Turno.class, idTurno);
		return turno;
	}

	@Override
	public List<Turno> getAllTurnos() {
		Session session = null;

		List<Turno> allTurnos=null;

		try {
			session = conexion.abrirConexion();
			String hql = "FROM Turno";
			Query query = session.createQuery(hql);
			allTurnos = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return allTurnos;
	}
	@Override
	public List<Turno> getTurnosDNI(Paciente pac) {
		Session session = null;

		List<Turno> Turnos=null;

		try {
			session = conexion.abrirConexion();
			String hql = "FROM Turno WHERE dni_paciente="+pac.getDni();
			Query query = session.createQuery(hql);
			Turnos = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return Turnos;
	}

	public List<Turno> turnosNoDisponibles(String legajo, String formattedDate) {
		Session session = null;

		List<Turno> Turnos=null;

		try {
			session = conexion.abrirConexion();
			String hql = "FROM Turno WHERE id_medico="+legajo;
			Query query = session.createQuery(hql);
			Turnos = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return Turnos;
	}
}
