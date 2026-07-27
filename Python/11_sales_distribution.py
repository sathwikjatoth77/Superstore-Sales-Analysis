from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)
print(df.shape)
print(df.head())

plt.figure(figsize=(8,5))
plt.hist(df["Sales"], bins=30)

plt.title("Distribution of Sales")
plt.xlabel("Sales")
plt.ylabel("Frequency")

plt.show()