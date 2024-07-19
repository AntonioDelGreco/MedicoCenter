package com.GRUPO10.Entidades;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.persistence.*;

@Entity
@Table(name="Turnos")
public class Turno implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_turno")
    private int id_turno;

    @ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="id_medico", referencedColumnName="Legajo")
    private Medico medico;

    @ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="dni_paciente", referencedColumnName="Dni")
    private Paciente paciente;

   // @Temporal(TemporalType.DATE)
    @Column(name="fecha")
    private Date fecha;

    @Column(name="hora")
    private Time hora;

    @Column(name="observacion")
    private String observacion;

    @Enumerated(EnumType.STRING)
    @Column(name="estado")
    private TurnoEstadoEnum estadoTurno;
    
    @Column(name="Estado_logico")
    private boolean estado;

    public Turno() {}

    // Getters y Setters

    public int getId_turno() {
        return id_turno;
    }

    public void setId_turno(int id_turno) {
        this.id_turno = id_turno;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
    	SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        try {
            java.util.Date utilDate = formatoFecha.parse(fecha);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            this.fecha =sqlDate;
        } catch (ParseException e) {
            e.printStackTrace();
        }	
        
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time time) {
        this.hora = time;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public TurnoEstadoEnum getEstadoTurno() {
        return estadoTurno;
    }

    public void setEstadoTurno(TurnoEstadoEnum estadoTurno) {
        this.estadoTurno = estadoTurno;
    }
    
    public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Turno [id_turno=" + id_turno + ", medico=" + this.getMedico().getNombre() +
				", paciente=" + this.getPaciente().getNombre() + ", fecha=" + fecha
				+ ", hora=" + hora + ", observacion=" + observacion + ", estado=" + this.getEstadoTurno() + "]";
	}
    
}
