import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Queens {
    static int size;

    public static void main(String[] args) {
        if (args.length > 0) size = Integer.valueOf(args[0]);
        System.out.println(queen(size).map(a->a.mapToObj(String::valueOf).collect(Collectors.joining(" "))).collect(Collectors.joining("\n")));

    }

    public static Stream<IntStream> queen(int n) {
        if (n <= 0) {
            return Stream.of(IntStream.empty());
        } else {
            return queen(n - 1).flatMap(Queens::add);
        }
    }

    public static Stream<IntStream> add(IntStream x) {
        int[] xs = x.toArray();
        return IntStream.rangeClosed(1, size).filter(y->
                !Arrays.stream(xs).anyMatch(e->e==y) &&
                !IntStream.range(0, xs.length).map(n->(xs.length-n)-Math.abs(y-xs[n])).anyMatch(e->e==0)
                ).mapToObj(y->IntStream.concat(Arrays.stream(xs), IntStream.of(y)));
    }
}
