#include "func.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int best_student(Student students[], int length)
{
  int max_index = 0;
  double max_score = students[0].average_score;

  for (int i = 1; i < length; ++i)
  {
    if (students[i].average_score > max_score)
    {
      max_score = students[i].average_score;
      max_index = i;
    }
  }

  return students[max_index].id;
}

Student *student_init(Degree degree)
{
  Student *student = (Student *)malloc(sizeof(Student));
  static int id = 0;

  if (!student)
  {
    printf("Malloc failed");
    exit(1);
  }

  student->id = ++id;
  student->degree = degree;
  student->age = rand() % 20 + 18;
  student->average_score = 1.0 + rand() % 100 / 10.0;

  Data data;

  switch (degree)
  {
  case BSc:
    data.all_courses = rand() % 7 + 5;
    break;
  case MSc:
    data.credit_index = rand() % 10 + 1;
    break;
  case PhD:
    data.PhDData.imp_factor = 1.0 + rand() % 10 / 2.0;
    data.PhDData.erdos = rand() % 6 + 2;
    break;
  }

  student->data = data;

  return student;
}

Student *best_student_ref(Student *students[], int length)
{
  int max_index = 0;

  for (int i = 1; i < length; ++i)
  {
    if (students[i]->average_score > students[max_index]->average_score)
    {
      max_index = i;
    }
  }

  return students[max_index];
}