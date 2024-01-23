# #!/bin/bash

# output_file="selectedops.txt"
# excel_file="execution_times.xlsx"
# separator="---------------------------"
# timeout_duration="1m"  # Set the timeout duration (30 seconds)

# # Clear the output file
# > $output_file

# # Initialize a variable to store the found image indexes
# found_image_indexes=""

# # Initialize variables for Excel sheet
# echo -e "Image Index\tExecution Time (s)" > $excel_file

# # Image indexes to run the command for
# image_indexes="2 6 7 9 15 20 26 29 36 37 38 39 40 41 42 44 46 58 59 61 63 65 66 72 74 76 77 80 81 89 92 93 94 95 96 97"

# # Loop through the specified image indexes
# for image_index in $image_indexes; do
#     echo "Running command for image index $image_index..."
#     echo "Output for image index $image_index:" >> $output_file
#     # Run the command with timeout and measure time
#     start_time=$(date +%s.%N)
#     command_output=$(timeout $timeout_duration ./drefine --network /home/jawwadabd/Downloads/sem2/MTP/VeriNN/deep_refine/tf/mnist/mnist_relu_3_50.tf --dataset-file /home/jawwadabd/Downloads/sem2/MTP/VeriNN/deep_refine/benchmarks/dataset/mnist/mnist_test.csv --result-file res.txt --epsilon 0.05 --image-index $image_index)
#     end_time=$(date +%s.%N)
#     execution_time=$(echo "$end_time - $start_time" | bc)
    
#     echo "$command_output" | grep '^[FLm]' >> $output_file
    
#     # Check if "Found counter assignment!!" is in the output
#     if [[ $command_output == *"Found counter assignment!!"* ]]; then
#         found_image_indexes="$found_image_indexes $image_index"
#     fi
    
#     if [ $? -eq 124 ]; then
#         echo "Command timed out for image index $image_index."
#     else
#         echo "Command completed for image index $image_index."
#         echo $separator >> $output_file
        
#         # Append image index and execution time to Excel sheet
#         echo -e "$image_index\t$execution_time" >> $excel_file
#     fi
# done

# # Append found image indexes at the end of the file
# echo "Found counter assignment for image indexes: $found_image_indexes" >> $output_file

# echo "All commands completed. Output saved to $output_file"

#!/bin/bash

output_file="selectedops.txt"
excel_file="execution_data.xlsx"
separator="---------------------------"
timeout_duration="10m"  # Set the timeout duration (30 seconds)

# Clear the output file
> $output_file

# Initialize a variable to store the found image indexes
found_image_indexes=""

# Initialize variables for Excel sheet
echo -e "Image Index\tExecution Time (s)\tNum Marked Neurons\tIs Verified" > $excel_file

# Image indexes to run the command for
# image_indexes="2 6 7 9 15 20 26 29 36 37 38 39 40 41 42 44 46 58 59 61 63 65 66 72 74 76 77 80 81 89 92 93 94 95 96 97"
image_indexes="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99"
# Loop through the specified image indexes
for image_index in $image_indexes; do
    echo "Running command for image index $image_index..."
    echo "Output for image index $image_index:" >> $output_file
    # Run the command with timeout and measure time
    start_time=$(date +%s.%N)
    command_output=$(timeout $timeout_duration ./drefine --network /home/jawwadabd/Downloads/sem2/hybrid/VeriNN/deep_refine/tf/mnist/mnist_relu_3_50.tf --dataset-file /home/jawwadabd/Downloads/sem2/hybrid/VeriNN/deep_refine/benchmarks/dataset/mnist/mnist_test.csv --result-file res.txt --epsilon 0.05 --image-index $image_index)
    end_time=$(date +%s.%N)
    execution_time=$(echo "$end_time - $start_time" | bc)
    num_marked_neurons=$(echo "$command_output" | grep -oP 'num_marked_neurons=\K\d+' || echo "N/A")
    echo "$command_output" | grep '^[dFLm]' >> $output_file
    
    # Check if "Found counter assignment!!" is in the output
    if [[ $command_output == *"verified"* ]]; then
        is_verified="verified"
    elif [[ $command_output == *"failed"* ]]; then
        is_verified="failed"
    else
        is_verified="N/A"
    fi
    if [[ $command_output == *"Found counter assignment!!"* ]]; then
        found_image_indexes="$found_image_indexes $image_index"
    fi
    
    if [ $? -eq 124 ]; then
        echo "Command timed out for image index $image_index."
    else
        echo "Command completed for image index $image_index."
        echo $separator >> $output_file
        
        # Append image index, execution time, and num_marked_neurons to Excel sheet
        echo -e "$image_index\t$execution_time\t$num_marked_neurons\t$is_verified" >> $excel_file
    fi
done

# Append found image indexes at the end of the file
echo "Found counter assignment for image indexes: $found_image_indexes" >> $output_file

echo "All commands completed. Output saved to $output_file"
