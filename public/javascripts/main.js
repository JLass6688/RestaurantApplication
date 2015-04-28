console.log("...Main.js Loaded...");


//NAMESPACE

var app = {};


//===============================================
//				FOOD MODEL
//===============================================

app.PartyModel = Backbone.Model.extend();


app.PartyCollection = Backbone.Collection.extend({
	url: '/api/parties',
	model: app.PartyModel
});


template = $('#party-template').html();

app.PartyView = Backbone.View.extend({
	tagName: 'div',
	className: 'party',
	template: _.template(template),
	initialize: function(){
		console.log("New Party!")
		this.listenTo(this.model, "change", this.render);
	},
	render: function(){
		var data = this.model.attributes;
		var tpl = this.template(data);
		this.$el.html(tpl);
		$('body').append(this.$el);
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







