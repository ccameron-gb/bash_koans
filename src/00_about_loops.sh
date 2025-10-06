lesson_title 'Loops'

test_for_loops() {
  local sum
  # i is a (rather obscure) dummy variable (used for throwaway values)
  # In this loop, the sequence will always be 1 looping 10 times. Since we increment 1 ten times, then we result to sum = 10.
  for i in $( seq 1 10 ); do
    (( sum++ ))
  done
  assertEqual $sum 10
}

test_while_loops() {

  # Here the while loop will iterate until counter < 5. Counter = 0  and increments 1 every time resulting in 5. 
  counter=0
  while [ $counter -lt 5 ]; do
    (( counter++ ))
  done

  assertEqual $counter 5
}


test_until_loops() {
  # Here we can use loops for a certain span of range. Here This loop iterates 4 times decrementing from 10 resulting in 6. 
  counter=10
  until [ $counter -lt 7 ]; do
    (( counter-- ))
  done

  assertEqual $counter 6
}
