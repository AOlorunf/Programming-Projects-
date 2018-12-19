from BasketballStatsProject import read_file, subset
import pandas as pd

def dataframe1(filename):
    """Function that takes in a csv file (testfile.csv) and also creates a small
    dataframe. Returns both the csv dataframe and the newly created dataframe"""
    testdf = {"Column 1": ["a"], "Column 2": ["b"], "Column 3": ["c"],
              "Player Name": ["Bob"]}
    testdf_table = pd.DataFrame(data=testdf)
    df = pd.read_csv(filename)
    return testdf_table, df

def read_file_test(filename):
    """Function that calls dataframe1() to test read_file(), compares the
    contents of the csv dataframe with the newly created dataframe to see if
    they are equal"""
    testdf_table, df = dataframe1(filename)
    assert df.equals(testdf_table)

def subset_test(filename):
    """Function that calls dataframe1() and tests subset() by comparing the
      subset made in a small csv dataframe to a subset in the handmade dataframe
      to see if they are equal"""
    testdf_table, df = dataframe1(filename)
    col_subset = testdf_table.set_index("Player Name")
    assert subset(df).equals(col_subset)

if __name__ == '__main__':
    read_file_test("Testfile.csv")
    subset_test("Testfile.csv")


