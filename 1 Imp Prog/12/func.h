#ifndef _INC_FUNC
#define _INC_FUNC

typedef enum
{
  BSc,
  MSc,
  PhD,
} Degree;

typedef union
{
  int all_courses;
  double credit_index;
  struct
  {
    double imp_factor;
    int erdos;
  } PhDData;
} Data;

typedef struct
{
  int id;
  int age;
  double average_score;
  Degree degree;
  Data data;
} Student;

int best_student(Student students[], int length);
Student *best_student_ref(Student *students[], int length);
Student *student_init(Degree degree);

#endif