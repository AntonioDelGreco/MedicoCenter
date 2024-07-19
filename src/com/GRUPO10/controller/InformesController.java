package com.GRUPO10.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.ejb.criteria.expression.SizeOfCollectionExpression;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GRUPO10.Entidades.Especialidad;
import com.GRUPO10.Entidades.Turno;
import com.GRUPO10.Entidades.TurnoEstadoEnum;
import com.GRUPO10.NegocioImp.EspecialidadNegocio;
import com.GRUPO10.NegocioImp.MedicoNegocio;
import com.GRUPO10.NegocioImp.PacienteNegocio;
import com.GRUPO10.NegocioImp.TurnoNegocio;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class InformesController {
	ApplicationContext appContext = new ClassPathXmlApplicationContext("com/GRUPO10/Resources/Beans.xml");
	
    // Negocios
    TurnoNegocio turnoNegocio = (TurnoNegocio) appContext.getBean("beanTurnoNegocio");
    EspecialidadNegocio especialidadNegocio = (EspecialidadNegocio) appContext.getBean("beanEspecialidadNegocio");
    MedicoNegocio medicoNegocio = (MedicoNegocio) appContext.getBean("beanMedicoNegocio");
    PacienteNegocio pacienteNegocio = (PacienteNegocio) appContext.getBean("beanPacienteNegocio");
	
    
    @RequestMapping("/informeEstadoTurnos.html")
    public ModelAndView informeEstadoTurnos(String fechaInicio, String fechaFin) {
		ModelAndView MV = new ModelAndView();

		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date dateInicio = formato.parse(fechaInicio);
            Date dateFin = formato.parse(fechaFin);
            if(dateFin.after(dateInicio)||dateFin.equals(dateInicio)) {
            	List<Turno> turnosPeriodo=turnoNegocio.obtenerTurnosPeriodo(dateInicio, dateFin);
            	TurnoEstadoEnum[] estadosTotales=TurnoEstadoEnum.values();
        		ArrayList<Integer> contador = new ArrayList<Integer>();
        		List<String> listaEstados = new ArrayList<>();
        		int c=0;
        		//Contamos los estados y cargamos Array de tipo String con el enum
        		for (TurnoEstadoEnum turnoEstadoEnum : estadosTotales) {
        			for (Turno turno : turnosPeriodo) {
        				if(turno.getEstadoTurno()==turnoEstadoEnum) {
        					c++;
        				}
        			}
        			contador.add(c);
        			c=0;
        			listaEstados.add(turnoEstadoEnum.toString());
        		}
        		int totalTurnos=turnosPeriodo.size();
        		if(totalTurnos!=0) {
        			List<Float> porcentajes=calcularPorcentaje(contador,totalTurnos);
            		ArrayList<ArrayList<String>> matrizResultados=armarMatriz(porcentajes, listaEstados, contador, "Turnos");
            		for (ArrayList<String> arrayList : matrizResultados) {
    					System.out.println(arrayList);
    				}
            		MV.addObject("resultados1", matrizResultados);
        		}else {
        			MV.addObject("mensajeEstado","No se encontraron turnos");
        		}
        		
            }else {
            	MV.addObject("mensajeEstado","La fecha de inicio debe ser menor o igual a la de fin");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            MV.addObject("mensajeEstado","Ha ocurrido un error. Intente más tarde");
        }

		MV.setViewName("informes");
		return MV;
	}

    @RequestMapping("/informeTurnosEspecialidad.html")
    public ModelAndView informeTurnosEspecialidad(String fechaInicio, String fechaFin) {
		ModelAndView MV = new ModelAndView();
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date dateInicio = formato.parse(fechaInicio);
            Date dateFin = formato.parse(fechaFin);
            if(dateFin.after(dateInicio)||dateFin.equals(dateInicio)) {
            	List<Turno> turnosPeriodo=turnoNegocio.obtenerTurnosPeriodo(dateInicio, dateFin);
            	List<Especialidad> todasEspecialidades=especialidadNegocio.obtenerTodasLasEspecialidades();
        		ArrayList<Integer> contador = new ArrayList<Integer>();
        		List<String> listaEspecialidades = new ArrayList<>();
        		int c=0;
        		//Contamos los estados y cargamos Array de tipo String con el enum
        		for (Especialidad esp : todasEspecialidades) {
        			for (Turno turno : turnosPeriodo) {
        				if(turno.getMedico().getEspecialidad().getId()==esp.getId()) {
        					c++;
        				}
        			}
        			contador.add(c);
        			c=0;
        			listaEspecialidades.add(esp.getNombre());
        		}
        		int totalTurnos=turnosPeriodo.size();
        		if(totalTurnos!=0) {
        			List<Float> porcentajes=calcularPorcentaje(contador,totalTurnos);
            		ArrayList<ArrayList<String>> matrizResultados=armarMatriz(porcentajes, listaEspecialidades, contador, "Turnos");
            		for (ArrayList<String> arrayList : matrizResultados) {
    					System.out.println(arrayList);
    				}
            		MV.addObject("resultados2", matrizResultados);
        		}else {
        			MV.addObject("mensajeEstado2","No se encontraron turnos");
        		}
        		
        		
        		
            }else {
            	MV.addObject("mensajeEstado2","La fecha de inicio debe ser menor o igual a la de fin");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            MV.addObject("mensajeEstado2","Ha ocurrido un error. Intente más tarde");
        }

		MV.setViewName("informes");
		return MV;
	}
   

	public List<Float> calcularPorcentaje (ArrayList<Integer> contador, int totalCantidad){
		List<Float> porcentajes=new ArrayList<>();		
		for (Integer integer : contador) {
			try {
				Float porcentaje=((float) (integer*100/totalCantidad));
				porcentaje = Math.round(porcentaje * 100.0) / 100.0f;
				porcentajes.add(porcentaje);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return porcentajes;
	}
    
    public ArrayList<ArrayList<String>> armarMatriz(List<Float> porcentaje,List<String> elementos,
    		List<Integer> cantidad,String tipoElemento){
    	
    	ArrayList<ArrayList<String>> matriz=new ArrayList<ArrayList<String>>();
    	ArrayList<String> aux;
    	int tam=elementos.size();
    	int i;
    	
    	for(i=0;i<tam;i++) {
    		aux=new ArrayList<String>();
    		aux.add(Float.toString(porcentaje.get(i)));
    		aux.add(elementos.get(i));
    		aux.add("("+(Integer.toString(cantidad.get(i)))+" "+tipoElemento+")");
    		matriz.add(aux);
    	}    	
    	return matriz;    	
    }
	
}


