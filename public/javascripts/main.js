console.log("...Main.js Loaded...");


//NAMESPACE

var app = {};


//===============================================
//				FOOD MODEL
//===============================================

app.FoodModel = Backbone.Model.extend();


app.FoodCollection = Backbone.Collection.extend({
	url: '/api/foods',
	model: app.FoodModel
});


template = $('#food-template').html();

app.FoodView = Backbone.View.extend({
	tagName: 'div',
	className: 'food-item',
	template: _.template(template),
	initialize: function(){
		console.log("New Model!")
		this.listenTo(this.model, "change", this.render);
	},
	render: function(){
		var data = this.model.attributes;
		var tpl = this.template(data);
		this.$el.html(tpl);
		$('body').append(this.$el);
	}
});


app.FoodListView = Backbone.View.extend({
	initialize: function(){
		console.log("New Collection!");
		this.listenTo(this.collection, "add", this.render);
	},
	render: function(){
		this.$el.empty();

		var models = this.collection.models;

		for(var i = 0; i < models.length; i++){
			var modelView = new app.FoodView({model: models[i]});
			modelView.render();
			this.$el.append(modelView.$el);
		}

	}
});


var foodCollection = new app.FoodCollection();
var foodListView;

$(document).ready(function(){

	//LOGIN PAGE HIDE SIGN UP MENU
	$('#sign-up-click').click(function(evt){
		evt.preventDefault();
	})

  foodListView = new app.FoodListView({
    collection: foodCollection,
    el: $('#food-container')
  });

  foodCollection.fetch();

});






