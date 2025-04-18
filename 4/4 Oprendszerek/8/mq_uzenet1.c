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

/**
 * POSIX Message Queue Example
 * Demonstrates parent-child communication using message queues.
 */
int main(int argc, char *argv[]) {
  pid_t child;
  char *mqname = "/rettend";
  struct mq_attr attr;
  mqd_t mq;

  // Configure message queue attributes
  attr.mq_maxmsg = 5;   // Maximum number of messages
  attr.mq_msgsize = 50; // Maximum message size in bytes

  // Delete the queue if it already exists
  mq_unlink(mqname);

  // Create a new message queue
  mq = mq_open(mqname, O_CREAT | O_RDWR, 0600, &attr);
  if (mq < 0) {
    printf("Failed to create message queue: %s\n", strerror(errno));
    return 1;
  }

  // Initialize buffer for message exchange
  char buffer[100] = {0};
  printf("Buffer initialized with length: %zu\n", strlen(buffer));

  child = fork();
  if (child > 0) {
    // Parent process
    char message1[] = "Hajra Fradi!AAA";
    char message2[] = "Hajra Debrecen!";

    // Send messages with different priorities
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

    // Wait for child to complete
    wait(NULL);

    // Clean up the message queue
    mq_close(mq);
    mq_unlink(mqname);
    printf("Parent: Finished execution\n");
  } else {
    // Child process
    // Receive the first message (highest priority)
    int bytes = mq_receive(mq, buffer, sizeof(buffer) - 1, NULL);
    if (bytes >= 0) {
      buffer[bytes] = '\0'; // Ensure null termination
      printf("Child: Received message: \"%s\" (%d bytes)\n", buffer, bytes);
    } else {
      printf("Child: Failed to receive message: %s\n", strerror(errno));
    }

    // Receive the second message
    memset(buffer, 0, sizeof(buffer));
    bytes = mq_receive(mq, buffer, sizeof(buffer) - 1, 0);
    if (bytes >= 0) {
      buffer[bytes] = '\0'; // Ensure null termination
      printf("Child: Received second message: \"%s\" (%d bytes)\n", buffer,
             bytes);
    }

    mq_close(mq);
    printf("Child: Finished execution\n");
    return 0;
  }

  return 0;
}
