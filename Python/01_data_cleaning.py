from pathlib import Path
import pandas as pd

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"


df = pd.read_csv(CSV_PATH)
print("Dataset Shape:")
print(df.shape)

print("\nFirst 5 Rows:")
print(df.head())

print("\nColumns:")
print(df.columns)

print("\nDataset Info:")
print(df.info())

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

df["Order Date"] = pd.to_datetime(df["Order Date"], format="%d/%m/%Y")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], format="%d/%m/%Y")

print("\nDates Converted Successfully!")

df["Shipping Days"] = (df["Ship Date"] - df["Order Date"]).dt.days
df["Month"] = df["Order Date"].dt.month_name()
df["Year"] = df["Order Date"].dt.year
df["Quarter"] = df["Order Date"].dt.quarter

print(df[["Order Date", "Ship Date", "Shipping Days", "Month", "Year", "Quarter"]].head())

print(df.describe())

df.to_csv("cleaned_superstore.csv", index=False)

print("Cleaned dataset saved successfully.")

