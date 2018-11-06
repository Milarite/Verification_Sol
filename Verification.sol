pragma solidity ^0.4.17;
contract Verification
{

        string [] hash;
        address adminAddress=0xB248D34f2431824Afe5147170fB98A7Aa0F7499D;
        struct uploaderInfo
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
        mapping (string => uploaderInfo) mappingUploder;
        mapping (string =>generalInfo) mappingInfo;
        mapping (string =>bool) mappingCheckSignedupBefore;
        
        
        string url;
        mapping (string=>string)mappingTrans;
        
        function signupUploader (string _username,string _password) public
        {
            mappingUploder[_username]=uploaderInfo(_username,_password);
            mappingCheckSignedupBefore[_username]=true;
            
        }
        function checkSignedupBefore(string _username)public view returns (bool)
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
        
        function signinUploader(string _username,string _password) public view returns (bool)
        {
            if(keccak256(abi.encodePacked(mappingUploder[_username].password))==keccak256(abi.encodePacked(_password)))
            return true;
            else
            return false;
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