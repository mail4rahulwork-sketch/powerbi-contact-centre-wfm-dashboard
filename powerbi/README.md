# Power BI version

This folder is the Power BI side of the project. The report itself lives in the Power BI service, and everything needed to rebuild it is saved here, so the work doesn't depend on any one Power BI account.

**Report:** Contact Centre Service Performance, by Rahul. Two pages:

- **Overview:** nine KPI tiles (service level, abandon, forecast accuracy, AHT, staffing gap, shrinkage vs plan, adherence, CSAT, days SL met), service level vs target by day, contacts offered vs forecast, weekly shrinkage, FTE needed vs FTE that showed up, and a table by queue. Filters for period and queue.
- **Intraday:** average contacts per hour by queue, and a weekday by hour heatmap showing the busiest slots.

## How it's wired

The model reads the two CSVs in `/data` straight from this repo with an anonymous web connection. Update a CSV on GitHub, hit refresh in Power BI, and the report picks it up. No gateway, no login, no company data.

| File | What it is |
|---|---|
| `DailyQueue.pq` | Power Query for the daily queue table |
| `IntradayProfile.pq` | Power Query for the hourly profile table |
| `model.tmdl` | Calendar table, all KPI measures (DAX), the date relationship and column settings |

## Rebuild it in 5 minutes

1. In Power BI (web or Desktop), create a semantic model with two blank queries. Paste in `DailyQueue.pq` and `IntradayProfile.pq`, name them the same, choose **Anonymous** when asked, and load.
2. Open **TMDL view**, paste `model.tmdl`, click **Apply**, then refresh.
3. Build the visuals from the `KPIs` measure folder. The measure names match the tiles above.

## Numbers it should show

| | Business as usual | Festive peak (15 to 25 Oct) | All |
|---|---:|---:|---:|
| Service level | 82.3% | 54.5% | 79.2% |
| Abandon | 3.5% | 8.8% | 4.1% |
| Forecast accuracy | 95.3% | 85.5% | 94.2% |
| AHT | 417 s | 440 s | 420 s |
| Days SL met | 56% | 0% | 51% |

If your rebuild shows these, the measures are right.

---
Built by Rahul, Business Analyst. [LinkedIn](https://www.linkedin.com/in/rahul-219543159/) · [GitHub](https://github.com/mail4rahulwork-sketch)
