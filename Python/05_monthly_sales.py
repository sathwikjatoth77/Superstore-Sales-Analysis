from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)

df["Order Date"] = pd.to_datetime(df["Order Date"], dayfirst=True)

monthly_sales = df.groupby(df["Order Date"].dt.to_period("M"))["Sales"].sum()

monthly_sales.index = monthly_sales.index.astype(str)

monthly_sales.plot(
    kind="line",
    marker="o",
    figsize=(12,5)
)

plt.title("Monthly Sales Trend", fontsize=16)
plt.xlabel("Month")
plt.ylabel("Total Sales")
plt.xticks(rotation=45)
plt.grid(True)

plt.tight_layout()
plt.show()