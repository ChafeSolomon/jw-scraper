import requests
from bs4 import BeautifulSoup as soup

URL = "https://wol.jw.org/en/wol/h/r1/lp-e"
page = requests.get(URL)

id = ["p77", "p78", "p79"]
soup = soup(page.content, "html.parser")

def printtext(pid):
    sep = 0
    for i in pid:
        sep += 1
        results = soup.find(id=i).get_text()
        if sep == 2:
            print(str(results).strip() + "\n")

        else: 
            print(str(results).strip())

printtext(id)