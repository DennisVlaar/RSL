import csv as csv

with open('UsersReviews.csv', newLine='') as review:
  read = csv.read(review, )
  reviewlist = list(read)
  
  movie = 'american-pie'
  x = []
  y = []
  z = []
  
  for row in reviewlist:
    x.append(row[0].split(';')[2])
    
    print(x)
