# Operating System Case Study - Semester III
## BTech CSE 24-28 | Text Processing with sed Commands

---

## 📋 Project Overview

This case study demonstrates advanced text manipulation in Unix/Linux environments using shell scripting and the `sed` (Stream Editor) utility. The project implements **5 essential sed commands** to transform text files according to client requirements.

**Scenario**: A text file contains names in lowercase. The client requires all names in uppercase and numbered for reference. The script also replaces certain keywords, appends a marker line, and previews modifications.

---

## 🎯 Requirements

The script implements the following sed commands:

| Command | Symbol | Purpose |
|---------|--------|---------|
| **Transliterate** | `y` | Convert lowercase to uppercase |
| **Line Numbers** | `=` | Print line numbers before each line |
| **Substitute** | `s` | Replace specific keywords |
| **Append** | `a` | Append a marker line at EOF |
| **Print** | `p` | Preview output (implicit behavior) |

---

## 📁 Project Structure

```
Operating_System/
├── case_number.sh          # Main executable script ✅
├── convert_case_number.sh  # Backup/alternate version
├── input.txt               # Original input file (lowercase)
├── output.txt              # Processed output file (uppercase, numbered)
├── REPORT.md               # Comprehensive technical documentation
└── README.MD               # This file
```

---

## 🚀 Quick Start

### Prerequisites

- Unix/Linux/macOS operating system
- Bash shell (version 3.0+)
- `sed` utility (pre-installed on most systems)

### Execution

```bash
# Navigate to project directory
cd /Users/kishann/Desktop/Operating_System

# Run the script
bash case_number.sh

# Save output to file
bash case_number.sh > output.txt
```

---

## 💻 Usage Example

### Input File: `input.txt`
```
Kishan Ojha 
I am a student at ITM Skills University 
Frontend Developer
The One Peice is real 
```

### Command
```bash
bash case_number.sh
```

### Output
```
1 : KISHAN OJHA 
2 : I AM A STUDENT AT ITM SKILLS UNIVERSITY 
3 : FRONTEND DEVELOPER
4 : THE ONE PEICE IS REAL 
----- END OF FILE -----
```

---

## 🔧 How It Works

### Script Architecture

The script uses a **two-stage sed pipeline**:

```bash
sed = input.txt | sed '...'
```

**Stage 1:** `sed =` adds line numbers  
**Stage 2:** Applies transformations and formats output

### Key Features

#### 1. **Error Handling**
```bash
if [ ! -f input.txt ]; then
    echo "Error: input.txt file not found!"
    exit 1
fi
```

#### 2. **Hold Space Manipulation**
The script uses advanced sed techniques to separate line numbers from content:

```bash
N           # Read next line into pattern space
h           # Copy to hold space
s/\n.*//    # Keep only line number
x           # Exchange hold and pattern space
s/.*\n//    # Keep only content
```

This ensures transformations only affect content, not line numbers.

#### 3. **Case Conversion**
```bash
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
```

#### 4. **Keyword Replacement**
```bash
s/OPERATING SYSTEM/OS/g
```

#### 5. **Append End Marker**
```bash
$ a\
----- END OF FILE -----
```

---

## 📚 sed Commands Explained

### **y - Transliterate**
Converts characters one-to-one from source to destination set.

```bash
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
```

### **= - Line Numbers**
Prints current line number on a separate line.

```bash
sed = input.txt
```

### **s - Substitute**
Searches for patterns and replaces them.

```bash
s/OPERATING SYSTEM/OS/g
```
- `g` flag = global replacement (all occurrences)

### **a - Append**
Appends text after the addressed line.

```bash
$ a\
----- END OF FILE -----
```
- `$` addresses the last line

### **p - Print**
Prints pattern space (implicit in our script - sed outputs by default).

---

## 📊 Deliverables

### ✅ Required Files

1. **case_number.sh** - Main executable script
2. **input.txt** - Sample input file
3. **output.txt** - Generated output file
4. **REPORT.md** - Comprehensive technical documentation
5. **Screenshots** - Execution demonstrations

### ✅ Documentation

- **README.MD** (this file) - Project overview and usage guide
- **REPORT.md** - Detailed command explanations, test results, and learning outcomes

---

## 🧪 Testing

### Test 1: Basic Functionality ✅
```bash
$ bash case_number.sh
1 : KISHAN OJHA 
2 : I AM A STUDENT AT ITM SKILLS UNIVERSITY 
3 : FRONTEND DEVELOPER
4 : THE ONE PEICE IS REAL 
----- END OF FILE -----
```
**Status**: PASS

### Test 2: Keyword Replacement ✅
```bash
$ echo "I study operating system" > test_input.txt
$ sed = test_input.txt | sed 'N; h; s/\n.*//; x; s/.*\n//; 
  y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/; 
  s/OPERATING SYSTEM/OS/g; H; g; s/\n/ : /'
1 : I STUDY OS
```
**Status**: PASS

### Test 3: Output File Creation ✅
```bash
$ bash case_number.sh > output.txt
$ cat output.txt
```
**Status**: PASS

---

## 📝 Step-by-Step Implementation

Following the case study requirements:

1. ✅ **Read the input text file** - Script checks for `input.txt` existence
2. ✅ **Convert lowercase to uppercase using y** - All text converted to uppercase
3. ✅ **Print line numbers using =** - Lines numbered 1-4
4. ✅ **Replace keywords using s** - "OPERATING SYSTEM" → "OS"
5. ✅ **Append marker using a** - End marker appended
6. ✅ **Preview changes with p** - Output displayed to terminal

---

## 🎓 Learning Objectives

This project demonstrates mastery of:

- **Stream Processing**: Using sed for text transformation
- **Shell Scripting**: Bash script development and execution
- **Hold Space**: Advanced sed buffer manipulation
- **Pipeline Design**: Combining commands for complex operations
- **Error Handling**: Input validation and error messages
- **Documentation**: Technical writing and reporting

---

## 🛠️ Customization

### Modify Keyword Replacement

Edit line 30 in `case_number.sh`:
```bash
s/YOUR_KEYWORD/REPLACEMENT/g
```

### Change End Marker

Edit lines 38-39 in `case_number.sh`:
```bash
$ a\
YOUR CUSTOM MARKER
```

### Process Different Files

Modify the script to accept command-line arguments:
```bash
INPUT_FILE="${1:-input.txt}"
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: $INPUT_FILE file not found!"
    exit 1
fi
```

Usage: `bash case_number.sh myfile.txt`

---

## 🐛 Troubleshooting

### Permission Denied
```bash
chmod +x case_number.sh
./case_number.sh
```

### File Not Found
Ensure `input.txt` exists in the same directory:
```bash
ls -la input.txt
```

### Unexpected Output
Check sed version compatibility:
```bash
sed --version
```

---

## 📖 Additional Resources

- **REPORT.md** - Comprehensive technical documentation with detailed command explanations
- [GNU Sed Manual](https://www.gnu.org/software/sed/manual/sed.html)
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)
- [Regular Expressions Tutorial](https://www.regular-expressions.info/)

---

## 👨‍💻 Author

**Kishan Ojha**  
BTech CSE 24-28  
ITM Skills University  
Operating System - Semester III Case Study

---

## ✅ Verification Status

All requirements verified and working correctly:

| Feature | Status | Evidence |
|---------|--------|----------|
| Case conversion (y) | ✅ PASS | All text uppercase |
| Line numbers (=) | ✅ PASS | Lines numbered 1-4 |
| Keyword replacement (s) | ✅ PASS | Keywords replaced correctly |
| Append marker (a) | ✅ PASS | End marker displays |
| Preview output (p) | ✅ PASS | Output visible |

**Status**: Ready for submission ✅

---

## 📄 License

This project is created for educational purposes as part of the BTech CSE Operating System course.

---

**Last Updated**: December 17, 2025  
**Project Type**: Academic Case Study  
**Course**: Operating System (Semester III)
