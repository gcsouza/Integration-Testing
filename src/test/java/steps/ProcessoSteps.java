package steps;

import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.E;
import cucumber.api.java.pt.Então;
import cucumber.api.java.pt.Quando;
import definition.Processo;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

public class ProcessoSteps {

    private String id = "";

    @Dado("^que o usuário queira salvar um processo$")
    public void queOUsuarioQueiraSalvarUmProcesso() {
        Processo.limparCampos();
    }

    @E("^o usuário informar \"([^\"]*)\" com o valor igual a \"([^\"]*)\"$")
    public void oUsuarioInformarComOValorIgualA(String campo, String valor) throws Throwable {
        Processo.preencherCampo(campo, valor);
    }

    @Quando("^o usuário clicar no botao salvar$")
    public void oUsuarioClicarNoBotaoSalvar() {
        RESTSupport.executePost(Processo.getEndpoint(), Processo.getCampos());
        Processo.setId(RESTSupport.key("id").toString());
    }

    @Quando("^o usuário clicar em mostrar$")
    public void oUsuarioClicarEmMostrar() {
        RESTSupport.executeGet(Processo.getEndpoint() + '/' + Processo.getId());
    }

    @Então("^o usuário deverá ver a mensagem \"([^\"]*)\"$")
    public void oUsuarioDeveraVerAMensagem(String msg) throws Throwable {
        LazyMap messageJson = new LazyMap();
        messageJson.put("salvo com sucesso", 201);
        messageJson.put("sucesso", 200);
        messageJson.put("sem conteúdo", 204);
        messageJson.put("não encontrado", 404);
        messageJson.put("entidade não processada", 422);
        Assert.assertEquals(messageJson.get(msg),RESTSupport.getResponseCode());
    }


    @E("^o usuário visualizará o campo \"([^\"]*)\" com o valor \"([^\"]*)\"$")
    public void oUsuarioVisualizaraOCampoComOValor(String campo, String valor) throws Throwable {
        String atual = Processo.recuperarCampo(campo);
        Assert.assertEquals(valor, atual);

    }

    @Quando("^alterar o campo \"([^\"]*)\" para  o valor \"([^\"]*)\"$")
    public void alterarOCampoParaOValor(String campo, String valor) throws Throwable {
        Processo.preencherCampo(campo, valor);
    }

    @E("^o usuário clicar em editar$")
    public void oUsuarioClicarEmEditar() {
        RESTSupport.executePut(Processo.getEndpoint() + '/' + Processo.getId(), Processo.getCampos());
    }

    @Quando("^O usuário clicar em deletar$")
    public void oUsuarioClicarEmDeletar() {
        RESTSupport.executeDelete(Processo.getEndpoint() + '/' + Processo.getId());
    }

    @Quando("^o usuário clicar no botao save$")
    public void oUsuarioClicarNoBotaoSave() {
        RESTSupport.executePost(Processo.getEndpoint(), Processo.getCampos());
    }
}
