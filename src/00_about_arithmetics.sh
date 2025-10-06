lesson_title "Arithmetic evaluation"

test_arithmetic_evaluation() {
  # Set local variables
  local output
  local output2

# shellcheck disable=SC2116
# Here we set the output to a string "1+1"
# echo command will copy all contents of the exact string, including spaces.
  output=$(echo 1+1)

  assertEqual "$output" 1+1
# Here we actually set values to obtain the output 2.
  output2=$((1+1))

  assertEqual $output2 2

}
