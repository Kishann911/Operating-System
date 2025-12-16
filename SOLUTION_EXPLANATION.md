# Case Study 114: Convert Case and Number Lines
## Problem Statement & Proposed Solution

**Course**: BTech CSE Operating System - Semester III (24-28)  
**Student**: Kishan Ojha  
**Institution**: ITM Skills University

---

## 📋 Problem Statement

A client maintains a text file containing names and information in lowercase format. For proper documentation and reference purposes, the client requires:

1. **Case Standardization**: All text converted to uppercase for uniformity
2. **Reference Numbers**: Each line numbered for easy citation and tracking
3. **Keyword Optimization**: Specific technical terms replaced with standard abbreviations
4. **File Marking**: Clear end-of-file marker for file integrity verification
5. **Preview Capability**: Ability to preview all modifications before finalizing

The challenge is to automate this text transformation process using Unix/Linux command-line tools while maintaining data integrity and implementing all requirements efficiently.

---

## 💡 Proposed Solution

### Solution Overview

I propose a **shell script-based solution** utilizing the `sed` (Stream Editor) utility, which is a powerful Unix/Linux text processing tool. The solution implements a **two-stage pipeline architecture** that separates line numbering from content transformation, ensuring accurate processing without data corruption.

### Technical Approach

**Script**: `case_number.sh`

The solution employs **five essential sed commands** working in concert:

#### 1. **y Command (Transliterate)**
- **Purpose**: Character-by-character case conversion
- **Implementation**: Maps each lowercase letter (a-z) to its uppercase equivalent (A-Z)
- **Advantage**: More efficient than multiple substitution commands

#### 2. **= Command (Line Numbers)**
- **Purpose**: Generate sequential reference numbers
- **Implementation**: sed's built-in line number printing feature
- **Advantage**: Automatic numbering without manual tracking

#### 3. **s Command (Substitute)**
- **Purpose**: Replace technical keywords with abbreviations
- **Implementation**: Pattern matching and global replacement (e.g., "OPERATING SYSTEM" → "OS")
- **Advantage**: Reduces file size and standardizes terminology

#### 4. **a Command (Append)**
- **Purpose**: Add end-of-file verification marker
- **Implementation**: Appends "----- END OF FILE -----" after the last line
- **Advantage**: Provides visual confirmation of complete file processing

#### 5. **p Command (Print/Preview)**
- **Purpose**: Display transformations in real-time
- **Implementation**: Implicit sed output to stdout
- **Advantage**: Allows verification before permanent file modification

### Architecture Design

```
Input File → Stage 1: Add Line Numbers → Stage 2: Transform Content → Output
```

**Stage 1**: `sed = input.txt`
- Adds line numbers on separate lines
- Creates alternating number-content pattern

**Stage 2**: Complex sed script with hold space manipulation
- Reads number-content pairs
- Separates numbers from content using hold space
- Applies transformations only to content
- Recombines with proper formatting
- Outputs: "number : content"

### Key Innovation: Hold Space Manipulation

The critical challenge was preventing line numbers from being transformed by the case conversion command. For example, without protection, the number "1" could be interpreted as a character and incorrectly modified.

**Solution**: Use sed's hold space (auxiliary buffer) to:
1. Temporarily store line numbers
2. Apply transformations exclusively to content
3. Recombine both with proper delimiter

This ensures data integrity and correct formatting.

---

## 🔧 Implementation Details

### Algorithm Flow

```
1. Validate input file exists
2. Execute sed = to add line numbers
3. Pipe to second sed for transformations:
   a. Read two lines (N command)
   b. Save to hold space (h command)
   c. Extract line number only
   d. Exchange with pattern space (x command)
   e. Extract content only
   f. Apply case conversion (y command)
   g. Apply keyword replacement (s command)
   h. Recombine number + content
   i. Format with delimiter
   j. Append end marker at EOF (a command)
4. Output to stdout or file
```

### Error Handling

- **File Existence Check**: Script validates input.txt before processing
- **Clear Error Messages**: User-friendly notification if file is missing
- **Graceful Exit**: Non-zero exit code on error for scripting integration

---

## 📊 Expected Results

### Input Example:
```
kishan ojha
i am a student at itm skills university
frontend developer
```

### Output Example:
```
1 : KISHAN OJHA
2 : I AM A STUDENT AT ITM SKILLS UNIVERSITY
3 : FRONTEND DEVELOPER
----- END OF FILE -----
```

---

## 🎯 Advantages of This Solution

1. **Efficiency**: Single command execution processes entire file
2. **Portability**: Works on any Unix/Linux system with standard sed
3. **Scalability**: Handles files of any size without modification
4. **Maintainability**: Well-commented code for easy understanding
5. **Reliability**: Error handling prevents data corruption
6. **Flexibility**: Easy to modify for different keywords or formats

---

## 📚 Learning Outcomes

This solution demonstrates practical application of:
- **Stream Processing**: Efficient text manipulation without loading entire file into memory
- **Pipeline Architecture**: Combining simple tools for complex operations
- **Buffer Management**: Advanced sed hold space techniques
- **Pattern Matching**: Regular expressions for intelligent text replacement
- **Shell Scripting**: Automation of repetitive tasks

---

## 🔄 Future Enhancements

Potential improvements:
- Accept command-line arguments for input/output files
- Configuration file for multiple keyword replacements
- Support for different output formats (CSV, JSON)
- Batch processing of multiple files
- Integration with larger document management systems

---

## ✅ Conclusion

The proposed solution successfully addresses all client requirements using standard Unix/Linux tools. The implementation is **efficient, reliable, and maintainable**, making it suitable for both educational purposes and real-world applications. The use of sed's advanced features demonstrates deep understanding of Operating System concepts and text processing techniques.

**Status**: Solution implemented, tested, and verified ✅

---

**Repository**: https://github.com/Kishann911/Operating-System  
**Documentation**: Complete README and technical guide included  
**Date**: December 17, 2025
