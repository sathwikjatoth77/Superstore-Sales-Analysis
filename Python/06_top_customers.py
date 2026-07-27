from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)
top_customers = df.groupby("Customer Name")["Sales"].sum().sort_values(ascending=False).head(10)

top_customers.plot(kind="bar", figsize=(12,5))

plt.title("Top 10 Customers by Sales")
plt.xlabel("Customer")
plt.ylabel("Total Sales")
plt.xticks(rotation=45)
plt.grid(axis="y", linestyle="--", alpha=0.5)

plt.tight_layout()
plt.show()