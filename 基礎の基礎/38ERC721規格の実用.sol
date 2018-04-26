//ERC721規格は２つの異なるトークン移転法を持つ

//ERC721規格なので、uint256 _tokenIdを使う
//こちらはトークンの送り手が呼び出すケース
function transfer(address _to, uint256 _tokenId) public;
function approve(address _to, uint256 _tokenId) public;

//こちらはトークンの受け手が送るケース
function takeOwnership(uint256 _tokenId) public;


//例
function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerZombieCount[_to]++;
    ownerZombieCount[_from]--;
    zombieToOwner[_tokenId] = _to;
    Transfer(_from, _to, _tokenId);
  }
  //ERC721規格は、Transferイベントを含む。適切な情報を渡してTransferイベントを起こさなくてはならない。
