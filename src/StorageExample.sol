pragma solidity ^0.8.0;

contract StorageExample {
    // Basic data types
    uint256 public number = 777; // Slot 0
    bool public flag = true; // Slot 1 (potentially packed with other small variables)
    address public userAddress; // Slot 1 (20 bytes)

    // Smaller data types
    uint128 public largeNumber = 123; // Slot 2
    uint16 public smallNumber; // Slot 2
    bool public anotherFlag = true; // Slot 2

    // Strings
    string public shortString = "abc"; // Slot 3
    string public longString = "This is a long string that exceeds 31 bytes"; // Slot 4 (length), data stored at keccak256(4)

    // Fixed-size array
    uint256[3] public fixedArray = [1, 2, 3]; // Slots 5, 6, 7

    // Dynamic array
    uint256[] public dynamicArray; // Slot 8 (length), data stored at keccak256(8)

    // Mapping
    mapping(uint256 => uint256) public dataMap; // Slot 9 (actual data stored at keccak256(key, 9))

    // Struct
    struct MyStruct {
        uint256 a;
        uint256 b;
    }

    MyStruct public myStruct = MyStruct(10, 20); // Slot 10 (a in slot 10, b in slot 11)

    constructor() {
        dynamicArray.push(100); // Dynamic array will store its first element at keccak256(8)
        dynamicArray.push(200);

        dataMap[3] = 123;
        userAddress = msg.sender;
    }
}
