package com.GRUPO10.Entidades;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="Localidad")
public class Localidad implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idLocalidad")
	private Long idLocalidad;
	
	@Column(name="Nombre")
	private String nombre;
    
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Provincia")
    private Provincia provincia;
	
	public Localidad() {}

	public Long getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(Long idLocalidad) {
		this.idLocalidad = idLocalidad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	@Override
	public String toString() {
		return "Localidad [idLocalidad=" + idLocalidad + ", nombre=" + nombre + ", provincia=" + provincia + "]";
	}
	
	
}
