package compiler.building_utility;

import java.io.File;
import java.util.Arrays;

import org.json.JSONObject;

import static compiler.building_utility.Main.log;



public class compiler {
    public static void compile(JSONObject build_paths) {
        try {

            int i = 1;
            while (true) {
                
                

                if (isEndOfList(build_paths, i)) {
                    break;
                }
                
                String path = build_paths.getString("path " + i);
                if (isIndexEmpty(path, i)) {
                    break;
                }

                File component_file = new File(path);
                if (!targetFileExist(component_file, i)) {
                    break;
                }


                
                if (component_file.isDirectory()) {
                    innerFileCompiler(component_file);
                } else {
                    Main.combindedData += Debugger.attach(component_file);
                }


                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void innerFileCompiler(File dir) {
        for (File file : sortOrder(dir)) {
            if (file.isDirectory()) {
                innerFileCompiler(file);
            } else {
                Main.combindedData += Debugger.attach(file);
            }
        }
    }

    public static File[] sortOrder(File dir) {
        File[] files = dir.listFiles();

        if (files == null || files.length < 1) {
            System.out.println("The directory is empty or not valid.");
            return files;
        }

        Arrays.sort(files, (file1, file2) -> {
            String name1 = file1.getName();
            String name2 = file2.getName();

            int num1 = extractNumber(name1);
            int num2 = extractNumber(name2);

            boolean hasNum1 = num1 != -1;
            boolean hasNum2 = num2 != -1;

            if (hasNum1 && !hasNum2) {
                return -1;
            } else if (!hasNum1 && hasNum2) {
                
                return 1;
            } else {
                if (hasNum1 && hasNum2) {
                    return Integer.compare(num1, num2);
                } else {
                    return name1.compareTo(name2);
                }
            }
        });

        return files;
    }
    

    private static int extractNumber(String s) {
        // Split the string at the underscore
        String[] parts = s.split("_", 2);

        // Try to parse the number before the underscore
        try {
            return Integer.parseInt(parts[0]);
        } catch (NumberFormatException e) {
            // If no valid number is found, return -1 (or any other default value)
            return -1;
        }
    }


    public static boolean isEndOfList(JSONObject build_paths, int index) {
        if (!build_paths.has("path " + index)) {
            log("exiting due to end of list index " + index);
            return true;
        }
        return false;
    }

    public static boolean isIndexEmpty(String path, int index) {
        if (path.equals("0"))
        {
            log("empty path at index: " + index);
            return true;
        }
        return false;
    }

    public static boolean targetFileExist(File component_file, int index) {
        if(!component_file.exists())
        {
            log("file does not exist at index: " + index);
            return false;
        }

        return true;
    }
}
