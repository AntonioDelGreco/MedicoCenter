package com.GRUPO10.Negocio;

import java.util.List;

import com.GRUPO10.Entidades.Usuario;

public interface IUsuarioNegocio {
	
	public boolean InsertarUsuario(Usuario usuario);
	public boolean EditarUsuario(Usuario usuario);
	public boolean BajaLogicaUsuario(Usuario usuario);
	public List<Usuario> getAllUsuarios();
	public boolean ExisteUsuario(Usuario usuario);
	public Usuario getUsuario(Usuario usuario);
	public Usuario loginData (Usuario usuario);
	public boolean verificaNombre (String nombre);
}