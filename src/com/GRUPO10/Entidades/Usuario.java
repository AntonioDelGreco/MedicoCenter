package com.GRUPO10.Entidades;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Usuarios")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String Nombre;
	private String Contrasena;
	private boolean estado;
	
	@OneToOne(mappedBy="usuario", fetch=FetchType.EAGER)
	private Medico medico;
	
	//Constuctor Vacio
	public Usuario() {
		
	}

	public Medico getMedico() {
		return medico;
	}

	public void setMedico(Medico medico) {
		this.medico = medico;
	}

	public String getNombre() {
		return Nombre;
	}

	public String getContrasena() {
		return Contrasena;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public void setContrasena(String contrasena) {
		Contrasena = contrasena;
	}
	
	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		String mensaje = "Usuario [Nombre=" + Nombre + ", Contrasena=" + Contrasena;
				
		if(medico!=null)
			mensaje += ", medico=" + medico.getLegajo() + " " + medico.getNombre() + " " + medico.getApellido() + "]";

		return mensaje;
	}

	
}
