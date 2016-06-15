// We're asking the user to give us N collections of numbers.
// We want to take the largest number out of each collection, and display it.

while user wants to keep going
  - ask the user for a collection of number
  - iterate through a collection one by one.
    - save the first value as the starting value.
    - for each iteration, compare the saved value with the current value.
      - if the saved value is greater or even
        - move to the next number in collection
      - otherwise, if the current value is greater
        - reassign the saved value as the current value

  - after iterating through the collection, save the largest value into the list.
  - ask the user if they want to input another collection

return saved list of numbers
