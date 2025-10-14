lesson_title 'Loops'

test_for_loops() {
  local sum
  # this one just loops 10 times bro
  for _ in $( seq 1 10 ); do
    (( sum++ ))
  done
  assertEqual $sum 10
}

test_while_loops() {
  counter=0
  # runs till counter reaches 5 da
  while [ $counter -lt 5 ]; do
    (( counter++ ))
  done

  assertEqual $counter 5
}


test_until_loops()./ {
  counter=10
  until [ $counter -lt 7 ]; do
    (( counter-- ))
  done

  assertEqual $counter 6 # ends when counter drops below 7
}
