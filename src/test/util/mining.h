// Copyright (c) 2019 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PLACEH_TEST_UTIL_MINING_H
#define PLACEH_TEST_UTIL_MINING_H

#include <memory>
#include <string>

class CBlock;
class CScript;
class CTxIn;

/** Returns the generated coin */
CTxIn MineBlock(const CScript& coinbase_scriptPubKey);

/** Prepare a block to be mined */
std::shared_ptr<CBlock> PrepareBlock(const CScript& coinbase_scriptPubKey);

/** RPC-like helper function, returns the generated coin */
CTxIn generatetoaddress(const std::string& address);

#endif // PLACEH_TEST_UTIL_MINING_H
