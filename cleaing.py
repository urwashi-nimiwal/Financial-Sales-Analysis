import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("Financial_Sample.csv")
df.head(200)
print(df.head(200))

# print null value if exists otherwise print 0 
print(df.isnull().sum())
# it is using for reoving duplicate values 
df.drop_duplicates(inplace=True)
# this is useed for removing space b/w the column names
df.columns = df.columns.str.strip()
# it prints tha columns name 
print(df.columns)
# it prints the information about dataframe 
print(df.info())

# it remove the extra space betwwn the col.
currency_columns = [
    "Manufacturing Price",
    "Sale Price",
    "Gross Sales",
    "Discounts",
    "Sales",
    "COGS",
    "Profit"
]

for col in currency_columns:
    df[col] = (
        df[col]
        .astype(str)
        .str.replace("$", "", regex=False)
        .str.replace(",", "", regex=False)
        .str.replace("(", "-", regex=False)
        .str.replace(")", "", regex=False)
        .replace("-", np.nan)
    )

    df[col] = pd.to_numeric(df[col], errors="coerce")


# Save the cleaned data to a new CSV file.
# index=False avoids writing the DataFrame index as a separate column.
cleaned_path = "Financial_Sample_cleaned.csv"
df.to_csv(cleaned_path, index=False)
print(f"Saved cleaned data to {cleaned_path}")

# it gievs th sum of the profit 
print(df["Profit"].sum())
print(df["Profit"].dtype)

#  it print only unique values of the column
print(df["Discount Band"].unique())

# it checks that negative values are present in the profit
print(df[df["Profit"] < 0])

# it gives the summary of the data
print(df.describe())

print(df.dtypes)