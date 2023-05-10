# azzureYamlErrorSearchInLogFiles
A scheduled yaml file that runs 2 scripts

The file is supposed to run everyday of the week at 07:00 except for Fridays and Saturdays.
At first it will print a "Hello world" message.

Second step is to look in all branches in our repository, looking for branches that have the word "dev" in them, 
then it will look for all files that end with the word "log" and if there is in any of them the word "ERROR" in it 
it will print "FAIL" otherwise, "SUCCESS". Done in bash.

Third step, do exactly like second step but compose a txt file containing all absolute paths to the files that had the word
"ERROR" in them.

Uploaded here is also a file that does completely the same thing with two changes:
1. The scripts aren't called for from a predefined directory where Azzure download the repository to, but the script are 
   contained in the yaml file.
2. The third step runs only id the second one found any files containing the word "ERROR".
