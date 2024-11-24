# -*- coding: utf-8 -*-
"""
Created on Sun Nov 24 17:09:02 2024

@author: 41798
"""

from bs4 import BeautifulSoup
import requests
import csv
import json

url = "https://en.wikipedia.org/wiki/Comma-separated_values"
response = requests.get(url)

soup = BeautifulSoup(response.text, "html.parser")

csv_example = list(soup.find_all("pre"))
csv_final = str(csv_example[10])

#remove html tags
cleaned_data = csv_final.strip("<pre>").strip("</pre>").strip()

lines = cleaned_data.splitlines()  # Split data into lines
csv_reader = csv.DictReader(lines)  # Create a CSV reader for structured data

#prepare data as dictionaries
data = [row for row in csv_reader]

#save data as json
output_file = "table_data.json"
with open(output_file, "w", encoding="utf-8") as json_file:
    json.dump(data, json_file, indent=4)
