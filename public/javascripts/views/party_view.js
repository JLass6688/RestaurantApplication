
var app = app || {};


//===============================================
//				PARTY VIEW
//===============================================

var partyTemplate = $('#party-template').html();

app.PartyView = Backbone.View.extend({
	tagName: 'div',
	className: 'party',
	template: _.template(partyTemplate),
	initialize: function(){
		console.log("New Party!");
		this.listenTo(this.model, "change", this.render);
	},
	events: {
		'click .view-orders': 'toggle',
		'click .add-order': 'addOrder'
	},
	render: function(){
		var data = this.model.attributes;
		var isPaid;
		if (this.model.get("paid")) {
			isPaid = "Paid";
		} else {
			isPaid = "Unpaid";
		}
		data.isPaid = isPaid;
		var tpl = this.template(data);
		this.showOrders();
		this.$el.html(tpl);
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
		// 
		this.showOrders();
		var id = this.model.id;
		var foodList = $('.orderList' + id);
		$(foodList).slideToggle("slow");
	},
	addOrder: function(){
		$('#auth-menu-container').toggle();
		$('.party-selected').removeClass('party-selected');
	    this.$el.addClass('party-selected');
		app.partySelection = this.model;
	}
});









