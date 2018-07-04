pragma solidity ^0.4.24;



contract SmartTest {
    
    //0,1,2
    enum ContractNetwork { Ropsten,MianNet,CustomNet }
    
     struct ContractInfo {
        ContractNetwork net;
        string ABIStorageHash;
        string host;
    }
    
    mapping(address => ContractInfo) private contractsMap;

    // constructor() {
    //     //iteration = 0;
    // }

    function addContract(address ropstenAddress,string abiStorageHash, uint8 network,string host ) public {
        require(ropstenAddress!=0x0);
        require(bytes(abiStorageHash).length >0);
        require(uint(ContractNetwork.CustomNet) >= network);
        if(network==2){
            require(bytes(host).length > 0, "Add host url");
        }
        
        contractsMap[ropstenAddress] = ContractInfo(ContractNetwork(network),abiStorageHash,host);
    }

    function getContract(address contractAddress)public view returns (uint,string, string) {
       ContractInfo memory cInfo = contractsMap[contractAddress];
        return (uint(cInfo.net),cInfo.ABIStorageHash, cInfo.host);
    }

}