public class Queens {
    static int size = 0;
    static boolean[] row;
    static boolean[] up;
    static boolean[] down;
    static int[] board;

    public static void main(String[] args) {
        try {
            if (args.length > 0) size = Integer.valueOf(args[0]);
            if (size <= 0) return;
            row = new boolean[size];
            up = new boolean[2*size-1];
            down = new boolean[2*size-1];
            board = new int[size];
            queen(0);
        } catch (Exception e) {
        }
    }

    private static void queen(int n) {
        int i;

        if (n >= size) {
            for (i = 0; i < size-1; ++i) {
                System.out.printf("%d ", board[i]);
            }
            System.out.printf("%d\n", board[i]);
        } else {
            for (i = 0; i < size; ++i) {
                if (!row[i] && !up[n+i] && !down[n-i+size-1]) {
                    row[i] = up[n+i] = down[n-i+size-1] = true;
                    board[n] = i+1;
                    queen(n+1);
                    row[i] = up[n+i] = down[n-i+size-1] = false;
                }
            }
        }
    }
}
