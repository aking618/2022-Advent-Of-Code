package Day7;

import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;

public class Driver {

    Folder currentDirectory = new Folder(null);
    Folder root = currentDirectory;
    ArrayList<Folder> folders = new ArrayList<>();

    public String inputFile = "Day7/input.txt";

    public String getInput() {
        try {
            File file = new File(inputFile);
            Scanner scanner = new Scanner(file);
            return scanner.useDelimiter("\\Z").next();
        } catch (Exception e) {
            System.out.println("Error reading file: " + e);
            return "";
        }
    }

    public void part1() {
        folders.add(currentDirectory);

        String input = getInput();
        String[] lines = input.split("\n");

        System.out.println(currentDirectory);

        for (int i = 0; i < lines.length; i++) {
            if (lines[i].equals("$ cd /")) {
                currentDirectory = root;
            }
            else if(lines[i].equals("$ cd ..")) {
                currentDirectory = currentDirectory.getParent();
            }
            else if(lines[i].contains("$ cd")) {
                currentDirectory = currentDirectory.getFolder(lines[i].substring(5));
            }
            else if(lines[i].equals("$ ls")) {
                while(i + 1 < lines.length && lines[i + 1].charAt(0) != '$') {
                    i++;
                    if (lines[i].substring(0, 3).equals("dir")) {
                        String folderName = lines[i].substring(4);

                        if (!currentDirectory.hasFolder(folderName)) {
                            currentDirectory.addFolder(folderName);
                            folders.add(currentDirectory.getFolder(folderName));
                        }
                    } else {
                        int fileSize = Integer.parseInt(lines[i].substring(0, lines[i].indexOf(' ')));
                        String fileName = lines[i].substring(lines[i].indexOf(' ') + 1);
                        currentDirectory.addFile(fileName, fileSize);
                    }
                }
            }
        }

        long sum = 0;
        for (Folder folder : folders) {
            int total = folder.sumSizeOfFiles();
            if (total <= 100000) {
                sum += total;
            }
        }

        System.out.println("Part 1 : " + sum);
    }

    public void part2() {
        String input = getInput();
        long spaceUsed = root.sumSizeOfFiles();
        long spaceAvailable = 70000000 - spaceUsed;
        long spaceNeeded = 30000000 - spaceAvailable;

        Folder neededFolder = null;
        for (Folder folder : folders) {
            int sum = folder.sumSizeOfFiles();
            if (folder.sumSizeOfFiles() >= spaceNeeded && (neededFolder == null || sum <= neededFolder.sumSizeOfFiles())) {
                neededFolder = folder;
            }
        }

        System.out.println("Part 2 : " + neededFolder.sumSizeOfFiles());
    }


    
    public static void main(String[] args) {
        Driver driver = new Driver();
        driver.part1();
        driver.part2();
    }
}
