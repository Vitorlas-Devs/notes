#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
  int status;
  int notacommonvalue = 1;
  printf("The value is %i before forking \n", notacommonvalue);

  pid_t child = fork();

  if (child < 0) {
    perror("child: The fork calling was not succesful\n");
    exit(1);
  }

  if (child > 0) { // Parent process
    waitpid(child, &status, 0);

    printf("The value is %i in parent process (remain the original) \n",
           notacommonvalue);

    pid_t child2 = fork();

    if (child2 < 0) {
      perror("child2: The fork calling was not succesful\n");
      exit(1);
    }

    if (child2 == 0) {
      notacommonvalue = 10;
      printf("The value is %i in child2 process \n", notacommonvalue);
    } else {
      waitpid(child2, &status, 0);
    }

  } else {
    notacommonvalue = 5;
    printf("The value is %i in child process \n", notacommonvalue);
  }
  return 0;
}
