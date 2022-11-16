// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.16;

import "../NestingToken.sol";

//Minimal public implementation of IRMRKNesting for testing.
contract NestingTokenMock is NestingToken {
    constructor() NestingToken() {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

    function nestMint(
        address to,
        uint256 tokenId,
        uint256 destinationId
    ) external {
        _nestMint(to, tokenId, destinationId);
    }

    // Utility transfers:

    function transfer(address to, uint256 tokenId) public virtual {
        transferFrom(_msgSender(), to, tokenId);
    }

    function nestTransfer(
        address to,
        uint256 tokenId,
        uint256 destinationId
    ) public virtual {
        nestTransferFrom(_msgSender(), to, tokenId, destinationId);
    }
}
