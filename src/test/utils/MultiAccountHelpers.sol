// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { envOr } from "./Vm.sol";

enum AccountType {
    DEFAULT,
    SAFE
}

string constant DEFAULT = "DEFAULT";
string constant SAFE = "SAFE";

function getAccountType() view returns (AccountType env) {
    string memory _env = envOr("ACCOUNT_TYPE", DEFAULT);

    if (keccak256(abi.encodePacked(_env)) == keccak256(abi.encodePacked(SAFE))) {
        env = AccountType.SAFE;
    } else if (keccak256(abi.encodePacked(_env)) == keccak256(abi.encodePacked(DEFAULT))) {
        env = AccountType.DEFAULT;
    } else {
        revert("Invalid account type");
    }
}
