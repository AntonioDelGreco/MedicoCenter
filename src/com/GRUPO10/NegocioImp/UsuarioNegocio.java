package com.GRUPO10.NegocioImp;

import java.util.List;

import com.GRUPO10.Dao.IDaoUsuario;
import com.GRUPO10.Entidades.Usuario;
import com.GRUPO10.Negocio.IUsuarioNegocio;

public class UsuarioNegocio implements IUsuarioNegocio {
    
    private IDaoUsuario daoUsuario;

    public UsuarioNegocio() {
    }

    public UsuarioNegocio(IDaoUsuario daoUsuario) {
        this.daoUsuario = daoUsuario;
    }

    public IDaoUsuario getDaoUsuario() {
        return daoUsuario;
    }

    public void setDaoUsuario(IDaoUsuario daoUsuario) {
        this.daoUsuario = daoUsuario;
    }
    
    //ABML
    public boolean InsertarUsuario(Usuario usuario) {
        usuario.setEstado(true);
        return daoUsuario.InsertarUsuario(usuario);
    }

    public boolean EditarUsuario(Usuario usuario) {
        return daoUsuario.EditarUsuario(usuario);
    }

    public boolean BajaLogicaUsuario(Usuario usuario) {
        return daoUsuario.BajaLogicaUsuario(usuario);
    }

    public List<Usuario> getAllUsuarios() {
        return daoUsuario.getAllUsuarios();
    }

    public boolean ExisteUsuario(Usuario usuario) {
        return daoUsuario.ExisteUsuario(usuario);
    }

    public Usuario getUsuario(Usuario usuario) {
        return daoUsuario.getUsuario(usuario);
    }
    
    public Usuario loginData (Usuario usuario) {
    	Usuario usuarioData = daoUsuario.getUsuario(usuario);
    	if (usuarioData!= null && usuario.getContrasena().equals(usuarioData.getContrasena())) {
    		return usuarioData;
    	} else {
    		return null;
    	}
    }

	@Override
	public boolean verificaNombre(String nombre) {
		List<Usuario> usuarios = daoUsuario.getAllUsuarios();
		for(Usuario u : usuarios) 
		{
			if(u.getNombre().equals(nombre)) 
			{
				return false;
			}
		}
		return true;
	}
}
