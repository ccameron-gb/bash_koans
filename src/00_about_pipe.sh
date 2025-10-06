lesson_title "Piping"

test_piping_output_to_another_program() {
  # The pipe lets you use the output of a program as the input of another one

  # Here this command we have the output string 'milk' used as the input for s/milk/beer to substitute the old variable with the new one. 
  # g references them as global variables. 
  # sed is referred as stream editor told to -e (execute) substitution. 
  local output=$(echo 'milk' | sed -e "s/milk/beer/g")

  assertEqual "$output" beer
}
