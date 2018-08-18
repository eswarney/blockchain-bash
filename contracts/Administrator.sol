pragma solidity ^0.4.2;

 import "./owned.sol";

contract Administrator is owned {

	uint public max_headcount; //max number of attendees 
	uint public min_headcount; //min number of attendees
	uint public party_time; //stores time and date of the party
	uint public ticket_price; //ticket price
							  //in the future the price will be made dependent on the 
							  //price o f party supplies

	struct Admin { //creating struct that will hold info about party guests

		address admin_hash; //what's their address? 
		string admin_name; //what's their name?
	}


	event eventCreated(address _admin,  string _message); //event confiming event registration
	event eventCanceled(address _admin, string _message); //event signaling if admin has 
	event minMet(string _message ); //signals to admin when min number of guests have registered
	event eventFull(string _message); // signals when party has reach max capacity to admin


	function setMin (uint max, uint min, uint price, uint time) onlyOwner {

	}

	function setTime( uint startTime, uint endTime ) onlyOwner { 

	}

	function cancelEvent( bool _cancel) onlyOwner {

	}


}
