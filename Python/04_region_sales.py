import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)

region_sales = df.groupby("Region")["Sales"].sum().sort_values(ascending=False)

plt.figure(figsize=(8,5))
region_sales.plot(kind="bar")

plt.title("Total Sales by Region")
plt.xlabel("Region")
plt.ylabel("Sales")

plt.tight_layout()
plt.show()

print("Done")