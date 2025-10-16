lesson_title "Arithmetic evaluation"

test_arithmetic_evaluation() {
  local output
  local output2

# shellcheck disable=SC2116
  output=$(echo 1+1)

  # `echo 1+1` is executed with the result given to `output`
  # This is a demonstration of Bash command substitution.
  assertEqual "$output" "1+1"

  output2=$((1+1))

  # Bash arithmetic, with "1+1" == 2
  assertEqual $output2 2

}
