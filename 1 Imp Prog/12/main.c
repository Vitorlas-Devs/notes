#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "func.h"

#define STUDENT_NUMBER 10

int main()
{
  srand(time(NULL));

  Student students[] = {
      {1, 18, 85.5, BSc, {.all_courses = 7}},
      {2, 20, 92.0, MSc, {.credit_index = 6}},
      {3, 19, 54.3, BSc, {.all_courses = 6}},
      {4, 18, 62.2, PhD, {.PhDData = {3.4, 5}}},
  };

  const char *degrees[3] = {"BSc", "MSc", "PhD"};

  int length = sizeof(students) / sizeof(students[0]);

  int bestId = best_student(students, length);

  printf("Best student: %d\n", bestId);

  Student *studentList[STUDENT_NUMBER];

  for (int i = 0; i < STUDENT_NUMBER; ++i)
  {
    Degree degree = rand() % 3;
    studentList[i] = student_init(degree);

    printf("%d. student = { id: %d, age: %d, score: %.2f, degree: %s }\n", i,
           studentList[i]->id,
           studentList[i]->age,
           studentList[i]->average_score,
           degrees[studentList[i]->degree]);
  }

  for (int i = 0; i < STUDENT_NUMBER; ++i)
  {
    free(studentList[i]);
  }

  return 0;
}