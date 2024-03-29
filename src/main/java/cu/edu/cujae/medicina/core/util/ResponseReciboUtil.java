package cu.edu.cujae.medicina.core.util;
import cu.edu.cujae.medicina.core.utils.Respuesta_Enum;

public class ResponseReciboUtil {
    private Respuesta_Enum respuestaEnum;
    private String mensaje_recibo;

    public ResponseReciboUtil() {}


    public ResponseReciboUtil(Respuesta_Enum respuestaEnum, String mensaje_recibo) {
        this.respuestaEnum = respuestaEnum;
        this.mensaje_recibo = mensaje_recibo;
    }

    public Respuesta_Enum getRespuestaEnum() {
        return respuestaEnum;
    }

    //Metodo para comparar enums
    public boolean comparar_enum(Respuesta_Enum respuestaEnum1){
        return (respuestaEnum.equals(respuestaEnum1)) ? true:false;
    }

    public void setRespuestaEnum(Respuesta_Enum respuestaEnum) {
        this.respuestaEnum = respuestaEnum;
    }

    public String getMensaje_recibo() {
        return mensaje_recibo;
    }

    public void setMensaje_recibo(String mensaje_recibo) {
        this.mensaje_recibo = mensaje_recibo;
    }

    @Override
    public String toString(){
        return "El estado actual del programa es: " + this.respuestaEnum + " a causa de:" + this.mensaje_recibo;
    }
}
