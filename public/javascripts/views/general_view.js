
var app = app || {};



//===============================================
//				Add Order Food List View
//===============================================
app.AuthFoodListView = Backbone.View.extend({
	initialize: function(){
		console.log("New Collection!");
		this.listenTo(this.collection, "sync", this.render);
	},
	events: {
		'click .close-button' : 'hide'
	},
	render: function(){
		this.$el.empty();

		var models = this.collection.models;
		var close = $('<span>').text('X');
		$(close).addClass('close-button');
		this.$el.append(close);

		for(var i = 0; i < models.length; i++){
			var modelView = new app.AuthFoodView({model: models[i]});
			modelView.render();
			this.$el.append(modelView.$el);
		}
	},
	hide: function() {
		$('#auth-menu-container').hide();
		$('.party-selected').removeClass('party-selected');
	}
});


//===============================================
//				Menu Food List View
//===============================================
app.FoodListView = Backbone.View.extend({
	initialize: function(){
		console.log("New Collection!");
		this.listenTo(this.collection, "sync", this.render);
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



//===============================================
//				Party List View
//===============================================

app.PartyListView = Backbone.View.extend({
	initialize: function(){
		console.log("New Collection!");
		this.listenTo(this.collection, "sync", this.render);
	},
	render: function(){
		this.$el.empty();

		var models = this.collection.models;

		for(var i = 0; i < models.length; i++){
			var modelView = new app.PartyView({model: models[i]});
			modelView.render();
			this.$el.append(modelView.$el);
		}
	}
});