# P: Understanding the Problem
# E: Examples and Test Cases
# D: Data Structures
# A: Algorithms
# C: Code

*****

# P: Understanding the Problem

- Establish the rules/define the boundaries of the Problem
  - Assess available information
  - Restate Explicit requirements
  - Identify Implicit requirements
-Spend enough time.  Dont rush this step.

**General Example**

Given a string, produce a new string with every other word removed.

- Explicit requirements:
  - Input: String
  - Output: String
  - Remove every other word from input string

- Questions:
  - What do we mean by every other word?
  - How do we define a word in this context?
- Implicit requirements:
  - Words are delimited by spaces

# E: Examples and Test Cases

- Can confirm/refute assumptions
- Help to anwer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries

# D: Data Structures

- Help to reason with data more logically
- Help us to interact with data at the implementation level
- Part of the problem solving process
- Data structures are closely linked to algorithms
  - Algos are a set of steps from input to output
  - Algos involve structuring data in a certain way

# A: Algorithms

- A logical sequence of steps for accomplishing a task or objective
  - Closely linked to Data Structures
  - Series of steps to structure data to produce the required output."
- Stay abstract/high level
  - Avoid implementation detail
  - Don't worry about efficiency for now

# C: Code

- Translating our pseudocode algorithm to code
- Think about the algorithm in the context of our chosen programming language
  - Language features and constraints
  - Characteristics of data structures
  - Methods and functions specific to the language
  - Syntax/Coding patterns
- Create test cases
- Code with intent

-- HAVING A PRE PREPARED ALGORITHM ALLOWS US TO CODE WITH INTENT --

*****

## Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2.  The integers are grouped in rows, awith the first row containing one integer, the second row two integers, the third row three integers, and so on.  Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

# Problem analysis

Explicit Requirements
- Sequence of even integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row is incrementally larger: 1, 2, 3 ...
- Row 'number equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, lll
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - Represents the sum of the integers in the row identified by the input integer

- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, ...

[2]
[4, 6]
[8, 10, 12]
[14, 16, 18, 20]
....

Implicit Requirements
- How to we create the structure?

**Examples**

row number: 1 --> sum is 2
row number: 2 --> sum is 10
row number: 4 --> sum is 68

2 --> 2
8, 10, 12 --> 10
14, 16, 18, 20 --> 68

**Data Structure**

2
4, 6
8, 10, 12
14, 16, 18, 20
....

- Overall structure represents a sequence
- Within that structure we have individual rows
- The individual rows are in a set order within context of the sequence
- Individual rows contain integers
- Can assume that integers are in a set order
- A nested array would be the most suitable data structure for this problem.

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]

**Algorithm**

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
  - All the rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum of the final row

*Problem: Create a Row*

Rules:
- Row is an array
- Array contains integers
- Integers are consecutive even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The start integer (first integer of a given row ie. 2, 4, 8, 14)
  - The length of the row
- Output: the row array itself ie. '[8, 10, 12]'

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data structures:
- An array of integers

Algorithm:
1. Create an empty 'row' array to contain the integers
2. Add the starting integer to the 'row' array
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 & 3 until the array has reached the correct length.
5. Return the 'row' array