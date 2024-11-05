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

    public function __construct(string $text, array $answers, int $correct)
    {
      $this->text = $text;
      $this->answers = $answers;
      $this->correct = $correct;
    }
  }

  $qs = [
    new Question("What is 2+2?", ["3", "4", "5"], 2),
    new Question("What is 3+3?", ["6", "7", "8"], 1),
    new Question("What is 4+4?", ["8", "9", "10"], 1),
  ];

  for ($i = 0; $i < count($qs); $i++) {
    echo "<h3>{$qs[$i]->text}</h3>";
    foreach ($qs[$i]->answers as $key => $value) {
      $id = $i . $key;
      echo "<input type='radio' name='q{$i}' id='{$id}' value='{$key}'>";
      echo "<label for='{$id}'>{$value}</label><br>";
    }
  }
  ?>
</body>

</html>