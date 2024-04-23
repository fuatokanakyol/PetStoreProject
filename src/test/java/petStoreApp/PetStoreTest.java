package petStoreApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class PetStoreTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
        }
    @Karate.Test
    Karate testDebug() {
        return Karate.run().tags("@debug").relativeTo(getClass());
    }

    @Test
    void TestParallel(){
        Results results = Runner.path("classpath:petStoreApp")
                .outputCucumberJson(true)
                .parallel(3); generateReport(results.getReportDir());
                assertTrue(results.getFailCount()==0,results.getErrorMessages());

    }
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"),"petStoreApp");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths,config);
        reportBuilder.generateReports();
    }
}
