// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var SemanticsAPI = {
  search_onClick: function() {
    var text = $('#query').val();
    this.requestProductSearch(text);
  },

  requestProductSearch: function(text) {
    var url = "/semantics_api/search";
    var data = { query: text };

    var self = this;
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: self.renderProductSearchResult,
    });
  },

  renderProductSearchResult: function(resp){
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
  },

  warmCache: function() {
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
