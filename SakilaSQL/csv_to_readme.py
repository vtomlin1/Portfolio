import csv

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
readme_file = 'README.md'

# Call the function to append tables to the README file
append_tables_to_readme(csv_files, readme_file)
