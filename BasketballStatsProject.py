
# Abayomi Olorunfemi


"""The following program reads in a csv file containing basketball statistics
of the 25 best players in each conference. It then calculates certain statistics
and presents visual representations of player's statistics through graphs"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys


def read_file(filename):
    """Reads in csv file and returns that file as a dataframe"""
    # contents in csv file come from: http://stats.nba.com/
    df = pd.read_csv(filename)
    return df


def subset(df):
    """Subsets csv file to only focus on Player Name, returns that dataframe"""
    df2 = df.set_index("Player Name")
    return df2


def comparison_player(df2):
    """Takes in subset dataframe, compares a specific statistic between two
    players which are entered via user input, returns respective comparison"""
    try:
        player_name = input("Enter the first player's name for comparison: ")
        player_name1 = input("Enter the second player's name for comparison: ")
        category_type = input("Enter Points, Rebounds, Assists, Steals, "
                              "Blocks: ")
        x = df2.loc[player_name, category_type]
        y = df2.loc[player_name1, category_type]
        print (x, "vs", y)
    except:
        print("Invalid input! Please try again")


def comparison_player_graph(df2):
    """Takes in subset dataframe, accomplishes same thing in comparison_player
    but creates a graphical representation of statistical comparison, returns
    the graph"""

    #Graphing code based off https://pythonspot.com/matplotlib-bar-chart/
    try:
        player_name = input("Enter the first player's name for comparison: ")
        player_name1 = input("Enter the second player's name for comparison: ")
        category_type = input("Enter Points, Rebounds, Assists, Steals, "
                              "Blocks: ")
        n_groups = 1
        playerone_stats = df2.loc[player_name, category_type]
        playertwo_stats = df2.loc[player_name1, category_type]

        fig, ax = plt.subplots()
        index = np.arange(n_groups)
        bar_width = 0.35
        opacity = 0.8

        rects1 = plt.bar(index, playerone_stats, bar_width,
                         alpha=opacity,
                         color='b',
                         label=player_name)
        rects2 = plt.bar(index + bar_width, playertwo_stats, bar_width,
                         alpha=opacity,
                         color='g',
                         label=player_name1)

        plt.xlabel('Person')
        plt.ylabel('Number of ' + category_type)
        plt.title(category_type + " by person")
        plt.xticks(index + bar_width, ('A'))
        plt.legend()
        plt.tight_layout()
        plt.show()
    except:
        print("Invalid input! Please try again")


def player_graph(df2):
    """Takes in subset dataframe, graphs all general statistics of a player
      that is entered by the user, returns the graph"""
    #Graphing code based off https://pythonspot.com/matplotlib-bar-chart/
    try:
        user_input = input("Enter a player: ")
        performance = [df2.loc[user_input, "Points"],
                       df2.loc[user_input, "Assists"],
                       df2.loc[user_input, "Rebounds"],
                       df2.loc[user_input, "Steals"],
                       df2.loc[user_input, "Blocks"]]
        objects = ["Points", "Assists", "Rebounds", "Steals", "Blocks"]
        y_pos = np.arange(len(objects))
        plt.bar(y_pos, performance, align='center', alpha=0.5)
        plt.xticks(y_pos, objects)
        plt.title(user_input + "'s Statistics")
        plt.show()
    except:
        print("Invalid input! Please try again")


def diff_from_avg_pts(df):
    """Takes in the entire dataframe, calculates the average amount of points
    scored by players in csv file. Creates a new column that shows how far each
    player is above or below the average. Returns entire data frame with new
    column"""
    average_points = df["Points"].mean()
    df["Difference from Average"] = df["Points"] - average_points
    print(df)


def top_players(df):
    """Takes in full dataframe and sorts the category that the user enters in a
    descending format. Returns the top 5 players in that respective category and
    their overall stats"""
    try:
        category = input("Enter Points, Rebounds, Assists, Steals, "
                         "Blocks for the top 5 players in that respective "
                         "category: ")
        top_five = df.sort_values(by=category, ascending=False)
        print(top_five.head(5))
    except:
        print("Invalid input! Please try again")


def get_stats(df2):
    """Takes in subset dataframe and calls BasketballStats (class) to calculate
    a player's efficiency rating and free throw percentage based off user input.
    Returns the efficiency rating and free throw percentage of that respective
    player"""
    player_name = input("Enter a player's name: ")
    bsobj = BasketballStats(df2, player_name)
    eff_rating = bsobj.efficiency_rating()
    freethrowperc = bsobj.freethrow_percentage()
    print(str(player_name) + "'s efficiency rating is " + str(eff_rating))
    print(str(player_name) + "'s free throw percentage is "
          + str(freethrowperc))

class BasketballStats:
    """
    Purpose: To calculate specific statistics of NBA players for users to
    interpret

    Attributes: Points(# of points scored by a player), Rebounds(# of rebounds
    by a player), Assists(# of assists by a player), Steals(# of steals by a
    player, Blocks(# of blocks by a player), FGA(# of field goals attempted by
    player), FGM(# of field goals made by a player), FTA(free throws attempted
    by a player), FTM(free throws made by a player), turnovers(# of turnovers
    committed by a player)

    Methods:
    __init__: declaring objects
    efficiency_rating: calculates efficiency rating of a player
    freethrow_percentage: calculates the free throw percentage of a player
    """
    def __init__(self, dataframe, playername):
        """Initializes all the objects used within class"""
        self.points = dataframe.loc[playername, "Points"]
        self.rebounds = dataframe.loc[playername, "Rebounds"]
        self.assists = dataframe.loc[playername, "Assists"]
        self.steals = dataframe.loc[playername, "Steals"]
        self.blocks = dataframe.loc[playername, "Blocks"]
        self.FGA = dataframe.loc[playername, "FGA"]
        self.FGM = dataframe.loc[playername, "FGM"]
        self.FTA = dataframe.loc[playername, "FTA"]
        self.FTM = dataframe.loc[playername, "FTM"]
        self.FTA = dataframe.loc[playername, "FTA"]
        self.turnovers = dataframe.loc[playername, "TOV"]


    def efficiency_rating(self):
        """Calculates the Efficiency Rating of a player, breaks problem into 4
        parts for ease of understanding and then combines them all in order to
         generate score"""
        # Efficiency formula source:
        # http://www.nba.com/statistics/efficiency.html
        Part1 = (self.points + self.rebounds + self.assists + self.steals
                 + self.blocks)
        Part2 = (self.FGA - self.FGM)
        Part3 = (self.FTA - self.FTM)
        Part4 = (self.turnovers)

        Score =  Part1 - Part4 - Part3 - Part2
        if Score > 0:
            Score = "+" + str(Score)
        else:
            return Score

        return float(Score)


    def freethrow_percentage(self):
        """Calculates the Free Throw Percentage of a player"""
        if self.FTA != 0:
            percentage = round((self.FTM / self.FTA) * 100, 1)
            percentage = str(percentage) + " percent"
        else:
            percentage = str(0) + " percent"
        return percentage


def menu(x, y):
    """Takes in the general dataframe and subset dataframe, creates a menu of
    6 options that allows the user to choose what type of analysis he/she wishes
    to see, respective function is called based on option chosen"""
    while True:
        print("Welcome to Basketball Analytics Central! Please choose an "
              "option")
        print('1. compare 2 players')
        print('2. graph comparison between 2 players')
        print('3. calculate diff from avg points each player is')
        print('4. get top players in a specific category')
        print('5. graph a players stats')
        print('6. calculate efficiency rating  and free throw percentage of a '
              'player')
        selection = input('Enter your choice: ')

        try:
            snum = int(selection)
        except ValueError:
            pass
        else:
            if 1 <= snum <= 6:
                break
    if snum == 1:
        comparison_player(y)
    elif snum == 2:
        comparison_player_graph(y)
    elif snum == 3:
        diff_from_avg_pts(x)
    elif snum == 4:
        top_players(x)
    elif snum == 5:
        player_graph(y)
    else:
        get_stats(y)


def main():
    x = read_file(sys.argv[1])
    y = subset(x)
    while True:
        menu(x, y)
        more_stats = input(
            "Do you want to go back to the menu? Enter yes or no: ")
        if more_stats == "no":
            break

if __name__ == '__main__':
    main()
