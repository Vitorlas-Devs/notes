#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h> // for pipe()

//
// unnamed pipe example
//
int main(int argc, char *argv[]) {
  int pipefd[2]; // unnamed pipe file descriptor array
  pid_t pid;
  char sz[100]; // char array for reading from pipe

  if (pipe(pipefd) == -1) {
    perror("Hiba a pipe nyitaskor!");
    exit(EXIT_FAILURE);
  }
  pid = fork(); // creating parent-child processes
  if (pid == -1) {
    perror("Fork hiba");
    exit(EXIT_FAILURE);
  }

  if (pid == 0) {     // child process
    sleep(3);         // sleeping a few seconds, not necessary
    close(pipefd[1]); // Usually we close the unused write end

    printf("Gyerek elkezdi olvasni a csobol az adatokat!\n");

    // Read first message
    int len1;
    read(pipefd[0], &len1, sizeof(int));
    read(pipefd[0], sz, len1);
    printf("Gyerek olvasta uzenet: %s - %d\n", sz, len1);

    // Read second message
    int len2;
    read(pipefd[0], &len2, sizeof(int));
    read(pipefd[0], sz, len2);
    printf("Gyerek olvasta uzenet: %s - %d\n", sz, len2);

    printf("\n");
    close(pipefd[0]); // finally we close the used read end
  } else {            // szulo process
    printf("Szulo indul!\n");
    close(pipefd[0]); // Usually we close unused read end

    // First message
    const char *msg1 = "Hajra Fradi!";
    int len1 = strlen(msg1) + 1; // +1 for null terminator
    write(pipefd[1], &len1, sizeof(int));
    write(pipefd[1], msg1, len1);

    // Second message
    const char *msg2 = "Hajra Fradi!2";
    int len2 = strlen(msg2) + 1; // +1 for null terminator
    write(pipefd[1], &len2, sizeof(int));
    write(pipefd[1], msg2, len2);

    close(pipefd[1]); // Closing write descriptor
    printf("Szulo beirta az adatokat a csobe!\n");
    fflush(NULL); // flushes all write buffers (not necessary)
    wait(NULL);   // waiting for child process (not necessary)
                  // try it without wait()
    printf("Szulo befejezte!");
  }
  exit(EXIT_SUCCESS);
}
