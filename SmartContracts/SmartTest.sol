pragma solidity ^0.4.24;



contract SmartTest {
    
    //0,1,2
    enum ContractNetwork { Ropsten,MianNet,CustomNet }
    
     struct ContractInfo {
        ContractNetwork net;
        string ABIStorageHash;
        string host;
    }
    
    mapping(address => ContractInfo) public contractsMap;

    constructor() {
        //iteration = 0;
    }

    function addContract(address ropstenAddress,string abiStorageHash,uint8 network,string host ) {
        require(ropstenAddress!=0x0);
        require(abiStorageHash != "");
        if(network==2){
            require(host !="", "Add host url");
        }
        contractsMap[ropstenAddress] = ContractInfo(network,abiStorageHash,host);
    }

    function getIteration(address contractAddress) view returns (ContractInfo) {
        return contractsMap[contractAddress];
    }

}