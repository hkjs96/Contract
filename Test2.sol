// SPDX-License-Identifier: MIT
// Klaytn Contract Library v1.0.0 (KIP/token/KIP7/IKIP7.sol)

pragma solidity ^0.8.1;

interface IKIP7 {
    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function safeTransfer(
        address recipient,
        uint256 amount,
        bytes memory data
    ) external;

    function safeTransfer(address recipient, uint256 amount) external;

    function safeTransferFrom(
        address sender,
        address recipient,
        uint256 amount,
        bytes memory data
    ) external;

    function safeTransferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external;
}

interface IKIP7Receiver {

    function onKIP7Received(
        address operator,
        address from,
        uint256 amount,
        bytes calldata _data
    ) external returns (bytes4);
}

interface IKIP7Metadata is IKIP7 {
 
    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);
}

interface IKIP13 {

    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

abstract contract KIP13 is IKIP13 {
 
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IKIP13).interfaceId;
    }
}



// OpenZeppelin Contracts (last updated v4.5.0) (utils/Address.sol)

library Address {

    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            if (returndata.length > 0) {

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}






interface IKIP7Mintable {
   
    function mint(address account, uint256 amount) external returns (bool);

    function isMinter(address account) external view returns (bool);

    function addMinter(address account) external;

    function renounceMinter() external;
}





// OpenZeppelin Contracts v4.4.1 (access/IAccessControl.sol)

interface IAccessControl {
   
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    function hasRole(bytes32 role, address account) external view returns (bool);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function grantRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function renounceRole(bytes32 role, address account) external;
}


// OpenZeppelin Contracts v4.4.1 (access/IAccessControlEnumerable.sol)


interface IAccessControlEnumerable is IAccessControl {
   
    function getRoleMember(bytes32 role, uint256 index) external view returns (address);

    function getRoleMemberCount(bytes32 role) external view returns (uint256);
}



// OpenZeppelin Contracts v4.4.1 (utils/Strings.sol)

library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";
    uint8 private constant _ADDRESS_LENGTH = 20;

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

    function toHexString(address addr) internal pure returns (string memory) {
        return toHexString(uint256(uint160(addr)), _ADDRESS_LENGTH);
    }
}



// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// OpenZeppelin Contracts v4.4.1 (utils/introspection/ERC165.sol)

abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// OpenZeppelin Contracts (last updated v4.6.0) (access/AccessControl.sol)

abstract contract AccessControl is Context, IAccessControl, ERC165 {
    struct RoleData {
        mapping(address => bool) members;
        bytes32 adminRole;
    }

    mapping(bytes32 => RoleData) private _roles;

    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    modifier onlyRole(bytes32 role) {
        _checkRole(role);
        _;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IAccessControl).interfaceId || super.supportsInterface(interfaceId);
    }

    function hasRole(bytes32 role, address account) public view virtual override returns (bool) {
        return _roles[role].members[account];
    }

    function _checkRole(bytes32 role) internal view virtual {
        _checkRole(role, _msgSender());
    }

    function _checkRole(bytes32 role, address account) internal view virtual {
        if (!hasRole(role, account)) {
            revert(
                string(
                    abi.encodePacked(
                        "AccessControl: account ",
                        Strings.toHexString(uint160(account), 20),
                        " is missing role ",
                        Strings.toHexString(uint256(role), 32)
                    )
                )
            );
        }
    }

    function getRoleAdmin(bytes32 role) public view virtual override returns (bytes32) {
        return _roles[role].adminRole;
    }

    function grantRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }

    function revokeRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _revokeRole(role, account);
    }

    function renounceRole(bytes32 role, address account) public virtual override {
        require(account == _msgSender(), "AccessControl: can only renounce roles for self");

        _revokeRole(role, account);
    }

    function _setupRole(bytes32 role, address account) internal virtual {
        _grantRole(role, account);
    }

    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        bytes32 previousAdminRole = getRoleAdmin(role);
        _roles[role].adminRole = adminRole;
        emit RoleAdminChanged(role, previousAdminRole, adminRole);
    }
    function _grantRole(bytes32 role, address account) internal virtual {
        if (!hasRole(role, account)) {
            _roles[role].members[account] = true;
            emit RoleGranted(role, account, _msgSender());
        }
    }

    function _revokeRole(bytes32 role, address account) internal virtual {
        if (hasRole(role, account)) {
            _roles[role].members[account] = false;
            emit RoleRevoked(role, account, _msgSender());
        }
    }
}


library EnumerableSet {

    struct Set {

        bytes32[] _values;
        mapping(bytes32 => uint256) _indexes;
    }

    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) {
           
            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            if (lastIndex != toDeleteIndex) {
                bytes32 lastValue = set._values[lastIndex];

                set._values[toDeleteIndex] = lastValue;
                set._indexes[lastValue] = valueIndex; // Replace lastValue's index to valueIndex
            }

            set._values.pop();

            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }
   
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        return set._values[index];
    }

    function _values(Set storage set) private view returns (bytes32[] memory) {
        return set._values;
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
        return _at(set._inner, index);
    }

    function values(Bytes32Set storage set) internal view returns (bytes32[] memory) {
        return _values(set._inner);
    }

    struct AddressSet {
        Set _inner;
    }
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }


    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint160(uint256(_at(set._inner, index))));
    }

    function values(AddressSet storage set) internal view returns (address[] memory) {
        bytes32[] memory store = _values(set._inner);
        address[] memory result;

        assembly {
            result := store
        }

        return result;
    }

    // UintSet

    struct UintSet {
        Set _inner;
    }

    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }

    function values(UintSet storage set) internal view returns (uint256[] memory) {
        bytes32[] memory store = _values(set._inner);
        uint256[] memory result;

        assembly {
            result := store
        }

        return result;
    }
}

abstract contract AccessControlEnumerable is IAccessControlEnumerable, AccessControl {
    using EnumerableSet for EnumerableSet.AddressSet;

    mapping(bytes32 => EnumerableSet.AddressSet) private _roleMembers;
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IAccessControlEnumerable).interfaceId || super.supportsInterface(interfaceId);
    }

    function getRoleMember(bytes32 role, uint256 index) public view virtual override returns (address) {
        return _roleMembers[role].at(index);
    }


    function getRoleMemberCount(bytes32 role) public view virtual override returns (uint256) {
        return _roleMembers[role].length();
    }

    /**
     * @dev Overload {_grantRole} to track enumerable memberships
     */
    function _grantRole(bytes32 role, address account) internal virtual override {
        super._grantRole(role, account);
        _roleMembers[role].add(account);
    }

    /**
     * @dev Overload {_revokeRole} to track enumerable memberships
     */
    function _revokeRole(bytes32 role, address account) internal virtual override {
        super._revokeRole(role, account);
        _roleMembers[role].remove(account);
    }
}

// Klaytn Contract Library v1.0.0 (KIP/token/KIP7/extensions/KIP7Mintable.sol)

/*
abstract contract KIP7Mintable is KIP7, AccessControlEnumerable, IKIP7Mintable {
    bytes32 public constant MINTER_ROLE = keccak256("KIP7_MINTER_ROLE");

    function mint(address account, uint256 amount)
        public
        virtual
        override
        returns (
            // onlyRole(MINTER_ROLE)
            bool
        )
    {
        require(hasRole(MINTER_ROLE, _msgSender()), "KIP7Mintable: must have minter role to mint");
        _safeMint(account, amount);
        return true;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(KIP7, AccessControlEnumerable)
        returns (bool)
    {
        return
            interfaceId == type(IKIP7Mintable).interfaceId ||
            KIP7.supportsInterface(interfaceId) ||
            AccessControlEnumerable.supportsInterface(interfaceId);
    }

    function isMinter(address account) override public view returns (bool) {
        return hasRole(MINTER_ROLE, account);
    }

    function addMinter(address account) override  public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(MINTER_ROLE, account);
    }

    function renounceMinter() public override  {
        renounceRole(MINTER_ROLE, msg.sender);
    }
}
*/

contract KIP7 is Context, KIP13, IKIP7, IKIP7Metadata, AccessControlEnumerable, IKIP7Mintable { 
    using Address for address;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    bytes32 public constant MINTER_ROLE = keccak256("KIP7_MINTER_ROLE");

    function mint(address account, uint256 amount)
        public
        virtual
        override
        returns (
            // onlyRole(MINTER_ROLE)
            bool
        )
    {
        require(hasRole(MINTER_ROLE, _msgSender()), "KIP7Mintable: must have minter role to mint");
        _safeMint(account, amount);
        return true;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(KIP13, AccessControlEnumerable) returns (bool)
    {
        return
            interfaceId == type(IKIP7Mintable).interfaceId ||
            KIP7.supportsInterface(interfaceId) ||
            AccessControlEnumerable.supportsInterface(interfaceId);
    }

    function isMinter(address account) override public view returns (bool) {
        return hasRole(MINTER_ROLE, account);
    }

    function addMinter(address account) override  public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(MINTER_ROLE, account);
    }

    function renounceMinter() public override  {
        renounceRole(MINTER_ROLE, msg.sender);
    }

    /*
    function supportsInterface(bytes4 interfaceId) public view virtual override(KIP13) returns (bool) {
        return
            interfaceId == type(IKIP7).interfaceId ||
            interfaceId == type(IKIP7Metadata).interfaceId ||
            KIP13.supportsInterface(interfaceId);
    }
    */

    function name() public view virtual override returns (string memory) {
        return _name;
    }


    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
        // return _decimals;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }


    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "KIP7: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    function safeTransfer(address recipient, uint256 amount) public virtual override {
        address owner = _msgSender();
        _safeTransfer(owner, recipient, amount, "");
    }

    function safeTransfer(
        address recipient,
        uint256 amount,
        bytes memory _data
    ) public virtual override {
        address owner = _msgSender();
        _safeTransfer(owner, recipient, amount, _data);
    }

    function safeTransferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override {
        address spender = _msgSender();
        _spendAllowance(sender, spender, amount);
        _safeTransfer(sender, recipient, amount, "");
    }

    function safeTransferFrom(
        address sender,
        address recipient,
        uint256 amount,
        bytes memory _data
    ) public virtual override {
        address spender = _msgSender();
        _spendAllowance(sender, spender, amount);
        _safeTransfer(sender, recipient, amount, _data);
    }

    function _safeTransfer(
        address from,
        address to,
        uint256 amount,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, amount);
        require(_checkOnKIP7Received(from, to, amount, _data), "KIP7: transfer to non IKIP7Receiver implementer");
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "KIP7: transfer from the zero address");
        require(to != address(0), "KIP7: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "KIP7: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
        }
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    function _safeMint(address account, uint256 amount) internal virtual {
        _safeMint(account, amount, "");
    }

    function _safeMint(
        address account,
        uint256 amount,
        bytes memory _data
    ) internal virtual {
        _mint(account, amount);
        require(
            _checkOnKIP7Received(address(0), account, amount, _data),
            "KIP7: transfer to non IKIP7Receiver implementer"
        );
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "KIP7: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    function _checkOnKIP7Received(
        address from,
        address to,
        uint256 amount,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try IKIP7Receiver(to).onKIP7Received(_msgSender(), from, amount, _data) returns (bytes4 retval) {
                return retval == IKIP7Receiver.onKIP7Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("KIP7: transfer to non KIP7Receiver implementer");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "KIP7: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "KIP7: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "KIP7: approve from the zero address");
        require(spender != address(0), "KIP7: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "KIP7: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

   
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}