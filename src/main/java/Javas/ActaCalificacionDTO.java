
package Javas;

public class ActaCalificacionDTO {
    private int idCurso;
    private String nombreCurso;
    private String codigoCurso;
    private String fechaEvaluacion;
    private double calificacion;
    private String estado;

    // Constructor
    public ActaCalificacionDTO(int idCurso, String nombreCurso, String codigoCurso, String fechaEvaluacion, double calificacion, String estado) {
        this.idCurso = idCurso;
        this.nombreCurso = nombreCurso;
        this.codigoCurso = codigoCurso;
        this.fechaEvaluacion = fechaEvaluacion;
        this.calificacion = calificacion;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdCurso() { return idCurso; }
    public String getNombreCurso() { return nombreCurso; }
    public String getCodigoCurso() { return codigoCurso; }
    public String getFechaEvaluacion() { return fechaEvaluacion; }
    public double getCalificacion() { return calificacion; }
    public String getEstado() { return estado; }
}
