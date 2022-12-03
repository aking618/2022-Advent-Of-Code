package Day3;

import java.util.*;

class Driver {

    public static void main(String[] args) {

        String[] splitInput = new Input().input.split("\n");
        PriorityMap priorityMap = new PriorityMap();

        int total = 0;

        StringBuilder sb = new StringBuilder();

        for (int splitIndex = 0; splitIndex < splitInput.length; splitIndex++) {

            int mid = splitInput[splitIndex].length() / 2;
            String[] compartments = { splitInput[splitIndex].substring(0, mid), splitInput[splitIndex].substring(mid) };

            Set<Character> setA = new HashSet<Character>();
            Set<Character> setB = new HashSet<Character>();

            for (char c : compartments[0].toCharArray()) {
                setA.add(c);
            }

            for (char c : compartments[1].toCharArray()) {
                setB.add(c);
            }

            setA.retainAll(setB);

            for (char c : setA) {
                sb.append(c);
                total += priorityMap.priorityMap.get(String.valueOf(c));
            }
        }

        System.out.println("Part 1: " + total);

        sb = new StringBuilder();
        total = 0;

        for (int splitIndex = 0; splitIndex < splitInput.length; splitIndex += 3) {

            String a = splitInput[splitIndex];
            String b = splitInput[splitIndex + 1];
            String c = splitInput[splitIndex + 2];

            Set<Character> setA = new HashSet<Character>();
            Set<Character> setB = new HashSet<Character>();
            Set<Character> setC = new HashSet<Character>();

            for (char cA : a.toCharArray()) {
                setA.add(cA);
            }

            for (char cB : b.toCharArray()) {
                setB.add(cB);
            }

            for (char cC : c.toCharArray()) {
                setC.add(cC);
            }

            setA.retainAll(setB);
            setA.retainAll(setC);

            for (char cA : setA) {
                sb.append(cA);
                total += priorityMap.priorityMap.get(String.valueOf(cA));
            }
        }

        System.out.println("Part 2: " + total);

    }
}