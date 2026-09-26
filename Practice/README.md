# Practice: Find the Bugs and Complete the Program

Hi, Ms.Phượng, , my name is **Võ Châu Anh**. This is my answer for the practice find & fix errors of a given code.

---

## ERROR ANALYSIS

The original code contains 2 issues:

1. **Logic error (where it's marked `// ??? something is wrong here`):**  
   The code only assigns `students[n].id = id;` but forgets to assign `name` and `gpa`.  
   **Fix:** Add the 2 missing assignments of `name` and `gpa`

2. **Missing part (`// TODO: show all students`):**  
   There is no loop to display the list of students.  
   **Fix:** Add a `for` loop to print each student's details.

## TESTING

Below are the screenshots resulted from when testing the program with at least 3 students, including three extra added features 4, 5, 6 for removal, GPA update, and highest GPA search.

`Opt 1 (Add 3 students)`

![App Screenshot: Opt 1 (Add 3 students)](https://github.com/1761-cpu/iOS-week-2/blob/main/Practice/Opt%201%20(Add%203%20students).png?raw=true)

***
`Opt 2 + Opt 6 (Show all + Highest GPA)`

![App Screenshot: Opt 2 + Opt 6 (Show all + Highest GPA)](https://github.com/1761-cpu/iOS-week-2/blob/main/Practice/Opt%202%20+%20Opt%206%20(Show%20all%20+%20Highest%20GPA).png?raw=true)

***
`Opt 5 (Update GPA)`

![App Screenshot: Opt 5 (Update GPA)](https://github.com/1761-cpu/iOS-week-2/blob/main/Practice/Opt%205%20(Update%20GPA).png?raw=true)

***
`Opt 4 (Remove student)`

![App Screenshot: Opt 4 (Remove student)](https://github.com/1761-cpu/iOS-week-2/blob/main/Practice/Opt%204%20(Remove%20student).png?raw=true)

***
`Opt 3 (Exit program)`

![App Screenshot: Opt 3 (Exit program)](https://github.com/1761-cpu/iOS-week-2/blob/main/Practice/Opt%203%20(Exit%20program).png?raw=true)
