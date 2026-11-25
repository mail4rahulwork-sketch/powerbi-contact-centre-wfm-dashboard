// Power Query (M) for the DailyQueue table.
// Reads the CSV straight from this GitHub repo, so the Power BI model has no
// private data source and refreshes with an anonymous connection.
let
    Source = Csv.Document(
        Web.Contents("https://raw.githubusercontent.com/mail4rahulwork-sketch/service-performance-powerbi-analysis/main/data/daily_queue_performance.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Headers = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    Typed = Table.TransformColumnTypes(Headers, {
        {"Date", type date}, {"Queue", type text},
        {"Forecast_Volume", Int64.Type}, {"Offered", Int64.Type}, {"Handled", Int64.Type},
        {"Abandoned", Int64.Type}, {"Answered_Within_SL", Int64.Type},
        {"SL_Target", type number}, {"AHT_Sec", Int64.Type},
        {"Required_FTE", type number}, {"Scheduled_FTE", type number}, {"Actual_FTE", type number},
        {"Planned_Shrinkage", type number}, {"Actual_Shrinkage", type number},
        {"Schedule_Adherence", type number}, {"CSAT", type number}
    }, "en-US")
in
    Typed
