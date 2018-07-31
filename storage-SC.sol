pragma solidity ^0.4.20;

contract Storage{
    bytes32 [] HashFileIds;
    address public owner;
    mapping (address => User) public expireTime;
    mapping (bytes32 =>Storaged) public sto;
    struct User{
        address userAddress;
        string interval;
    }
    struct Storaged{
        bytes32 FileId; 
        string MSK;
        string CT;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function Storage () public {
        owner = msg.sender;
        setMSK("","");
        setHash_FileId("");
        setCipherText("","");
    }
    function setHash_FileId(bytes32 Hash_FileId) onlyOwner public returns(bool){
         HashFileIds.push(Hash_FileId);
         sto[Hash_FileId].FileId=Hash_FileId;
         return true;
    }
    function getHash_FileId(bytes32 Hash_FileId)constant public returns(bool) {
        if(sto[Hash_FileId].FileId==Hash_FileId)
        return true;
    }
    function setMSK(bytes32 Hash_FileId,string MSK) onlyOwner public{
        sto[Hash_FileId].MSK=MSK;
    }
    function getMSK(bytes32 Hash_FileId)constant public returns(string) {
        return sto[Hash_FileId].MSK;
    }
    
    
    function setCipherText(bytes32 Hash_FileId,string CipherText) onlyOwner public{
        sto[Hash_FileId].CT=CipherText;
    }
    function getCipherText(bytes32 Hash_FileId)constant public returns(string) {
        return  sto[Hash_FileId].CT;
    }
    
    function setInterval(address useraddress,string time) onlyOwner public{
     expireTime[useraddress].interval=time;
}
    function getInterval() public returns(string){
        owner = msg.sender;
        return expireTime[owner].interval;
    }
    
}