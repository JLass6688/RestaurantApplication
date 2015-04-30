
var app = app || {};


//===============================================
//				FOOD MODEL
//===============================================

app.FoodModel = Backbone.Model.extend();

app.FoodCollection = Backbone.Collection.extend({
	url: '/api/foods',
	model: app.FoodModel
});


