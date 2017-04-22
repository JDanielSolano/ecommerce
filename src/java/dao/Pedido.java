package dao;

public class Pedido {

    private int id, usuarioID;
    private String pedido;
    private float total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    public Pedido() {
        super();

    }

    public Pedido(int usuarioID, String pedido, float total) {
        super();
        this.usuarioID = usuarioID;
        this.pedido = pedido;
        this.total = total;
    }

    public String getPedido() {
        return pedido;
    }

    public void setPedido(String pedido) {
        this.pedido = pedido;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
