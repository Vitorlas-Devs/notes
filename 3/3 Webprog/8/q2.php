<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php
  class Question
  {
    public $text;
    public $answers;
    public $correct;

    public function __construct(string $text, array $answers, array $correct)
    {
      $this->text = $text;
      $this->answers = $answers;
      $this->correct = $correct;
    }
  }

  $qs = [
    new Question("Which of these equals 2?", ["1+1", "3-1", "2+2"], [0, 1]),
    new Question("Which of these equals 3?", ["1+0", "3-0", "2+2"], [1]),
    new Question("Which of these equals 4?", ["1+3", "2-1", "2+2"], [0, 2]),
  ];

  for ($i = 0; $i < count($qs); $i++) {
    echo "<h3>{$qs[$i]->text}</h3>";
    foreach ($qs[$i]->answers as $key => $value) {
      $id = $i . $key;
      echo "<input type='checkbox' name='q{$i}' id='{$id}' value='{$key}'>";
      echo "<label for='{$id}'>{$value}</label><br>";
    }
  }
  ?>
</body>

</html>
