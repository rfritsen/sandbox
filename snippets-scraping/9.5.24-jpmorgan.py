# Perplexity.ai prompt:
# write a web scraper that pulls job postings from 
# https://jpmc.fa.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1002/requisitions?location=New+York%2C+NY%2C+United+States&locationId=300000020694566&locationLevel=city&mode=location&radius=25&radiusUnit=MI

# Run in terminal as: python 9.5.24-jpmorgan.py
# Returns with 

import requests
from bs4 import BeautifulSoup
import json

def scrape_jpmc_jobs():
    url = "https://jpmc.fa.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1002/requisitions"
    params = {
    #     "location": "New York, NY, United States",
    #     "locationId": "300000020694566",
    #     "locationLevel": "city",
    #     "mode": "location",
    #     "radius": "25",
    #     "radiusUnit": "MI"
    }

    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    }

    response = requests.get(url, params=params, headers=headers)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Find the script tag containing job data
    # script_tag = soup.find('script', id='jobsState')
    script_tag = soup.find('class=job-grid-item_link')
    # script_tag = soup.find_all(id='210485334')
    # script_tag = soup.find('div')
    if script_tag:
        print("The jobs are here", script_tag)
    #     job_data = json.loads(script_tag.string)
    #     jobs = job_data.get('requisitionList', [])

    #     for job in jobs:
    #         title = job.get('Title', 'N/A')
    #         job_id = job.get('Id', 'N/A')
    #         location = job.get('PrimaryLocation', 'N/A')
    #         print(f"Job Title: {title}")
    #         print(f"Job ID: {job_id}")
    #         print(f"Location: {location}")
    #         print("---")
    else:
        print("No job data found on the page.")

if __name__ == "__main__":
    scrape_jpmc_jobs()