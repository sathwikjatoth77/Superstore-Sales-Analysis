import pandas as pd

df = pd.read_csv("cleaned_superstore.csv")
print(df["Sales"].sum())

print(df.groupby("Category")["Sales"].sum())

print(df.groupby("Region")["Sales"].sum())