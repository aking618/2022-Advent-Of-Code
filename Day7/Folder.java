package Day7;

import java.util.HashMap;

public class Folder {

    Folder parent;

    HashMap<String, Folder> folders = new HashMap<>();
    int fileSize = 0;
    HashMap<String, Integer> files = new HashMap<>();

    Folder(Folder parent) {
        this.parent = parent;
    }

    void addFile(String name, int fileSize) {
        this.fileSize += fileSize;
        files.put(name, fileSize);
    }

    void addFolder(String name) {
        folders.put(name, new Folder(this));
    }

    int getFileSize() {
        return fileSize;
    }

    boolean hasFolder(String name) {
        return folders.containsKey(name);
    }

    Folder getFolder(String name) {
        return folders.get(name);
    }

    int sumSizeOfFiles() {
        int sum = fileSize;
        for (Folder folder : folders.values()) {
            sum += folder.sumSizeOfFiles();
        }

        return sum;
    }

    Folder getParent () {
        return parent;
    }
    
}
