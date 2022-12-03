package Day3;

import java.util.HashMap;

public class PriorityMap {

    public HashMap<String, Integer> priorityMap = new HashMap<String, Integer>();

    public PriorityMap() {
        priorityMap.put("a", 1);
        priorityMap.put("b", 2);
        priorityMap.put("c", 3);
        priorityMap.put("d", 4);
        priorityMap.put("e", 5);
        priorityMap.put("f", 6);
        priorityMap.put("g", 7);
        priorityMap.put("h", 8);
        priorityMap.put("i", 9);
        priorityMap.put("j", 10);
        priorityMap.put("k", 11);
        priorityMap.put("l", 12);
        priorityMap.put("m", 13);
        priorityMap.put("n", 14);
        priorityMap.put("o", 15);
        priorityMap.put("p", 16);
        priorityMap.put("q", 17);
        priorityMap.put("r", 18);
        priorityMap.put("s", 19);
        priorityMap.put("t", 20);
        priorityMap.put("u", 21);
        priorityMap.put("v", 22);
        priorityMap.put("w", 23);
        priorityMap.put("x", 24);
        priorityMap.put("y", 25);
        priorityMap.put("z", 26);
        priorityMap.put("A", 27);
        priorityMap.put("B", 28);
        priorityMap.put("C", 29);
        priorityMap.put("D", 30);
        priorityMap.put("E", 31);
        priorityMap.put("F", 32);
        priorityMap.put("G", 33);
        priorityMap.put("H", 34);
        priorityMap.put("I", 35);
        priorityMap.put("J", 36);
        priorityMap.put("K", 37);
        priorityMap.put("L", 38);
        priorityMap.put("M", 39);
        priorityMap.put("N", 40);
        priorityMap.put("O", 41);
        priorityMap.put("P", 42);
        priorityMap.put("Q", 43);
        priorityMap.put("R", 44);
        priorityMap.put("S", 45);
        priorityMap.put("T", 46);
        priorityMap.put("U", 47);
        priorityMap.put("V", 48);
        priorityMap.put("W", 49);
        priorityMap.put("X", 50);
        priorityMap.put("Y", 51);
        priorityMap.put("Z", 52);
    }

    public int getPriority(String operator) {
        return priorityMap.get(operator);
    }
}
