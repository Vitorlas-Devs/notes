#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  srand(time(NULL));

  int pipefd[2];
  pid_t pid;
  char sz[100];

  if (pipe(pipefd) == -1) {
    perror("Hiba a pipe nyitaskor!");
    exit(EXIT_FAILURE);
  }
  pid = fork();
  if (pid == -1) {
    perror("Fork hiba");
    exit(EXIT_FAILURE);
  }

  if (pid == 0) { // child
    printf("Gyerek indul!\n");
    sleep(1);
    close(pipefd[1]);

    int n;
    while (n != 0) {
      read(pipefd[0], &n, sizeof(n));
      printf("Read: %d\n", n);
    }

    close(pipefd[0]);
  } else { // parent
    printf("Szulo indul!\n");
    close(pipefd[0]);

    int n;
    do {
      n = rand() % 10;
      write(pipefd[1], &n, sizeof(n));
      printf("Send: %d\n", n);
    } while (n != 0);

    close(pipefd[1]);
    fflush(NULL);
    wait(NULL);
  }
  exit(EXIT_SUCCESS);
}
