# Brief Solution Explanation
## Case Study 114: Convert Case and Number Lines

**Student**: Kishan Ojha | **Course**: BTech CSE OS (Semester III)

---

## Problem Statement

A text file contains names and information in lowercase. The client requires:
- All text converted to uppercase
- Each line numbered for reference
- Specific keywords replaced with abbreviations
- End-of-file marker appended
- Preview of all modifications

---

## Proposed Solution

### Approach
A shell script utilizing **sed (Stream Editor)** with a two-stage pipeline architecture.

### Technical Implementation

**Five sed Commands**:

1. **y (transliterate)** - Converts lowercase to uppercase character-by-character
2. **= (line numbers)** - Prints sequential line numbers automatically
3. **s (substitute)** - Replaces keywords (e.g., "OPERATING SYSTEM" → "OS")
4. **a (append)** - Adds "----- END OF FILE -----" marker
5. **p (print)** - Previews output (implicit sed behavior)

### Key Innovation

**Hold Space Manipulation**: The script separates line numbers from content before applying transformations, then recombines them. This prevents line numbers from being modified during case conversion.

**Pipeline**:
```
input.txt → sed = → sed [transforms] → output
```

### Advantages

- ✅ **Efficient**: Single command processes entire file
- ✅ **Portable**: Works on any Unix/Linux system
- ✅ **Reliable**: Error handling prevents data corruption
- ✅ **Maintainable**: Well-commented, easy to modify

### Results

**Input**:
```
kishan ojha
frontend developer
```

**Output**:
```
1 : KISHAN OJHA
2 : FRONTEND DEVELOPER
----- END OF FILE -----
```

---

## Conclusion

The solution successfully automates text transformation using standard Unix utilities, demonstrating practical application of Operating System concepts including stream processing, pipeline architecture, and buffer management.

**Implementation**: Complete and tested ✅  
**Repository**: https://github.com/Kishann911/Operating-System
