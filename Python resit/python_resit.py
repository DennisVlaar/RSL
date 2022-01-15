# Reading the csv file
import csv
with open('userReviews.csv', 'r', encoding= 'utf-8-sig') as userReviews:
    csv_reader = csv.reader(userReviews, delimiter=';')
    next(csv_reader, None)

# Some variables that are needed later in the for loop
    authorlist = []
    count = 0
    avg = 0
    sum = 0
    reviewer = []
    moviename = []
    score = []


# Looking for all reviews on baby driver, counting their rating and counting how many ratings there are given.
    for i in csv_reader:
        if (i[0]) == 'baby-driver':
            sum+=float(i[1])
            count = count+1
            authorlist.append(i[2])

        
# Calculating average rating, and printing this out. Togheter with my own rating of the movie.
    avg = sum/count
    print ("The average score of the baby driver is:" , avg)
    print("Personally I would give this movie a 7, I really liked it and don't understand the low score")
   
# Again reading in the csv file and making 2 empty lists, these will be used in the for loop underneath.
with open('userReviews.csv', 'r', encoding= 'utf-8-sig') as userReviews:
    filelist = []
    recomendations = []
    csv_reader = csv.reader(userReviews, delimiter=';')

# For loop which looks at other reviews from reviewers that have reviewed baby driver. If review is above average rating of baby driver it will take the movie and the rating given by the reviewer.
    for i in csv_reader:
        if (i[2]) in authorlist and float(i[1]) > float(avg):
            filelist.extend([i[0], i[1], i[2]])
            recomendations.extend([filelist])

            print("Reviewer: " + i[2] + ", Moviename: " + str(i[0]) + ", Score: " + str(i[1]))
            
            filelist = []


# Exporting the output into a csv file. 
fieldnames = [['Moviename', 'Userscore', 'Author']]         
file = open('recomendations_based_on_userReviews.csv', 'w+', newline = '')
with file:
    write = csv.writer(file)
    write.writerow(fieldnames)
    write.writerow(recomendations)


# Printing this again, so that you can see it in the terminal.
print ("The average score of the baby driver is:" , avg)
print("Personally I would give this movie a 7, I really liked it and don't understand the low score")

