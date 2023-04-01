import pandas as pd

#Question 1
#Feel free to enter your own data/modify it below
data = {
    'ID': ['4854', '4121', '1388', '7945', '4554'],
    'Name': ['Eren', 'Armin', 'Mikasa', 'Reiner', 'Zeke'],
    'OS': [80, 85, 90, 95, 100],
    'ESP': [75, 80, 85, 90, 95],
    'AIML': [70, 75, 80, 85, 90],
    'DAA': [65, 70, 75, 80, 85],
    'COA': [60, 65, 70, 75, 80],
    'MATH': [55, 60, 65, 70, 75]
}
df = pd.DataFrame(data)
print(df)

#Question 2
df['pc'] = (df['OS'] + df['ESP'] + df['AIML'] + df['DAA'] + df['COA'] + df['MATH'])/6
max = df['pc'].idxmax()

name = df.loc[max, 'Name']
id = df.loc[max, 'ID']

print("Student with Highest Percentage Marks:")
print(id, "\t", name)

#Question 3
mrk = df[['OS', 'ESP', 'AIML', 'DAA', 'COA', 'MATH']]
min = mrk.idxmin()
c = pd.value_counts(min)
res = c[c > 2]

print("Lowest marks in more than two subjects:")
for i in res.index:
    name = df.loc[i, 'Name']
    id = df.loc[i, 'ID']
    print(id, "\t", name)

#Question 4
df.to_csv('marksheet.csv')