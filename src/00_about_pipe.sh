lesson_title "Piping"

test_piping_output_to_another_program() {
  # use echo to create the string 'milk'
  # use sed -e to replace all occurrences of 'milk' with 'beer' 
  # eg: echo 'milk milk milk ' | sed -e "s/milk/beer/g"
  # eg output: beer beer beer
  # $(...) captures the output of the command into "output"
  local output=$(echo 'milk' | sed -e "s/milk/beer/g") # 

  assertEqual "$output" "beer"
}
