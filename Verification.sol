pragma solidity ^0.4.17;
contract Verification
{

        string [] hash;
        
        
        
        
        struct owner
        {
            
            bytes32 username;
            bytes32 password;
        }
        struct generalInfo
        {
        string tx;
        bytes32 firstName;
        bytes32 lastName;
       bytes32 [9] moreInfo;
       
       
        }
        mapping (bytes32 => owner) ownerMapping;
        mapping (string =>generalInfo) mappingInfo;
        mapping (string =>bool) mappingCheckSignedupBefore;
        
        
        string url;
        mapping (string=>generalInfo)mappingTrans;
        
        function addOwner (bytes32 _username,bytes32 _password) public
        {
            ownerMapping[_username]=owner(_username,_password);

        }
       
        function checkSignedBefore(bytes32 _username)public view returns(bytes32,bytes32){
            return (ownerMapping[_username].username,ownerMapping[_username].password);
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
       
        function addHash(string tx,string _hash,bytes32 _firstName,bytes32 _lastName,bytes32 _age,bytes32 _sex,bytes32 _gpa,bytes32 _major,bytes32 _universityName ,bytes32 _nationalID,bytes32 _dateOfBirth,bytes32 _placeOfBirth,bytes32 uploader) public
        
        {
            hash.push(_hash);
            bytes32  [9] memory moreInfo  =[_age,_sex,_gpa,_major,_universityName,_nationalID,_dateOfBirth,_placeOfBirth,uploader];
            mappingInfo[_hash]=generalInfo(tx,_firstName,_lastName , moreInfo );
            
            
            
            
            
            
            
            
            
  
         
           
          
           
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
        
        
        function getAllInformation(string _hash) public view returns(string ,
        bytes32,bytes32,bytes32[9]){
            
            return (
                mappingTrans[_hash].tx,
                mappingTrans[_hash].firstName,
                mappingTrans[_hash].lastName,
                mappingTrans[_hash].moreInfo
               );
              
                
           
                
                
                
                
                
                
                
                
                
                
               
            
            
        }
      
        
        
    

       
}