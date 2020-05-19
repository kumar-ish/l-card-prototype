from bs4 import BeautifulSoup, SoupStrainer
import requests
import json

data = {"retail": [], "food": [], "nightlife": [], "lifestyle": []}

def getsoup(link):
    if link[0] != "/":
        link = "/" + link
    webpage = requests.get("https://www.thelcard.com"+link,
                        headers = {'User-agent': 'your bot 0.1'}).content
    return BeautifulSoup(webpage, "html.parser")

def getblockcontent(soup):
    divs = []
    for div in soup.find_all("div", {"class": "sqs-block-content"}):
        childname = div.find("p")
        if childname:
            divs.append(div)
    return divs

def adddata(div):
    data = {"address": None, "description": None, "deal": None, "business": None}

    title = div.find("p")
    if title.find("strong"):
        data["title"] = title.find("strong").string
    else:
        data["title"] = title.string

    data["img"] = div.find("img")["src"]

    link = div.find("a")["href"]
    soup = getsoup(link)

    blockcontent = getblockcontent(soup)
    if not blockcontent:
        return data
    blockcontent = blockcontent[0]

    addresses = []

    for address in blockcontent.find_all("p", {"style":"text-align:center;white-space:pre-wrap;"}):
        if address.find("em"):
            continue
        if not address.string:
            addresses.append(blockcontent.find("strong").string)
            continue
        addresses.append(address.string.replace(u'\xa0', u' '))

    data["address"] = addresses



    description = blockcontent.find("em")
    if description:
        data["description"] = description.string
    else:
        data["description"] = description


    deals = []


    for deal in blockcontent.find_all("p", {"style": "white-space:pre-wrap;"}):
        if not deal.find("em"):
            if deal.string:
                deals.append(deal.string)
    if not deals:
        for deal in blockcontent.find_all("p")[-1].childGenerator():
            for d in str(deal).split("<br/>"):
                if d:
                    deals.append(d)

#    for i in range(len(deals)):
#        deals[i] = deals[i].replace("$", "\$")
#
    data["deal"] = deals
    print(data["deal"])




#    data["deal"] = blockcontent.find_all("p")[-1].string



    linkbutton = 'Go to Business'
    data["business"] = soup.find("a", string=[linkbutton.upper(), linkbutton.lower(), linkbutton])["href"]
    print(data["title"])
    return data
#
#
#divs = getblockcontent(getsoup("lifestyle"))
#for div in divs:
#    data["lifestyle"].append(adddata(div))


for d in data:
    divs = getblockcontent(getsoup(d))
    for div in divs:
        data[d].append(adddata(div))

with open("data_file.json", "w+") as write_file:
    json.dump(data, write_file, indent = 4)