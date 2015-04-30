
var app = app || {};


//===============================================
//				Menu Food View
//===============================================

var foodTemplate = $('#food-template').html();
var authFoodTemplate = $('#auth-food-template').html();



app.FoodView = Backbone.View.extend({
	tagName: 'div',
	className: 'menuItem',
	template: _.template(foodTemplate),
	events: {
		'click .delete-food': 'deleteFood'
	},
	initialize: function(){
		this.listenTo(this.model, "change", this.render);
	},
	render: function(){
		var data = this.model.attributes;
		var tpl = this.template(data);
		this.$el.append(tpl);
	},
	deleteFood: function(){

		var id = this.model.get('id');

		$.ajax({
			method: 'delete',
			url: '/api/foods/' + id,
			success: function(){
				console.log("you rock!");
				foodCollection.fetch({reset: true});
			}

		});

	}
});


//===============================================
//				Select Food View
//===============================================

app.AuthFoodView = Backbone.View.extend({
	tagName: 'div',
	className: 'foodItem',
	template: _.template(authFoodTemplate),
	events: {
		'click .select-food': 'selectFood',
		'click .finalize-order': 'finalizeOrder'
	},
	initialize: function(){
		this.listenTo(this.model, "change", this.render);
	},
	render: function(){
		var data = this.model.attributes;
		var tpl = this.template(data);
		this.$el.append(tpl);
	},
	selectFood: function(){
	    $('.food-selected').removeClass('food-selected');
	    this.$el.addClass('food-selected');
	    app.foodSelection = this.model;
	},
	finalizeOrder: function(){
		console.log("hello");
		var partyId = app.partySelection.get('id');
		var foodId = app.foodSelection.get('id');

		$.ajax({
			method: 'post',
			url: '/api/orders',
			data: { order: { party_id: partyId, food_id: foodId } },
			success: function(){
				app.partyCollection.fetch({reset: true});
				$('.food-selected').removeClass('food-selected');
				$('.party-selected').removeClass('party-selected');
			}
		});
		$('#auth-menu-container').hide();
	}
});