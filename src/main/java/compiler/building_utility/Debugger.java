package compiler.building_utility;

import java.io.File;

public class Debugger {
    public static String attach(File file){
        String fileText = fileFunctions.read(file.getAbsolutePath())+"\n\n -- break\n\n";
        System.out.println("using file: "+file.getName());
        String modifiedFileText = fileText;
        
        if(!file.getName().equals("BU_Debug.lua"))
        {
            modifiedFileText = fileText.replaceAll("BU_Debug\\((.*).*\\)", "BU_Debug(\""+file.getName()+"\", $1)");
            // modifiedFileText = fileText.replaceAll("BU_Debug\\(([^,]*)\\s*,\\s*(.*)\\)", "BU_Debug($1, $2, \"" + file.getName() + "\")");
            // modifiedFileText = fileText.replaceAll("BU_Debug\\(([^,]*?)(?:\\s*,\\s*(.*))?\\)", "BU_Debug($1, $2 != null ? $2 : null, \"" + file.getName() + "\")");
        }
        
        if(file.getName().equals("LICENSE")) {
            String[] lines = fileText.split("\n");
            

            StringBuilder modifiedString = new StringBuilder();
            

            for (String line : lines) {
                modifiedString.append("--").append(line).append("\n");
            }
            

            modifiedFileText = modifiedString.toString();
        }
        
        return modifiedFileText;
    }


}
