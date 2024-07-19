package com.GRUPO10.DaoImp;

import org.hibernate.Session;

public abstract class DaoHibernate {
	static Conexion ch = new Conexion();
	
	public static Session AbrirConexion() {
		return ch.abrirConexion();
	}
	
	public static void CerrarConexion() {
		ch.cerrarConexion();
	}
}
