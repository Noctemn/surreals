pragma solidity ^0.8.2;

/**
 * @notice Key sets with enumeration and delete. Uses mappings for random
 * and existence checks and dynamic arrays for enumeration. Key uniqueness is enforced. 
 * @dev Sets are unordered. Delete operations reorder keys. All operations have a 
 * fixed gas cost at any scale, O(1). 
 * author: Rob Hitchens
 */

library UintSet {
    
    struct Set {
        mapping(uint => uint) keyPointers;
        uint[] keyList;
    }

    /**
     * @notice insert a key. 
     * @dev duplicate keys are not permitted.
     * @param self storage pointer to a Set. 
     * @param key value to insert.
     */       
    function insert(Set storage self, uint key) internal {
        require(!exists(self, key), "UintSet: key already exists in the set.");
        self.keyPointers[key] = self.keyList.push(key)-1;
    }

    /**
     * @notice remove a key.
     * @dev key to remove must exist. 
     * @param self storage pointer to a Set.
     * @param key value to remove.
     */  
    function remove(Set storage self, uint key) internal {
        require(exists(self, key), "UintSet: key does not exist in the set.");
        uint last = count(self) - 1;
        uint rowToReplace = self.keyPointers[key];        
        if(rowToReplace != last) {
            uint keyToMove = self.keyList[last];
            self.keyPointers[keyToMove] = rowToReplace;
            self.keyList[rowToReplace] = keyToMove;
        }
        delete self.keyPointers[key];
        self.keyList.length--;
    }

    /**
     * @notice count the keys.
     * @param self storage pointer to a Set. 
     */   
    function count(Set storage self) internal view returns(uint) {
        return(self.keyList.length);
    }

    /**
     * @notice check if a key is in the Set.
     * @param self storage pointer to a Set.
     * @param key value to check. 
     * @return bool true: Set member, false: not a Set member.
     */  
    function exists(Set storage self, uint key) internal view returns(bool) {
        if(self.keyList.length == 0) return false;
        return self.keyList[self.keyPointers[key]] == key;
    }

    /**
     * @notice fetch a key by row (enumerate).
     * @param self storage pointer to a Set.
     * @param index row to enumerate. Must be < count() - 1.
     */      
    function keyAtIndex(Set storage self, uint index) internal view returns(uint) {
        return self.keyList[index];
    }

    function union(Set storage set1, Set storage set2) internal returns (Set union) {
        m = count(set1);
        n = count(set2);
        uint i;
        uint j;
        uint prev;
        while (i < m && j < n ) {
            if (set1[])
            j++;

        }

    }

    function intersection()


}
