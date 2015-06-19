##Servus (POS Application)

#####Servus is a fully functional POS application that allows for servers to organize and track their orders.
![Screen Shot](/screenshot.png)

### Table of Contents  
#####[Features](#features) 
#####[Technologies](#technology) 
#####[ERD Diagram](#erd) 
#####[Upcoming Features](#newfeatures) 




<a name="features"/>
###Key Features

1) *Table Tracking*
	- Allows for servers to create and track table information, such as table number and number of guests. The Servus Interface also allows for quick and easy access to order history for each table.

![Screen Shot](/screenshot2.png)


2) *Order Selection*
	- Allows for servers add orders to specific tables by first selecting the table, and then selecting the food item. Selected food item will be highlighted in green for quick recognition. 

![Screen Shot](/screenshot3.png)


3) *Customizable Menu*
	- The customizable menu allows managers to quickly update the menu that servers will have access to. Food items that are no longer on the menu may be deleted.

![Screen Shot](/screenshot4.png)


4) *Adding Menu Items*
	- Managers can add new food items to the menu, through entering the necessary information, including price, name, type of cuisine, and any allergens the food may contain.

![Screen Shot](/screenshot5.png)




<a name="technology"/>
###Technologies

#####Front End
1) Backbone.js
	a) Allows for dynamic rendering of tables and menu items.
	b) AJAX calls that allow our users to add, delete, and access food itmes, tables, and orders from our database.
	c) Seperation of concerns, allowing clean organization of models, views, and controllers.

2) Underscore.js
	a) Used to create organized templates to be accessed by my Backbone views for data rendering.

3) JQuery.js
	a) Used for manipulation of DOM elements.
	b) Also used as a requirement for Backbone.js. 


#####Back End
1) Sinatra (Ruby)

2) PostgreSQL
	a) Used to create my data tables to store User information, food items, party information, and orders.




<a name="erd"/>
###ERD Diagram
![Screen Shot](/erd.jpg)




<a name="newfeatures"/>
###Upcoming Features
#####A few of the upcoming features I have planned for Servus:
1) Ability to allow managers to sort the menu by cuisine type and cost. 
2) Allow servers to select multiple food items when creating an order for a party.
3) Create a secondary view that allows servers to see all of their tables in grid view.
4) Give the server the ability to access and print receipts for parties. 

 

