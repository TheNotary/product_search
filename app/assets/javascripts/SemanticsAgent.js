class SemanticsAgent {
  static search_onClick() {
    var text = $('#query').val();
    this.requestProductSearch(text);
  }

  static requestProductSearch(text) {
    var url = "/semantics_api/search";
    var data = { query: text };

    var self = this;

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: self.reportProductSearchResults,
    });
  }

  static reportProductSearchResults(resp) {
    var rows = resp.rows;

    var markupString = "<table>";
    markupString += "<th>Name</th><th>model</th><th>Price</th>";
    $.each(rows, function( i, row ) {
      markupString += "<tr>";

      $.each(row, function( i, data ) {
        markupString += "<td>" + data + "</td>";
      });

      markupString += "</tr>";
    });
    markupString += "</table>";

    $('#display').html(markupString);
  }

  static warmCache() {
    var url = "/semantics_api/warm_cache";
    var data = {  };

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: reportCorrection,
    });
  }
}
