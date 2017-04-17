// 家族留学のデータをデータベースに送るscript
// updated_at: 20170417
// edited by: RyutaroFukuma

function send_family_data_Function() {
    var sheet = SpreadsheetApp.openByUrl("スプレッドシートのURL");
    var rows = sheet.getDataRange();
    var numRows = rows.getNumRows();
    var values = rows.getValues();
    for (var i = 2; i <= numRows; i++) {
        var address = sheet.getRange("B"+ i).getValue();

        var data =
            {
                "family":
                    {
                        "address": address
                    }
            };

        var payload = JSON.stringify(data);

        var options =
            {
                "method": "POST",
                "payload": payload,
                "contentType": "application/json",
                "followRedirects": true,
                "muteHttpExceptions": true
            };

        var response = UrlFetchApp.fetch("https://manmasearch.herokuapp.com/locations", options);
        Logger.log(response);


    }
}
