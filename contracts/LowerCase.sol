pragma solidity ^0.4.11;

contract StringToLower {

    uint256 public _usageCount;

	function _toLower(string str) internal returns (string) {
        _usageCount = _usageCount + 1;
		bytes memory bStr = bytes(str);
		bytes memory bLower = new bytes(bStr.length);
		for (uint i = 0; i < bStr.length; i++) {
			// Uppercase character...
			if ((bStr[i] >= 65) && (bStr[i] <= 90)) {
				// So we add 32 to make it lowercase
				bLower[i] = bytes1(int(bStr[i]) + 32);
			} else {
				bLower[i] = bStr[i];
			}
		}
		return string(bLower);
	}

    function toLower(string str) public view returns (string){
        return _toLower(str);
    }

    function contractToLower(string str) external returns(string){
        return _toLower(str);
    }

    function usageCount() external returns(uint256){
        return _usageCount;
    }
}