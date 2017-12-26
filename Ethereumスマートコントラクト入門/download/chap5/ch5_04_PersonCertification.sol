pragma solidity ^0.4.8;

// 本人確認コントラクト
contract PersonCertification {

    // コントラクトの管理者アドレス
    address admin;

    // (1) 閲覧許可情報
    struct AppDetail {
        bool allowReference;
        uint256 approveBlockNo;
        uint256 refLimitBlockNo;
        address applicant;
    }

    // (2) 本人確認情報（山田太郎）
    struct PersonDetail {
        string name;
        string birth;
        address[] orglist;
    }

    // (3) 証明機関情報（学校や企業など）
    struct OrganizationDetail {
        string name;
    }

    // (4) アドレスがキーの閲覧許可情報
    mapping(address => AppDetail) appDetail;

    // (5) アドレスがキーの本人確認情報
    mapping(address => PersonDetail) personDetail;

    // (6) アドレスがキーの組織情報
    mapping(address => OrganizationDetail) public orgDetail;

    // (7) コンストラクタ
    function PersonCertification() {
        admin = msg.sender;
    }

    // ---------------------------------------------------------------------
    // データ登録関数（set）
    // ---------------------------------------------------------------------
    // (8) 本人情報を登録する
    function setPerson(string _name, string _birth) {
        personDetail[msg.sender].name = _name;
        personDetail[msg.sender].birth = _birth;
    }

    // (9) 組織情報を登録する
    function setOrganization(string _name) {
         orgDetail[msg.sender].name = _name;
    }

    // (10) 組織が人の所属を証明する
    function setBelong(address _person) {
        personDetail[_person].orglist.push(msg.sender);
    }

    // (11) 本人確認情報の参照を許可する
    function setApprove(address _applicant, uint256 _span) {
        appDetail[msg.sender].allowReference = true;
        appDetail[msg.sender].approveBlockNo = block.number;
        appDetail[msg.sender].refLimitBlockNo = block.number + _span;
        appDetail[msg.sender].applicant = _applicant;
    }

    // ---------------------------------------------------------------------
    // データ取得関数（get）
    // ---------------------------------------------------------------------
    // (12) 本人確認情報を参照する
    function getPerson(address _person) public constant returns(
                                        bool _allowReference,
                                        uint256 _approveBlockNo,
                                        uint256 _refLimitBlockNo,
                                        address _applicant,
                                        string _name,
                                        string _birth,
                                        address[] _orglist) {
        _allowReference  = appDetail[_person].allowReference;
        _approveBlockNo  = appDetail[_person].approveBlockNo;
        _refLimitBlockNo = appDetail[_person].refLimitBlockNo;
        _applicant       = appDetail[_person].applicant;
        if (((msg.sender == _applicant) 
          && (_allowReference == true) 
          && (block.number < _refLimitBlockNo)) 
         || (msg.sender == admin) 
         || (msg.sender == _person)) {
            _name    = personDetail[_person].name;
            _birth   = personDetail[_person].birth;
            _orglist = personDetail[_person].orglist;
        }
    }
}
