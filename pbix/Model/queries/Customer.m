let
    Source = Csv.Document(Web.Contents(HttpSource & "Customer.csv"),[Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"CustomerKey", Int64.Type}, {"Customer ID", type text}, {"Customer", type text}, {"City", type text}, {"State-Province", type text}, {"Country-Region", type text}, {"Postal Code", type text}}),
    #"Umbenannte Spalten" = Table.RenameColumns(#"Changed Type",{{"Postal Code", "ZIP"}})
in
    #"Umbenannte Spalten"