#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define ESC "\033"
#define UP 72
#define DOWN 80
#define ENTER 13

// create a detailed markdown IDE popup for the dropdown function:

// # Dropdown
// A function that creates a dropdown menu with the given options and returns the selected option
//
// ## Parameters
// - `options`: An array of strings containing the options to display
// - `num_options`: The number of options in the array
// - `selected`: The index of the option to select by default
//
// ## Returns
// The index of the selected option
//
// ## Example
// ```c
// char *options[] = {"Option 1", "Option 2", "Option 3"};
// int selected = dropdown(options, 3, 0);
// printf("You selected: %s\n", options[selected]);
// ```
//
// ## Acknowledgements
// This function was created by GPT-4 (Bing)
int dropdown(
    char *options[],
    int num_options,
    int selected)
{
  int key; // The key pressed by the user

  while (1) // Loop until the user presses enter
  {
    // Print the options with ANSI escape codes to move the cursor and change the color
    for (int i = 0; i < num_options; i++)
    {
      if (i == selected) // If this is the selected option, print it in reverse color
        printf(ESC "[7m %s " ESC "[0m\n", options[i]);
      else // Otherwise, print it in normal color
        printf(" %s \n", options[i]);
    }

    key = _getch(); // Get the key pressed by the user

    if (key == 0 || key == 224) // If the key is a special key (such as an arrow key), get the next key
      key = _getch();

    if (key == UP) // If the key is the up arrow, move the selection up
    {
      selected--;
      if (selected < 0) // If the selection goes beyond the first option, wrap around to the last option
        selected = num_options - 1;
    }
    else if (key == DOWN) // If the key is the down arrow, move the selection down
    {
      selected++;
      if (selected >= num_options) // If the selection goes beyond the last option, wrap around to the first option
        selected = 0;
    }
    else if (key == ENTER) // If the key is enter, break out of the loop
      break;
    else if (key == 27) // If the key is escape, return -1 to indicate that the user cancelled the selection
      return -1;

    printf(ESC "[%dA", num_options); // Move the cursor up by the number of options
  }

  return selected; // Return the index of the selected option
}
