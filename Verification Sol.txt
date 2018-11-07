pragma solidity ^0.4.17;
contract Verification
{

        string [] hash;
        
        struct owner
        {
            
            string username;
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
        string uploader;
        }
        mapping (string => owner) ownerMapping;
        mapping (string =>generalInfo) mappingInfo;
        mapping (string =>bool) mappingCheckSignedupBefore;
        
        
        string url;
        mapping (string=>string)mappingTrans;
        
        function addOwner (string _username,string _password) public
        {
            ownerMapping[_username]=owner(_username,_password);

        }
       
        function checkSignedBefore(string _username)public view returns(string,string){
            return (ownerMapping[_username].username,ownerMapping[_username].password);
        }
        
  
        
        

       function getDateOfBirth(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].dateOfBirth;
       }
  
       function getPlaceOfBirth(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].placeOfBirth;
       }
        
 
       function getNationalID(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].nationalID;
       }

       function getFirstName(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].firstName;
       }
       

       function getLastName(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].lastName;
       }

       function getAge(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].age;
       }

       function getSex(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].sex;
       }
       

       function getMajor(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].major;
       }

       function getGPA(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].gpa;
       }
       
   
       function getUniversityName(string _hash) public view returns (string)
       {
           return mappingInfo[_hash].universityName;
       }
       
       
       
        function checkHashExsist(string _hast) public  view  returns  (bool)
        {
            for(uint i=0;i<hash.length;i++)
            {
                if(keccak256(abi.encodePacked(hash[i]))==keccak256(abi.encodePacked(_hast)))
                {
                return true;
                break;
                }
            }
            return false;
        }
        function setUrl(string _url) public 
        {
            url=_url;
        }
       
        function addHash(string _hash,string _firstName,string _lastName,string _age,string _sex,string _gpa,string _major,string _universityName ,string _nationalID,string _dateOfBirth,string _placeOfBirth,string uploader) public
        
        {
            hash.push(_hash);
            mappingInfo[_hash]=generalInfo(_firstName,_lastName,_age,_sex,_gpa,_major,_universityName,_nationalID,_dateOfBirth,_placeOfBirth,uploader);
         
           
        }
        function saveTransaction(string _hash,string _transaction) public 
        {
              mappingTrans[_hash]=_transaction;
        }
        function getUrl() public view returns (string)
        {
            return url;
           
        }
        function getHashLength() public view returns(uint){
            return hash.length;
        }
       
       
        // function checkHash (string _hash) public view returns(){
           
        // }
       
        function getHash(uint index) public view returns (string)
        {
            return hash[index];
        }
        function getTransactions(string _hash)public view returns(string)
        {
            return mappingTrans[_hash];
        }

       
}