from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)
category_sales = df.groupby("Category")["Sales"].sum().sort_values(ascending=False)

category_sales.plot(
    kind="bar",
    figsize=(8,5),
    width=0.6
)

plt.title("Total Sales by Category", fontsize=16)
plt.xlabel("Category", fontsize=12)
plt.ylabel("Sales", fontsize=12)

plt.xticks(rotation=0)

plt.grid(axis="y", linestyle="--", alpha=0.5)

plt.tight_layout()

plt.show()