# CrowdGo Smart Contract

CrowdGo is a crowdfunding smart contract built on Solidity that allows users to create and manage crowdfunding campaigns. Users can donate to campaigns, and once the campaign's goal is reached, the raised funds are transferred to the campaign's benefactor.

## Features
- **Campaign Creation:** Users can create a campaign by providing a title, description, benefactor address, goal amount, and deadline.
- **Donations:** Supporters can donate funds to any active campaign.
- **Campaign End:** Once the campaign deadline is reached and the goal is met, the benefactor can collect the funds.

## Deployed Contract
- **Contract Address:** `0xD33e82b347740E6ceef10EE22DEBD95d1f9E218B`
- **Network:** Lisk Sepolia Testnet
- **Block Explorer:** [View on Sepolia Blockscout](https://sepolia-blockscout.lisk.com/address/0xD33e82b347740E6ceef10EE22DEBD95d1f9E218B#code)

## Contract Functions

### 1. `createCampaign`
```solidity
function createCampaign(string memory _name, string memory _description, address _benefactor, uint256 _goal, uint256 _deadline) public
```
- Creates a new campaign with the specified parameters.
- Emits a `CampaignCreated` event.

### 2. `checkCampaign`
```solidity
function checkCampaign(uint256 id) public view returns(Campaign memory)
```
- Returns the details of the campaign by its ID.

### 3. `donateToCampaign`
```solidity
function donateToCampaign(uint256 id, uint256 amount) public
```
- Allows users to donate to a campaign. 
- Emits a `Donation` event.

### 4. `endCampaign`
```solidity
function endCampaign(uint256 id) public
```
- Ends a campaign if its goal is met and the deadline has passed.
- Emits a `CampaignEnd` event.

## Events
- **CampaignCreated:** Emitted when a new campaign is created.
- **Donation:** Emitted when a donation is made to a campaign.
- **CampaignEnd:** Emitted when a campaign successfully ends after meeting its goal.

## How to Use

1. **Deploy the Contract:**
   - The contract is already deployed at `0xD33e82b347740E6ceef10EE22DEBD95d1f9E218B` on the Lisk Sepolia test network.

2. **Create a Campaign:**
   - Use the `createCampaign` function to start a new campaign with a specific goal and deadline.

3. **Donate to a Campaign:**
   - Supporters can donate to active campaigns using the `donateToCampaign` function.

4. **End the Campaign:**
   - The campaign's benefactor can end the campaign using the `endCampaign` function if the campaign's goal is met and the deadline has passed.

## License
This project is licensed under the MIT License.