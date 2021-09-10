// SPDX-License-Identifier: MIT
pragma solidity 0.5.17;

// @dev testing file

contract BokkyPooBahTrees {
    using BokkyPooBahRedBlackTreeLibrary for BokkyPooBahRedBlackTreeLibrary.Tree;

    struct Topic {
        BokkyPooBahRedBlackTreeLibrary.Tree tree;
        mapping(uint => uint) values;
    }

    mapping(bytes32 => Topic) topics;

    event Log(bytes32 topic, string action, uint key, uint value);

    constructor() public {
    }
    function root(bytes32 topic) public view returns (uint _key) {
        _key = topics[topic].tree.root;
    }
    function first(bytes32 topic) public view returns (uint _key) {
        _key = topics[topic].tree.first();
    }
    function last(bytes32 topic) public view returns (uint _key) {
        _key = topics[topic].tree.last();
    }
    function next(bytes32 topic, uint key) public view returns (uint _key) {
        _key = topics[topic].tree.next(key);
    }
    function prev(bytes32 topic, uint key) public view returns (uint _key) {
        _key = topics[topic].tree.prev(key);
    }
    function exists(bytes32 topic, uint key) public view returns (bool _exists) {
        _exists = topics[topic].tree.exists(key);
    }
    function getNode(bytes32 topic, uint _key) public view returns (uint key, uint parent, uint left, uint right, bool red, uint value) {
        (key, parent, left, right, red) = topics[topic].tree.getNode(_key);
        value = topics[topic].values[_key];
    }
    function insert(bytes32 topic, uint _key, uint _value) public {
        emit Log(topic, "insert", _key, _value);
        topics[topic].tree.insert(_key);
        topics[topic].values[_key] = _value;
    }
    function remove(bytes32 topic, uint _key) public {
        emit Log(topic, "delete", _key, topics[topic].values[_key]);
        topics[topic].tree.remove(_key);
        delete topics[topic].values[_key];
    }
}
