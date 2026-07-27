from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

CSV_PATH = Path(__file__).parent / "cleaned_superstore.csv"

df = pd.read_csv(CSV_PATH)
ship_mode = df.groupby("Ship Mode")["Sales"].sum().sort_values(ascending=False)

ship_mode.plot(kind="bar", figsize=(8,5))

plt.title("Sales by Shipping Mode")
plt.xlabel("Ship Mode")
plt.ylabel("Total Sales")
plt.grid(axis="y", linestyle="--", alpha=0.5)

plt.tight_layout()
plt.show()