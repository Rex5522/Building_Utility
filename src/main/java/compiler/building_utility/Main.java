package compiler.building_utility;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.json.JSONObject;

public class Main {
    public static String logdata = "";
    public static String combindedData = "";

    public static void main(String[] args) {

        // get building utilitys
        File building_utility = new File(System.getProperty("user.dir")+"\\src\\main\\lua\\Building_Utility_code");

        // path data
        File dvdata = new File(building_utility.getAbsolutePath() + "\\dvdata.json");

        if(!dvdata.exists()) {
            fileFunctions.createDefaultJson(dvdata);
            log("no dvdata found. creating default");
            exit();
        }

        log(System.getenv("WORKSPACE_DIR"));
        exit();

        // extract and configer json data
        String jsonContent;
        try {
            jsonContent = new String(Files.readAllBytes(Paths.get(dvdata.getAbsolutePath())));
            
            JSONObject jsonObject = new JSONObject(jsonContent);
            JSONObject build_paths = jsonObject.getJSONObject("build paths");
            JSONObject output_paths = jsonObject.getJSONObject("output paths");
            
            compiler.compile(build_paths);
            
            fileFunctions.write(output_paths, combindedData);
            
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        exit();
    }

    public static void log(String log){
        logdata+=log+"\n";
    }


    public static void exit(){
        System.out.println(logdata);
        System.exit(0);
    }

}