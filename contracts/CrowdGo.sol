// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CrowdGo{

event CampaignCreated(uint256 indexed id, string indexed _name, uint256 indexed deadline);
event Donation(uint256 indexed id, uint256 indexed amount);
event CampaignEnd(uint256 indexed id);

struct Campaign{
    uint256 id;
    string name;
    string description;
    address benefactor;
    uint256 goal;
    uint256 deadline;
    uint256 amountRaised;
}

address sender;
address owner;
address admin;
address benefactor;

Campaign[] public allCampaigns;
mapping(address => uint256) public campaignBalance;
mapping(address => Campaign) public campaignID;

    constructor(){
        owner = msg.sender;
    }

    //  title, description, benefactor, goal, and duration
    function createCampaign(
        string memory _name,
        string memory _description,
        address _benefactor,
        uint256 _goal,
        uint256 _deadline
        ) public{
            uint256 id = allCampaigns.length + 1;
            uint256 deadline = block.timestamp + _deadline; 
        Campaign memory newCampaign = Campaign(id,_name,_description,_benefactor,_goal, deadline,0);
        allCampaigns.push(newCampaign);
        campaignID[_benefactor] = newCampaign;

        emit CampaignCreated(id, _name, deadline);
        
    }

    function checkCampaign(uint256 id) public view returns(Campaign memory){
        for (uint256 i; i < allCampaigns.length; i++) 
        {
            if(id == allCampaigns[i].id){
                return allCampaigns[i];
            }
        }
    }

    function donateToCampaign(uint256 id, uint256 amount) public{        
        require(amount > 0, "You cannot send zero amount");
        require(checkCampaign(id).deadline <= block.timestamp, "this campaign is over");           
                 campaignBalance[msg.sender] -= amount;
                 emit Donation(id, amount); 
    }           


    function endCampaign(uint256 id) public{
        require(campaignID[benefactor].deadline <= block.timestamp, "this campaign is over"); 
        require(campaignID[benefactor].goal == campaignID[benefactor].amountRaised, "Goal not reached");  
        campaignBalance[benefactor] += checkCampaign(id).amountRaised;

        emit CampaignEnd(id);  

    }
}