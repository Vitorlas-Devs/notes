#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int pid, fd;
  char pipename[20];

  sprintf(pipename, "/tmp/%d", getpid());
  int fid = mkfifo(pipename, S_IRUSR | S_IWUSR);
  if (fid == -1) {
    printf("Error number: %i", errno);
    perror("Gaz van:");
    exit(EXIT_FAILURE);
  }

  char input[1024];
  printf("Message: ");
  fgets(input, sizeof(input), stdin);

  pid = fork();

  if (pid > 0) { // parent
    char s[1024] = "";
    fd = open(pipename, O_RDONLY);
    read(fd, s, sizeof(s));
    printf("Parent read: '%s'\n", s);

    close(fd);

    char input[1024];
    printf("Message: ");
    fgets(input, sizeof(input), stdin);

    unlink(pipename);
  } else { // child
    printf("Child send: '%s'\n", input);
    fd = open(pipename, O_WRONLY);
    write(fd, input, 12);

    close(fd);
  }

  return 0;
}
