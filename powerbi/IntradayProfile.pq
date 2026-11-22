// Power Query (M) for the IntradayProfile table (average contacts per hour by queue and weekday).
let
    Source = Csv.Document(
        Web.Contents("https://raw.githubusercontent.com/mail4rahulwork-sketch/powerbi-contact-centre-wfm-dashboard/main/data/intraday_profile.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Headers = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    Typed = Table.TransformColumnTypes(Headers, {
        {"Queue", type text}, {"Weekday", type text}, {"Weekday_No", Int64.Type},
        {"Hour", Int64.Type}, {"Avg_Offered", Int64.Type}
    }, "en-US")
in
    Typed
