package compiler.building_utility;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.json.JSONObject;

import static compiler.building_utility.Main.log;

public class fileFunctions {
    public static void write(JSONObject output_paths, String data) {
        try {
            FileWriter write;
            int i = 1;
    
            while (true) {
    
                if (!output_paths.has("output " + i)) {
                    log("output path " + i + " does not exist. exiting");
                    break;
                }
    
                write = new FileWriter(new File(output_paths.getString("output " + i)));
                write.write(data);
                write.flush();
                write.close();
    
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        log("data outputed to desination");
    }

    public static String read(String path)
    {
        File file = new File(path);
        if(!file.exists())
        {
            log("file not found: "+path); return "";
        }

        String data = "";

        try 
        {
            data += Files.readString(Path.of(path));

        } catch (IOException e) 
        {
            log("error with coverting String to path");
            e.printStackTrace();
        }
        return data;
    }

    public static void createDefaultJson(File file) {
        try (FileWriter write = new FileWriter(file.getAbsolutePath())) {
            write.write("""
                        {\r
                            "build paths": {\r
                                "path 1": "0",\r
                                "path 2": "0",\r
                                "path 3": "0"\r
                            },\r
                            "output path": {"output": "0"}\r
                        }"""
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
}
}
