// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract SimpleSwap {
    using SafeERC20 for IERC20;

    address public immutable bank;
    address public immutable simpleUSD;

    constructor(address _bank, address _simpleUSD) {
        bank = _bank;
        simpleUSD = _simpleUSD;
    }

    // @dev User calling swap() directly
    function swap(address userToken, uint256 amount) external {
        _swap(msg.sender, userToken, amount);
    }

    // @dev User provide signature and submitted to blockchain by relayer
    function swapWithSignature(bytes calldata signature, address userToken, uint256 amount) external {
        address authedUser;

        // TODO verify signature and get the authedUser value

        _swap(authedUser, userToken, amount);
    }

    function _swap(address user, address userToken, uint256 amount) private {
        IERC20(userToken).safeTransferFrom(user, bank, amount);
        IERC20(simpleUSD).safeTransferFrom(bank, user, amount);
    }
}
