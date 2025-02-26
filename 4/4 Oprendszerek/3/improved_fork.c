#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  int value = 1;

  printf("The value is %d before forking\n", value);

  pid_t pid = fork();

  if (pid < 0) {
    perror("fork");
    exit(EXIT_FAILURE);
  } else if (pid == 0) {
    // pid process
    value = 5;
    printf("The value is %d in pid process\n", value);

    pid_t pid2 = fork();

    if (pid2 < 0) {
      perror("second fork");
      exit(EXIT_FAILURE);
    } else if (pid2 == 0) {
      // pid2 process
      value = 10;
      printf("The value is %d in pid2 process\n", value);
      exit(EXIT_SUCCESS);
    } else {
      // Wait for pid2 to finish
      wait(NULL);
      exit(EXIT_SUCCESS);
    }
  } else {
    // parent process
    wait(NULL); // Wait for pid to finish
    printf("The value is %d in parent process (remain the original)\n", value);
  }

  return 0;
}
