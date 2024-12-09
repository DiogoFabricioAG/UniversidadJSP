package Javas;

public class PlanEstudios {
    private int idPlan;         
    private String codPlan;     
    private int anioCreacion;   
    private int idEscuela;      

    public PlanEstudios(int idPlan, String codPlan, int anioCreacion, int idEscuela) {
        this.idPlan = idPlan;
        this.codPlan = codPlan;
        this.anioCreacion = anioCreacion;
        this.idEscuela = idEscuela;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public String getCodPlan() {
        return codPlan;
    }

    public void setCodPlan(String codPlan) {
        this.codPlan = codPlan;
    }

    public int getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(int anioCreacion) {
        this.anioCreacion = anioCreacion;
    }

    public int getIdEscuela() {
        return idEscuela;
    }

    public void setIdEscuela(int idEscuela) {
        this.idEscuela = idEscuela;
    }
}
