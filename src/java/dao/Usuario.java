package dao;

import java.awt.image.BufferedImage;

public class Usuario {

    private Long id;
    private String usuario, nombre, apellidos, contrasena, correo, rol, foto;

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    BufferedImage buffimg;

    public BufferedImage getBuffimg() {
        return buffimg;
    }

    public void setBuffimg(BufferedImage buffimg) {
        this.buffimg = buffimg;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario(Long id2, String usuario2, String contrasena2, String rol2, String foto2) {

        this.id = id2;
        this.usuario = usuario2;
        this.contrasena = contrasena2;
        this.rol = rol2;
        this.foto = foto2;
    }

    public Usuario() {

    }

    public String getContrasena() {
        return contrasena;
    }

    public void setId(long i) {
        this.id = i;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Long getId() {
        return id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
