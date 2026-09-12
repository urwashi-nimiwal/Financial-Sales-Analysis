# Financial Sales Analysis: From Raw Data to Dashboard

**Tools used:** Python (pandas, NumPy) → MySQL → Power BI

## The Problem

I was handed a raw financial sales dataset — the kind of file every analyst actually encounters in the real world, not a pre-cleaned Kaggle dataset. Currency fields had dollar signs and commas baked in. Column headers had stray whitespace. Negative values were written in accounting-style parentheses instead of minus signs. Before any analysis could happen, the data needed to be trustworthy.

The goal: turn this messy dataset into a dashboard that could tell leadership where sales and profit were healthy — and where they weren't.

## Step 1: Cleaning the data (Python)

Using pandas, I:

- Checked for and removed duplicate rows
- Stripped whitespace from column names
- Converted currency columns (Sales, Profit, COGS, Discounts, etc.) from text to numeric by removing `$`, `,`, and converting `(123)` style negatives into `-123`
- Verified null values and data types before and after cleaning
- Exported the cleaned dataset to a new CSV for downstream use

This step mattered more than it might look — a single `$` character left in a "numeric" column would have silently broken every SQL aggregation and Power BI visual downstream.

## Step 2: Exploratory analysis (SQL)

With clean data loaded into MySQL, I ran structured queries to validate the numbers before ever opening Power BI:

- Total sales, total profit, average profit, total units sold
- Country-wise and product-wise breakdowns
- Segment-wise performance
- Monthly sales trend
- Top 5 most profitable products
- A filtered query isolating loss-making transactions

Running this in SQL first — before building any visuals — meant that by the time I opened Power BI, I already knew roughly what the dashboard *should* show. That made it much easier to catch a broken visual or a wrong aggregation later.

## Step 3: Building the dashboard (Power BI)

The final dashboard brings these numbers together interactively: total sales, profit, and units sold up top, with drill-downs by product, country, and segment, plus a monthly trend line and a country-level summary table.

## What the Data Actually Says

**1. Sales are trending downward.**
The monthly trend line shows a steady decline across the year rather than a flat or seasonal pattern — the single most important flag in the whole dashboard, and something a "total sales" number alone would never reveal.

**2. Government is carrying the business.**
The Government segment accounts for **65% of total profit** (11.39M of 16.89M) — dramatically outweighing Small Business, Channel Partners, Midmarket, and Enterprise combined. That's a concentration risk: if that relationship weakens, profit takes an outsized hit.

**3. Revenue and profit don't move together by country.**
The US leads in raw sales (25.03M) but converts that into comparatively thin profit (2.996M). France, with slightly lower sales (23.99M), generates the **highest profit** of any country (3.78M). Margin, not revenue, is the real signal — and it's invisible unless you compare the two charts side by side.

**4. One product is doing the heavy lifting.**
VTT is the clear profit leader, with a steady drop-off across Paseo, Amarilla, Montana, and Carretera — another single point of dependency worth flagging.

## The Takeaway

> The business looks healthy on the surface — 117.87M in sales and a 14.3% margin — but that health rests on a narrow base: one segment (Government), one product (VTT), and inconsistent profitability across countries. Sales are also trending down. None of that is visible from the top-line KPIs alone; it only shows up once you cross-reference the charts against each other.

That last insight — connecting the country chart to the segment chart to the trend line — is the actual "analysis" part of data analysis. Anyone can build a bar chart. Spotting the story that spans multiple charts is what makes it useful to a business.
