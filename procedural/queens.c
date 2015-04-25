#include <stdio.h>
#include <stdlib.h>

int size;
int *board;
int *row;
int *up;
int *down;

void queen(int n);

int main(int argc, char *argv[])
{
    if (argc > 1) size = atoi(argv[1]);

    board = calloc(size, sizeof(int));
    row = calloc(size, sizeof(int));
    up = calloc(2*size-1, sizeof(int));
    down = calloc(2*size-1, sizeof(int));

    queen(0);

    return 0;
}

void queen(int n)
{
    int i;

    if (n >= size) {
        for (i = 0; i < size-1; ++i) {
            printf("%d ", board[i]);
        }
        printf("%d\n", board[i]);
    } else {
        for (i = 0; i < size; ++i) {
            if (!row[i] && !up[n+i] && !down[n-i+size-1]) {
                row[i] = up[n+i] = down[n-i+size-1] = 1;
                board[n] = i+1;
                queen(n+1);
                row[i] = up[n+i] = down[n-i+size-1] = 0;
            }
        }
    }
}
