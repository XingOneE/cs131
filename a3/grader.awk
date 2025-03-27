#!/usr/bin/awk -f

# Set up initial configurations
BEGIN {
    FS = ","  # Define comma as the field separator for CSV
}

# Ignore the first line (header)
NR == 1 { next }

# Main logic to process each student’s grades
{
    # Store student info using StudentID as the key
    student_names[$1] = $2
    total_grades[$1] = $3 + $4 + $5  # Add up the three course grades

    # Update highest and lowest scores
    current_total = total_grades[$1]
    if (NR == 2) {
        highest_score = current_total
        highest_name = $2
        lowest_score = current_total
        lowest_name = $2
    } else {
        if (current_total > highest_score) {
            highest_score = current_total
            highest_name = $2
        }
        if (current_total < lowest_score) {
            lowest_score = current_total
            lowest_name = $2
        }
    }
}

# Function to compute the average of a student’s total score
function compute_avg(total) {
    return total / 3.0
}

# Final processing and output
END {
    # Print a header for the output
    print "=== Student Grade Report ==="

    # Iterate over each student
    for (student_id in total_grades) {
        # Calculate average and determine pass/fail
        student_avg = compute_avg(total_grades[student_id])
        pass_status = (student_avg >= 70) ? "PASSED" : "FAILED"

        # Print student details
        print "\nName: " student_names[student_id]
        print "Total of Grades: " total_grades[student_id]
        print "Average: " student_avg
        print "Result: " pass_status
    }

    # Print a separator and then the top/lowest scorers
    print "\n=== Summary ==="
    print "Highest Scorer: " highest_name " with " highest_score " points"
    print "Lowest Scorer: " lowest_name " with " lowest_score " points"
}
