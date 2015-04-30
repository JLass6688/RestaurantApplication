

var app = app || {};


//===============================================
//				PARTY MODEL
//===============================================

app.PartyModel = Backbone.Model.extend();


app.PartyCollection = Backbone.Collection.extend({
	url: '/api/parties',
	model: app.PartyModel
});







