package definition;

import groovy.json.internal.LazyMap;
import support.RESTSupport;

public class Processo {

    private static LazyMap camposJson = new LazyMap();
    private static final String URL = "http://agapito-server.herokuapp.com/processos";
    private static String id;

    public static void limparCampos() {
        camposJson.clear();
    }

    public static void preencherCampo(String campo, String valor) {
        camposJson.put(campo, valor);
    }

    public static String getEndpoint() {
        return URL;
    }

    public static LazyMap getCampos() {
        return camposJson;
    }

    public static void setId(String paramID) {
        id = paramID;
    }

    public static String getId() {
        return id;
    }

    public static String recuperarCampo(String campo) {
        return RESTSupport.key(campo).toString();
    }
}
