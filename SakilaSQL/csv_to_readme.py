import csv
import os

#current_directory = os.getcwd()
#print("Current directory:", current_directory)
# Specify the path to the directory you want to change to
new_directory = r'C:\Users\VToml\Jupter-Lab\Portfolio_Project\SakilaSQL'

# Change the current working directory
os.chdir(new_directory)


def csv_to_markdown_table(csv_file):
    with open(csv_file, 'r', newline='') as csvfile:
        csvreader = csv.reader(csvfile)
        table = []
        for row in csvreader:
            table.append('| ' + ' | '.join(row) + ' |')
        return table

def append_tables_to_readme(csv_files, readme_file):
    with open(readme_file, 'a') as readme:
        for csv_file in csv_files:
            readme.write(f"\n\n## {csv_file}\n\n")
            markdown_table = csv_to_markdown_table(csv_file)
            for row in markdown_table:
                readme.write(row + '\n')

# List of CSV files you want to convert and append to README
csv_files = ['Canada_Customers.csv']

# Your README file
readme_file = r'C:\Users\VToml\Jupter-Lab\Portfolio_Project\README.md'

# Call the function to append tables to the README file
append_tables_to_readme(csv_files, readme_file)
