package com.GRUPO10.Entidades;

import java.io.Serializable;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.GRUPO10.Excepciones.CompararDniException;



@Entity
public class Paciente implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Dni")
	private int dni;
	
	private String nombre;
	private String apellido;
	private String telefono;
	private String direccion;
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="localidad_id", referencedColumnName="idLocalidad")
	private Localidad localidad;
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="provincia_id", referencedColumnName="idProvincia")
	private Provincia provincia;
	private Date fechaNacimiento;
	private String email;
	private boolean estado;
	
	
	public Paciente() {
		
	}


	public int getDni() {
		return dni;
	}


	public void setDni(int dni) {
		this.dni = dni;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public Localidad getLocalidad() {
		return localidad;
	}


	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}


	public Provincia getProvincia() {
		return provincia;
	}


	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}


	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}


	public void setFechaNacimiento(String fechaNacimiento) {
		SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        try {
            java.util.Date utilDate = formatoFecha.parse(fechaNacimiento);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            this.fechaNacimiento = sqlDate;
        } catch (ParseException e) {
            e.printStackTrace();
        }		
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Paciente [dni=" + dni + ", nombre=" + nombre + ", apellido=" + apellido + ", telefono=" + telefono
				+ ", direccion=" + direccion + ", localidad=" + localidad + ", provincia=" + provincia
				+ ", fechaNacimiento=" + fechaNacimiento + ", email=" + email + "]";
	}
	
	public static boolean compararDni(String dni) throws CompararDniException {
		boolean incompleto = false;
		
		if(dni.length()!=8) {
			incompleto = true;
		}
		
		if(incompleto) {
			throw new CompararDniException();
		}
		
		return incompleto;
	}
}
