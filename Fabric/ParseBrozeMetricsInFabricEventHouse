
// One time, move BrozeMetrics to the correct folder
.alter table BronzeMetrics folder "Bronze"

.execute database script with (ContinueOnErrors = true) <|
.drop materialized-view GoldMetrics
.execute database script with (ContinueOnErrors = false) <|
.drop table SilverMetrics ifexists 
.create-or-alter function with (folder="Bronze") Parse_BronzeMetrics() 
{
    BronzeMetrics
    //| take 1
    | evaluate bag_unpack(Data)
    | evaluate bag_unpack(data)
    | evaluate bag_unpack(context)
    | extend keys = bag_keys(measurement)
    | mv-expand key = keys
    | extend metric = tostring(key)
    | extend value = todouble(measurement[metric])
    | extend measurandId = strcat(sensorId, '_', metric)
    | project measurandId, sensorId, metric, timestamp, value
}
//
.set-or-append SilverMetrics with (folder ="Silver") <| Parse_BronzeMetrics | where 1==2
//
.alter table SilverMetrics policy update
```
[
    {
        "IsEnabled": true,
        "Source": "BronzeMetrics",
        "Query": "Parse_BronzeMetrics",
        "IsTransactional": true,
    }
]
```
//
//
// Optinal oad historical data
.set-or-append async SilverMetrics with (folder ="Silver") <| Parse_BronzeMetrics
//
//
//

.create materialized-view with (folder = "Gold", backfill = true) GoldMetrics 
        on table SilverMetrics
{
    SilverMetrics
    | extend ingestion_time = ingestion_time()
    | summarize arg_max(ingestion_time, *) by measurandId, timestamp
}
// done

