pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT
contract UserStorage {
    struct User {
        string fullName;
        string vid;
        string gender;
        uint256 age;
        string email;
        string phoneNo;
        string marital;
        string blood;
        string allergies;
        string disease;
    }

    mapping(address => User) private users;

    function storeUserData(string memory fullName, string memory vid, string memory gender, uint256 age, string memory email, string memory phoneNo, string memory marital, string memory blood, string memory allergies, string memory disease) public {
        users[msg.sender] = User(fullName, vid, gender, age, email, phoneNo, marital, blood, allergies, disease);
    }

    function getUserData() public view returns (string memory, string memory, string memory, uint256, string memory, string memory, string memory, string memory, string memory, string memory) {
        User storage currentUser = users[msg.sender];
        return (currentUser.fullName, currentUser.vid, currentUser.gender, currentUser.age, currentUser.email, currentUser.phoneNo, currentUser.marital, currentUser.blood, currentUser.allergies, currentUser.disease);
    }

    function getUserDataByAddress(address userAddress) public view returns (string memory, string memory, string memory, uint256, string memory, string memory, string memory, string memory, string memory, string memory) {
        User storage requestedUser = users[userAddress];
        return (requestedUser.fullName, requestedUser.vid, requestedUser.gender, requestedUser.age, requestedUser.email, requestedUser.phoneNo, requestedUser.marital, requestedUser.blood, requestedUser.allergies, requestedUser.disease);
    }
}
