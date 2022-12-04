package Day4;

import java.util.*;


public class Driver {


    public static void main(String[] args) {

        String[] splitInput = new Input().input.split("\n");

        int partOneTotal = 0;
        int partTwoTotal = 0;

        for (int splitIndex = 0; splitIndex < splitInput.length; splitIndex++) {

            String[] ranges = splitInput[splitIndex].split(",");

            String[] aRange = ranges[0].split("-");
            String[] bRange = ranges[1].split("-");

            Set<Integer> setA = new HashSet<Integer>();
            Set<Integer> setB = new HashSet<Integer>();

            for (int i = Integer.parseInt(aRange[0]); i <= Integer.parseInt(aRange[1]); i++) {
                setA.add(i);
            }

            for (int i = Integer.parseInt(bRange[0]); i <= Integer.parseInt(bRange[1]); i++) {
                setB.add(i);
            }

            if (setA.stream().anyMatch(setB::contains)) {
                partTwoTotal++;
            }

            if (setA.containsAll(setB)) {
                partOneTotal++;
                continue;
            }

            if (setB.containsAll(setA)) {
                partOneTotal++;
                continue;
            }
        }

        System.out.println("Part One : " + partOneTotal);
        System.out.println("Part Two : " + partTwoTotal);
    }
}
