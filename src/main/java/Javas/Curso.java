package Javas;

public class Curso {
    private int idCurso;          
    private String nombreCurso;  
    private String codigoCurso;   
    private int idPlan;           
    private int creditos;         

    public Curso() {
    }

    public Curso(int idCurso, String nombreCurso, String codigoCurso, int idPlan, int creditos) {
        this.idCurso = idCurso;
        this.nombreCurso = nombreCurso;
        this.codigoCurso = codigoCurso;
        this.idPlan = idPlan;
        this.creditos = creditos;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }

    public String getCodigoCurso() {
        return codigoCurso;
    }

    public void setCodigoCurso(String codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }
}
