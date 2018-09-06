pragma solidity ^0.4.20;

contract StorageSC{
    bytes32 [] HashFileIds;
    address public owner;
    mapping (address => User) public users;
    mapping (bytes32 =>Storaged) public dataOwner;
    struct User{
        address userAddress;
        string interval;
        string secretKey;
    }
    struct Storaged{
        bytes32 FileId; 
        string CT;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function StorageSC () public {
        owner = msg.sender;
        setHash_FileId("");
        setCipherText("","");
    }
    function setHash_FileId(bytes32 Hash_FileId) onlyOwner public returns(bool){
         HashFileIds.push(Hash_FileId);
         dataOwner[Hash_FileId].FileId=Hash_FileId;
         return true;
    }
    function checkHash_FileId(bytes32 Hash_FileId)constant public returns(bool) {
        if(dataOwner[Hash_FileId].FileId==Hash_FileId)
        return true;
    }
    
    function setCipherText(bytes32 Hash_FileId,string CipherText) onlyOwner public{
        dataOwner[Hash_FileId].CT=CipherText;
    }
    function getCipherText(bytes32 Hash_FileId)constant public returns(string) {
        return  dataOwner[Hash_FileId].CT;
    }
    
      function setSecretKey(address useraddress,string Key) onlyOwner public{
        users[useraddress].secretKey=Key;
}
    function getSecretKey() public returns(string){
        owner = msg.sender;
        return users[owner].secretKey;
    }
    
    function setInterval(address useraddress,string time) onlyOwner public{
     users[useraddress].interval=time;
}
    function getInterval() public returns(string){
        owner = msg.sender;
        return users[owner].interval;
    }
    
}