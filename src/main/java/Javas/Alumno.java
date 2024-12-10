package Javas;

public class Alumno {
    private int idAlumno;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private int idPlanEstudios;

    // Constructor
    public Alumno(int idAlumno, String nombre, String apellido, String email, String dni, int idPlanEstudios) {
        this.idAlumno = idAlumno;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.dni = dni;
        this.idPlanEstudios = idPlanEstudios;
    }

    // Getters y Setters
    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idPersona) {
        this.idAlumno = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getIdPlanEstudios() {
        return idPlanEstudios;
    }

    public void setIdPlanEstudios(int idPlanEstudios) {
        this.idPlanEstudios = idPlanEstudios;
    }

}

