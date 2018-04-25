//balanceOfはaddressを受け取り、balanceを返す
function balanceOf(address _owner) public view returns (uint256 _balance);

//ownerOfはトークンIDを受け取り、保有者のaddressを返す
function ownerOf(uint256 _tokenId) public view returns (address _owner);

pragma solidity ^0.4.19;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    return zombieToOwner[_tokenId];
  }

  function transfer(address _to, uint256 _tokenId) public {

  }

  function approve(address _to, uint256 _tokenId) public {

  }
