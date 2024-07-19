	package com.GRUPO10.Entidades;

import java.io.Serializable;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.*;

@Entity
@Table(name="Medicos")
public class Medico implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Legajo")
	private Long legajo;
	
	@Column(name="Nombre")
	private String nombre;
	
	@Column(name="Apellido")
	private String apellido;
	
	@Column(name="Sexo")
	private String sexo;
	
	@Column(name="Nacimiento")
	private Date nacimiento;
	
	@Column(name="Direccion")
	private String direccion;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="localidad_id", referencedColumnName="idLocalidad")
	private Localidad localidad;
	
	@Column(name="Correo")
	private String correo;
	
	@Column(name="Telefono")
	private Long telefono;
	
	@Column(name="Dias")
	private String dias;
	
	@Column(name="Horarios")
	private String horarios;
	
	@Column(name="Estado")
    private boolean estado;

	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="especialidad_id", referencedColumnName="id")
    private Especialidad especialidad;
    
    @OneToOne(cascade=(CascadeType.ALL))
    @JoinColumn(name="Usuario")
	private Usuario usuario;
	
	public Medico() {}

	
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Long getLegajo() {
		return legajo;
	}

	public void setLegajo(Long legajo) {
		this.legajo = legajo;
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

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(String fechaNacimiento) {
		SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
	    SimpleDateFormat formatoFecha2 = new SimpleDateFormat("yyyy-MM-dd");

        try {
            java.util.Date utilDate = formatoFecha.parse(fechaNacimiento);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            this.nacimiento = sqlDate;
        } catch (ParseException e) {
            try {
                java.util.Date utilDate = formatoFecha2.parse(fechaNacimiento);
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                this.nacimiento = sqlDate;
            } catch (ParseException e2) {
                e2.printStackTrace();
            }

        }		
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

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public Long getTelefono() {
		return telefono;
	}

	public void setTelefono(Long telefono) {
		this.telefono = telefono;
	}
	
	public Especialidad getEspecialidad() {
		return especialidad;
	}

	public void setEspecialidad(Especialidad especialidad) {
		this.especialidad = especialidad;
	}
	
	public String getDias() {
		return dias;
	}

	public void setDias(String dias) {
		this.dias = dias;
	}

	public String getHorarios() {
		return horarios;
	}

	public void setHorarios(String horarios) {
		this.horarios = horarios;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "legajo=" + legajo + " - nombre=" + nombre + " - apellido=" + apellido + " - sexo=" + sexo
				+ " - nacimiento=" + nacimiento + " - direccion=" + direccion + " - localidad=" + localidad + " - correo="
				+ correo + " - telefono=" + telefono + " - especialidad=" + especialidad + " - usuario=" + usuario + " - Dias en los que trabaja=" + dias + " - Horarios de atención=" + horarios;
	}
}
