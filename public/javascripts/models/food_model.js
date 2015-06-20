
var app = app || {};

//===============================================
//				FOOD MODEL & COLLECTION
//===============================================

app.FoodModel = Backbone.Model.extend();
app.FoodCollection = Backbone.Collection.extend({
	url: '/api/foods',
	model: app.FoodModel
});


