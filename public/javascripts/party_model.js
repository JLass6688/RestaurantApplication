console.log("...Main.js Loaded...");


//NAMESPACE

var app = app || {};


//===============================================
//				PARTY MODEL
//===============================================

app.PartyModel = Backbone.Model.extend();


app.PartyCollection = Backbone.Collection.extend({
	url: '/api/parties',
	model: app.PartyModel
});




//===============================================
//				PARTY VIEW
//===============================================

template = $('#party-template').html();

app.PartyView = Backbone.View.extend({
	tagName: 'div',
	className: 'party',
	template: _.template(template),
	initialize: function(){
		console.log("New Party!")
		this.listenTo(this.model, "change", this.render);
	},
	events: {
		'click .view-orders': 'toggle'
	},
	render: function(){
		var data = this.model.attributes;
		var tpl = this.template(data);
		this.$el.html(tpl);
		$('body').append(this.$el);
	},
	showOrders: function(){
		var id = this.model.id;
		console.log(id);
		var foodList = $('.orderList' + id);
		$(foodList).empty();
		var foods = this.model.get('foods');
		for(var i = 0; i < foods.length; i++){
			var food = foods[i];

			var foodName = food.name;
			var price = food.cents;

			var foodItem = $('<li>').text(foodName + "    -     " +  price);

			$(foodList).prepend(foodItem);
		};
	},
	toggle: function(evt){
		evt.preventDefault();
		this.showOrders();
		var id = this.model.id;
		var foodList = $('.orderList' + id);
		$(foodList).slideToggle("slow");


	}
});


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







