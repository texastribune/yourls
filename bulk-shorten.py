import requests
import csv

api_url = ""
user = ""
password = ""

all = list()

with open("input.csv") as csvfile:
    reader = csv.reader(csvfile)
    next(reader, None)
    for row in reader:
        title = row[3]
        url = row[6]

        payload = {
            "url": url,
            "format": "json",
            "title": title,
            "action": "shorturl",
            "username": user,
            "password": password,
        }

        response = requests.post(api_url, data=payload)

        if response.status_code != 200:
            print("error")
            print(url)
            continue

        response = response.json()
        if response["status"] != "success":
            print("error")
            print(url)
            continue
        shorturl = response["shorturl"]
        all.append({"email": title, "long url": url, "short url": shorturl})
        print(shorturl)

with open("output.csv", mode="w") as outfile:
    fieldnames = ["email", "long url", "short url"]
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(all)
