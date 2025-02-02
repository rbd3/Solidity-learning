x   

contract SimpleStorage {
    uint256 public hasFavoriteNumber = 5;

    struct Person {
        uint256 favNumber;
        string name;
    }

    // Person public pat = Person(7, "Pat");
    Person[] public listofPeople;
    mapping (string => uint256) public nameOfFavoriteNumber;

    function store(uint256 _hasFavoriteNumber) public virtual {
        hasFavoriteNumber = _hasFavoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return hasFavoriteNumber;
    }

    function addPeople(string memory _name, uint256 _favNumber) public {
        listofPeople.push(Person(_favNumber, _name));
        nameOfFavoriteNumber[_name] = _favNumber;
    }
}