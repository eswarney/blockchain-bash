 pragma solidity ^0.4.2;

 import "./owned.sol";

contract Tickets is owned {

uint public partiers; //current number of people coming to the party
uint public max_headcount; //max number of attendees 
uint public min_headcount; //min number of attendees
uint public party_time; //stores time and date of the party
uint public ticket_price; //ticket price
						  //in the future the price will be made dependent on the 
						  //price of party supplies

struct Guests { //creating struct that will hold info about party guests

	address guest_hash; //what's their address? 
	string guest_name; //what's their name?
	uint number_guests; //how many people are they bringing?
	bool purchased; //have they already purchased a ticket??
}

Guests [] public guest_list; //array of Guests objects 


event TicketsPurchased(uint _guests, address _purchaser,  string _name); //event to signal ticket purchase
event PartyOn(string _message); //signals when min headcount has been met, let's Party On! 
event FullHouse(string _message); // signals when tickets have been sold out (lit) 


function Tickets (uint max, uint min, uint price, uint time) onlyOwner {
	max_headcount = max; 
	min_headcount = min; 
	ticket_price = price; 
	party_time = time; 
}

function buyTickets (Guests guest) returns (string message) { // in future modifier will be added to make sure same address isn't buying another ticket
	if (max_headcount - (partiers + guest.number_guests) < 0){
		return ("Sorry, not enough tickets left"); 
	}

	else {

			partiers += guest.number_guests; 
				if (partiers == min_headcount){
					 PartyOn("Reached minimum headcount. Time to Party!"); 
				}

				else if (partiers == max_headcount){
					FullHouse("Tickets are now sold out. Prepare for a major ranger."); 
				}

	return ("Tickets purchased"); 

	}
}



}

