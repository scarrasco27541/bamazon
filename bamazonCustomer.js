
const inquirer = require('inquirer');
const mysql = require('mysql');

// Display items for sale (query / select all our rows)
var con = mysql.createConnection({	
	host: "localhost",
	port: 3306,
	user: "root",
	password: "UNC1964",
	database: "bamazon"
});
con.connect(function(err) {
	let sql = "SELECT * FROM products";
	if (err) throw err;
	// If we get to this point, we've made a successful connection to the database
	// And that connection is now open and ready to use as 'con'
	con.query(sql, function (err, data) {
		if (err) throw err;
		// If we get THIS far, we've successfully run our query
		// And we have access to a set of results called "data"	
//		console.log(data);
		for (var d in data) {
			console.log(data[d].item_id + ": " + data[d].product_name + " ($"+data[d].price+") -> Quantity: " + data[d].stock_quantity);
		}
		
		inquirer.prompt([
			{
				type: "input",
				name: "user_item_id",
				message: "Enter an Item ID to buy."
			}
			,
			{
				type: "input",
				name: "user_quantity",
				message: "Enter a Quantity."
			}
		]).then(function(answers) {
			let user_item_id = parseInt(answers.user_item_id);
			let user_quantity = parseInt(answers.user_quantity);
			let found = false;
			for (var d in data) {
				if (data[d].item_id == user_item_id) {
					found = true;
					if (data[d].stock_quantity >= user_quantity) {
						let total_cost = data[d].price * user_quantity;
						console.log("Okay, buying " + user_quantity + " of " + data[d].product_name + " for $" + total_cost.toFixed(2));
						let new_quantity = data[d].stock_quantity - user_quantity;
						let sql = "UPDATE products SET stock_quantity = " + new_quantity + " WHERE item_id = " + user_item_id;
//						console.log("QUERY: ", sql);
						con.query(sql, function (err) {
							if (err) throw err;
						});
					} else {
						console.log("Insufficient inventory! We only have " + data[d].stock_quantity + " of those!");
					}
					break;
				}
			}
			if (!found) {
				console.log("Item not found.");				
			}
			con.end();		
		});
		
	});
})












