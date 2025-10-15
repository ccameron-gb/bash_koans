lesson_title 'Loops'  # setting the lesson title to "Loops" — this marks what topic we’re learning

test_for_loops() {  # defining a test to explore how for loops work
  local sum  # making a local variable called sum to store the running total
  # this one just loops 10 times bro
  for _ in $( seq 1 10 ); do  # runs the loop from 1 to 10 using seq
    (( sum++ ))  # adds 1 to sum in each round
  done  # end of the for loop
  assertEqual $sum 10  # checks if the final sum equals 10 after looping
}

test_while_loops() {  # defining a test to see how while loops behave
  counter=0  # starting counter at 0
  # runs till counter reaches 5 da
  while [ $counter -lt 5 ]; do  # keeps running while counter is less than 5
    (( counter++ ))  # adds 1 to counter each time it loops
  done  # end of the while loop

  assertEqual $counter 5  # makes sure counter stopped at 5
}


test_until_loops()./ {  # defines a test for until loops — note: runs until condition becomes true
  counter=10  # start counter high at 10
  until [ $counter -lt 7 ]; do  # keeps looping until counter drops below 7
    (( counter-- ))  # subtracts 1 from counter every time
  done  # end of until loop

  assertEqual $counter 6 # ends when counter drops below 7, so final value is 6
}
