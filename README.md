🧠 Compiler Construction Lab – T7478
📘 Course Code: T7478 | 💻 Department: Computer Science Engineering
👨‍💻 Submitted by: Atharva Kale (PRN: 22070521071)
🏩 VII Semester, Section C | Date of Submission: 09 October 2025
👩‍🎓 Guided by: Dr. Snehlata K. Wankhade, Assistant Professor
🌟 Overview
This repository contains all Compiler Construction Lab Executions (LEX & YACC-based) as part of the Savitribai Phule Pune University curriculum. Each practical demonstrates a key compiler design concept such as lexical analysis, parsing, syntax checking, and intermediate code generation.

The lab emphasizes:

Understanding LEX (Lexical Analyzer) and YACC (Yet Another Compiler Compiler).
Building the core components of a compiler using C and automation tools.
Applying theory to real-world language parsing and translation tasks.
🧩 Practicals Overview
No.	Practical Title	Description
1	Theory Assignment on LEX and YACC Compilation	Basic understanding of LEX & YACC structure with simple token mapping.
2	Count Comments, Keywords, Identifiers, Words, Lines, and Spaces	Lexical analysis of a file to identify programming tokens.
3	Count Words Starting with 'A'	Pattern recognition using regular expressions.
4	Convert Lowercase to Uppercase and Vice Versa	Character transformation using LEX rules.
5	Decimal to Hexadecimal Conversion	File-based number system conversion using Lex.
6	Test Lines Ending with 'com'	String pattern matching and conditional output.
7	Postfix Expression Evaluation	Stack-based expression evaluation using YACC.
8	Desk Calculator with Error Recovery	Arithmetic expression parser and evaluator with syntax error handling.
9	Parser for ‘FOR’ Loop Statements	Grammar validation for control structure syntax.
10	Intermediate Code (IC) Generator for Arithmetic Expression	Generation of three-address code for expressions (compiler backend simulation).
⚙️ Tools & Technologies Used
LEX / FLEX → For lexical analysis
YACC / BISON → For syntax analysis and parsing
C Programming Language
GCC Compiler (for building and testing)
Ubuntu/Linux Terminal (recommended environment)
🧬 Key Learning Outcomes
Gained hands-on experience with compiler front-end design.
Learned how to tokenize, parse, and translate source code.
Implemented error handling and intermediate code generation.
Explored real compiler automation using LEX & YACC.
🚀 How to Run
# 1️⃣ Install required tools
sudo apt-get install flex bison gcc

# 2️⃣ Compile LEX and YACC files
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output

# 3️⃣ Run the executable
./output
(Adjust filenames for each practical accordingly.)

🗾️ Reference Books
Doug Brown, John Levine, Tony Mason – LEX and YACC (2nd Edition), O’Reilly Media
Tom Niemann – A Compact Guide to LEX & YACC, epaperpress.com
Compiling Techniques, American Elsevier Publishing Company
🏁 Acknowledgment
Special thanks to Dr. Snehlata K. Wankhade, Assistant Professor, for guidance, mentorship, and support throughout the lab execution and report preparation.

⭐ If you find this helpful, don’t forget to star the repository!
“Compilers are the bridge between human thought and machine execution — building one is building intelligence itself.”

