#include <errno.h>
#include <fcntl.h>
#include <mqueue.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  pid_t child1;
  pid_t child2;
  char *mqname = "/rettend";
  struct mq_attr attr;
  mqd_t mq;

  attr.mq_maxmsg = 5;
  attr.mq_msgsize = 50;

  mq_unlink(mqname);

  mq = mq_open(mqname, O_CREAT | O_RDWR, 0600, &attr);
  if (mq < 0) {
    printf("Failed to create message queue: %s\n", strerror(errno));
    return 1;
  }

  char buffer[100] = {0};
  printf("Buffer initialized with length: %zu\n", strlen(buffer));

  child1 = fork();
  if (child1 > 0) { // parent

    child2 = fork();

    if (child2 > 0) { // child1
      for (int i = 0; i <= 5; i++) {
        int result = mq_send(mq, (char *)&i, sizeof(i), 0);
        if (result == -1) {
          printf("Parent: Failed to send message: %s\n", strerror(errno));
        } else {
          printf("Parent: message sent successfully\n");
        }
      }

      wait(NULL);
      mq_close(mq);
    } else { // child2
      char buffer = 0;

      for (int i = 0; i <= 5; i++) {
        int bytes = mq_receive(mq, &buffer, sizeof(buffer), 0);

        if (bytes >= 0) {
          printf("Child: Received message: \"%s\" (%d bytes)\n", &buffer,
                 bytes);
        } else {
          printf("Child: Failed to receive message: %s\n", strerror(errno));
        }
      }

      mq_close(mq);
      printf("Child: Finished execution\n");
      return 0;
    }

    char message1[] = "Hajra Fradi!AAA";
    char message2[] = "Hajra Debrecen!";

    int result = mq_send(mq, message1, strlen(message1) + 1, 5);
    if (result == -1) {
      printf("Parent: Failed to send first message: %s\n", strerror(errno));
    } else {
      printf("Parent: First message sent successfully\n");
    }

    result = mq_send(mq, message2, strlen(message2) + 1, 4);
    if (result == -1) {
      printf("Parent: Failed to send second message: %s\n", strerror(errno));
    } else {
      printf("Parent: Second message sent successfully\n");
    }

    wait(NULL);

    mq_close(mq);
    mq_unlink(mqname);
    printf("Parent: Finished execution\n");
  } else {

    int bytes = mq_receive(mq, buffer, sizeof(buffer) - 1, NULL);
    if (bytes >= 0) {
      buffer[bytes] = '\0';
      printf("Child: Received message: \"%s\" (%d bytes)\n", buffer, bytes);
    } else {
      printf("Child: Failed to receive message: %s\n", strerror(errno));
    }

    memset(buffer, 0, sizeof(buffer));
    bytes = mq_receive(mq, buffer, sizeof(buffer) - 1, 0);
    if (bytes >= 0) {
      buffer[bytes] = '\0';
      printf("Child: Received second message: \"%s\" (%d bytes)\n", buffer,
             bytes);
    }

    mq_close(mq);
    printf("Child: Finished execution\n");
    return 0;
  }

  return 0;
}
