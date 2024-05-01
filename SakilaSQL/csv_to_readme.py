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
        header = next(csvreader)
        table.append('| ' + ' | '.join(header) + ' |')
        table.append('| ' + ' | '.join(['---'] * len(header)) + ' |')
        for row in csvreader:
            table.append('| ' + ' | '.join([cell.strip() for cell in row]) + ' |')  # Remove leading/trailing spaces
        return table

def append_table_to_readme(csv_file, readme_file):
    with open(readme_file, 'a') as readme:
        readme.write(f"\n\n## {os.path.basename(csv_file)}\n\n")
        markdown_table = csv_to_markdown_table(csv_file)
        for row in markdown_table:
            readme.write(row + '\n')

# CSV file path
csv_file = r'C:\Users\VToml\Jupter-Lab\Portfolio_Project\SakilaSQL\Canada_Customers.csv'

# README file path
readme_file = r'C:\Users\VToml\Jupter-Lab\Portfolio_Project\README.md'

# Append the table to the README file
append_table_to_readme(csv_file, readme_file)

