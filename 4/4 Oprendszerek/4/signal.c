#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

void handler(int signumber) {
  printf("Signal with number %i has arrived\n", signumber);
}

int main() {
  signal(
      SIGTERM,
      handler); // handler = SIG_IGN - ignore the signal (not SIGKILL,SIGSTOP),
  // handler = SIG_DFL - back to default behavior

  signal(SIGUSR1, handler);

  pid_t child = fork();
  if (child > 0) {
    pause(); // waits till a signal arrive
    printf("Signal arrived\n");

    sleep(1);
    kill(child, SIGUSR1);

    int status;
    wait(&status);

    printf("Parent process ended\n");
  } else {
    printf("Waits 3 seconds, then send a SIGTERM %i signal\n", SIGTERM);
    sleep(3);
    kill(getppid(), SIGTERM);

    pause();
    
    printf("Child process ended\n");
  }

  return 0;
}
