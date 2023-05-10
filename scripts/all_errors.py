import os

def search_for_error():
    error_log_files = []

    root_dir = os.getcwd().replace('\\', '/')                                       #get workspace directory, the search will 
                                                                                    #start from here, given each branch is a directory
    
    for dirpath, dirnames, filenames in os.walk(root_dir):                          #iterate over all directories that contain the word "dev" in their name
        for dirname in dirnames:
            if "dev" in dirname:
                current_dir = os.path.join(dirpath, dirname)                        #get full path to the current directory               
                for filename in os.listdir(current_dir):                            #iterate over all files in the current directory
                    if filename.endswith("log"):
                        log_file_path = os.path.join(current_dir, filename)         #get the full path to the current log file

                        with open(log_file_path, "r") as log_file:                  #check if the log file contains the word "ERROR"
                            if "ERROR" in log_file.read():
                                error_log_files.append(log_file_path)               #add the path to the to the list

    with open("log_files_with_error.txt", "w") as f:                                #overwrite the data to a file that saves all
        for error_log_file in error_log_files:                                      #the error logs
            f.write(error_log_file + "\n")

if __name__ == "__main__":
    search_for_error()