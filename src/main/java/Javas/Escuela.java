package Javas;

public class Escuela {
    private int idEscuela;       
    private String nombreEscuela; 
    private int idFacultad;     

    public Escuela() {
    }

    public Escuela(int idEscuela, String nombreEscuela, int idFacultad) {
        this.idEscuela = idEscuela;
        this.nombreEscuela = nombreEscuela;
        this.idFacultad = idFacultad;
    }

    public int getIdEscuela() {
        return idEscuela;
    }

    public void setIdEscuela(int idEscuela) {
        this.idEscuela = idEscuela;
    }

    public String getNombreEscuela() {
        return nombreEscuela;
    }

    public void setNombreEscuela(String nombreEscuela) {
        this.nombreEscuela = nombreEscuela;
    }

    public int getIdFacultad() {
        return idFacultad;
    }

    public void setIdFacultad(int idFacultad) {
        this.idFacultad = idFacultad;
    }
}
