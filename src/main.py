import requests
from bs4 import BeautifulSoup as soup

URL = "https://wol.jw.org/en/wol/h/r1/lp-e"
page = requests.get(URL)

soup = soup(page.content, "html.parser")
results_date = soup.find(id="p77")
results_text = soup.find(id="p78")
results_text1 = soup.find(id="p79")
results_date = results_date.get_text()
results_text = results_text.get_text()
results_text1 = results_text1.get_text()
print(str(results_date).strip())
print(str(results_text).strip() + "\n")
print(str(results_text1).strip())