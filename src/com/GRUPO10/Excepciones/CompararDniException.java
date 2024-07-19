package com.GRUPO10.Excepciones;

import java.io.IOException;

public class CompararDniException extends IOException{
	public CompararDniException() {
		
	}
	
	public String getMessage() {
		return "Dni Incorrecto";
	}
}
