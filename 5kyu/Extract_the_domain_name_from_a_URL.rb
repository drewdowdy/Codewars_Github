=begin

=== PROBLEM ===

Write a method that parses out the domain name from a given URL

RULES:
  - Explicit:
    - Input is a URL as a string
  - Implicit:
    - URLs start with 'http' OR 'www'

=== EXAMPLES ===

domain_name("http://google.com") == "google"
domain_name("http://google.co.jp") == "google"
domain_name("www.xakep.ru") == "xakep"
domain_name("https://youtube.com") == "youtube"

=== DATA ===

INPUT: a string representing a URL
INTERMEDIATE: a regex
OUTPUT: a string representing the domain name

=== A ===

EXTRACT the domain name from the URL
  - Use a regex to match the domain name
    - Lookbehind
      - 'http://' OR 'https://' OR 'www.'
    - Account for special characters (underscore, hyphen, etc.)
    - Lookahead
      - ends with first '.'
RETURN the domain name
  - Return the first element of the match data object (it's an array)
    - [0]



=== C ===

- When I try to match a

=end

def domain_name(url)
  url.split(/(https?:\/\/|www\.)/).pop.split(/\..+/)[0]
end

# Refactored

def domain_name(url)
  url.split(/^(https?):\/\/|www\.|\..+$/).pop
end

p domain_name("http://google.com") #== "google"
p domain_name("http://google.co.jp") #== "google"
p domain_name("www.xakep.ru") #== "xakep"
p domain_name("https://youtube.com") #== "youtube"
p domain_name("https://www.codewars.com") #== "codewars"
p domain_name("http://www.codewars.com") #== "codewars"
p domain_name("https://www.google.co.jp") #== "google"
