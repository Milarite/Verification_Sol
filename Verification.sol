pragma solidity ^0.4.24;

contract Verification
{

        string [] hash;
        address adminAddress=0xB248D34f2431824Afe5147170fB98A7Aa0F7499D;
        struct uploaderInfo
        {
            
            string  username;
            string password;
        }
        struct generalInfo
        {
        string firstName;
        string lastName;
        string age;
        string sex;
        string gpa;
        string major;
        string universityName;
        string nationalID;
        string dateOfBirth;
        string placeOfBirth;
        string studentId ;
        string uploader;
        }
        mapping (string => uploaderInfo) mappingUploder;
        mapping (string =>generalInfo) mappingInfo;
        mapping (string =>bool) mappingCheckSignedupBefore;
        
        
        string url;
        mapping (string=>string)mappingTrans;
        
        function signupUploader (string memory _username,string memory _password) public
        {
            mappingUploder[_username]=uploaderInfo(_username,_password);
            mappingCheckSignedupBefore[_username]=true;
            
        }
        function checkSignedupBefore(string memory _username)public view returns (bool)
        {
            if(mappingCheckSignedupBefore[_username]==true)
            return true;
            else
            return false;
        }
        
        function signinAdmin(address _address)public view returns (bool)
        {
            if(_address==adminAddress)
             return true;   
             else
            return false;
        }
        
        // function signinUploader(string memory _username,string memory _password) public view returns (bool)
        // {
        //     if(keccak256(abi.encodePacked(mappingUploder[_username].password))==keccak256(abi.encodePacked(_password)))
        //     return true;
        //     else
        //     return false;
        // }
     

       function getDateOfBirth(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].dateOfBirth;
       }
  
       function getPlaceOfBirth(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].placeOfBirth;
       }
        
 
       function getNationalID(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].nationalID;
       }

       function getFirstName(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].firstName;
       }
       

       function getLastName(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].lastName;
       }

       function getAge(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].age;
       }

       function getSex(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].sex;
       }
       

       function getMajor(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].major;
       }

       function getGPA(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].gpa;
       }
       
   
       function getUniversityName(string memory _hash) public view returns (string memory)
       {
           return mappingInfo[_hash].universityName;
       }
       
       
       function getStudentId(string memory _hash ) public view returns (string memory){
           return mappingInfo[_hash].studentId ;
       }
       
       
        function checkSignedBefore(string memory _hash) public  view  returns  (  string memory,string memory)
        {
           
           
           return (mappingUploder[_hash].username,mappingUploder[_hash].password);
           
           
           
        }
        function setUrl(string memory _url) public 
        {
            url=_url;
        }
       
        function addHash(string memory _hash,string memory _firstName,string memory _lastName,string memory _age,string memory _sex,string memory _gpa,string memory _major,string memory _universityName ,string memory _nationalID,string memory _dateOfBirth,string memory _placeOfBirth,string memory _studentId,string memory uploader) public
        
        {
            hash.push(_hash);
            mappingInfo[_hash]=generalInfo(_firstName,_lastName,_age,_sex,_gpa,_major,_universityName,_nationalID,_dateOfBirth,_placeOfBirth,_studentId,uploader);
         
           
        }
        function saveTransaction(string memory _hash,string memory _transaction) public 
        {
              mappingTrans[_hash]=_transaction;
        }
        function getUrl() public view returns (string memory)
        {
            return url;
           
        }
        function getHashLength() public view returns(uint){
            return hash.length;
        }
       
       
        // function checkHash (string _hash) public view returns(){
           
        // }
       
        function getHash(uint index) public view returns (string memory)
        {
            return hash[index];
        }
        function getTransactions(string memory _hash)public view returns(string memory)
        {
            return mappingTrans[_hash];
        }
        
        function addOwner (string memory username , string memory password) public {
            mappingUploder[username] = uploaderInfo(username,password);
        }

       
}