// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract CrowdGo{
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
address admin;

Campaign[] public allCampaigns;
mapping(address => uint256) public campaignBalance;

    constructor(){

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
        for (uint256 i; i < allCampaigns.length; i++) {            
            if(id == allCampaigns[i].id){
                require(allCampaigns[i].deadline == block.timestamp, "this campaign is over");
                 allCampaigns[i].amountRaised += amount;
                 campaignBalance[msg.sender] -= amount;
            }
        
        }
        

    }


    function endCampaign() public{

    }

}