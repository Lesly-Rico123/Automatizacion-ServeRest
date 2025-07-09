package util;

import com.bcp.jiraxray.api.AccessJiraXray;
import com.bcp.jiraxray.util.GherkinUtil;
import org.junit.jupiter.api.Test;
import java.util.Optional;

/**
 * Clase utilitaria con la integración de jira
 */
public class JiraUtilTest {

    /**
     * Método que traduce las palabras reservadas soportadas por Gherkin de español a ingles | ingles a español
     * a partir de multiples archivos .feature en una carpeta comprimida --> .zip
     * <p>
     * <b>Parámetros:</b>
     * - origen: ruta en donde se encuentra la carpeta comprimida con los features en el lenguage origen
     * - destino: ruta en donde se guardará la carpeta comprimida con los features traducidos en el lenguage destino
     * - sourceLanguage: lenguage origen
     * - targetLanguage: lenguage destino
     * <p>
     * <b>Lenguages compatibles:</b>
     * es: Español
     * en: Ingles
     */
    @Test
    void translateFeatureZip() {
        String origen = "/src/test/resources/export/export_data.zip";
        String destino = "/src/test/resources/translate/ingles/data_translate.zip";
        GherkinUtil.translateZip(origen, destino, "es", "en");
    }

    /**
     * Método que traduce las palabras reservadas soportadas por Gherkin de español a ingles | ingles a español
     * a partir de un archivo .feature
     * <p>
     * <b>Parámetros:</b>
     * - origen: ruta en donde se encuentra el feature en el lenguage origen
     * - destino: ruta en donde se guardará el feature traducido en el lenguage destino
     * - sourceLanguage: lenguage origen
     * - targetLanguage: lenguage destino
     * <p>
     * <b>Lenguages compatibles:</b>
     * es: Español
     * en: Ingles
     */
    @Test
    void translateFeatureFile() {
        String origen = "/src/test/resources/translate/en/Loginaaa.feature";
        String destino = "/src/test/resources/translate/es/Loginaaa.feature";
        GherkinUtil.translateFile(origen, destino, "en", "es");
    }


    /**
     * Método que importa de forma masiva los Test redactos en gherkin a partir de un archivo feature
     * <p>
     * <b>Parámetros:</b>
     * - project: código del proyecto Jira
     * - origen: ruta en donde se encuentra el feature con los Test a cargar
     * - info: ruta del archivo info.json con los datos de configuración por Test
     */
    @Test
    void importFeatureFileToJiraXray() {
        String project = "BANKI1";
        String origen = "src/test/resources/translate/en/XXXXXXXXX.feature";
        String info = "src/test/resources/info.json";
        AccessJiraXray.importFeatureFileToJiraXray(project, origen, info);

    }

    /**
     * Método que exporta los Test en un feature a partir del Test Execution
     * <p>
     * <b>Parámetros:</b>
     * - keys: ID issue Test Execution
     */
    @Test
    void exportFeatureByTestExecution() {
        AccessJiraXray.exportTestFeaturesByTestExecution("INCTTC-3124");
    }

    /**
     * Método que exporta los Test en un feature a partir del id de un filtro
     * <p>
     * <b>Parámetros:</b>
     * - filter: ID del filtro creado en jira
     */
    @Test
    void exportFeatureByFilter() {
        AccessJiraXray.exportTestFeaturesByFilter("35612");
    }

}