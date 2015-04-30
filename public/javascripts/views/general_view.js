
var app = app || {};

app.GeneralListView = Backbone.View.extend({
	initialize: function(options){
		console.log("New Collection!");
		this.modelView = options.modelView;
		this.listenTo(this.collection, "sync", this.render);
	},
	events: {
		'click .close-button' : 'hidedatshit'
	},
	render: function(){
		this.$el.empty();

		var models = this.collection.models;
		var close = $('<span>').text('X');
		$(close).addClass('close-button');
		this.$el.append(close);

		for(var i = 0; i < models.length; i++){
			var modelView = new this.modelView({model: models[i]});
			modelView.render();
			this.$el.append(modelView.$el);
		}
	},
	hidedatshit: function() {
		$('#auth-menu-container').hide();
	}
});