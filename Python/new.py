from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent
CSV_PATH = BASE_DIR / "cleaned_superstore.csv"

print(CSV_PATH)
print(CSV_PATH.exists())

df = pd.read_csv(CSV_PATH, nrows=5)
print(df)