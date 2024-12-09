
package Javas;

public class Facultad {
    private int idFacultad;
    private String nombre;

    public Facultad(int idFacultad, String nombre) {
        this.idFacultad = idFacultad;
        this.nombre = nombre;
    }
    
    public int getId(){
        return idFacultad;
    }
    
    public void setId(int idFacultad){
        this.idFacultad = idFacultad;
    }
    public String getNombre(){
        return nombre;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    
    
    
}
