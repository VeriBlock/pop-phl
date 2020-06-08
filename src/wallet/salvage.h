// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2020 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PLACEH_WALLET_SALVAGE_H
#define PLACEH_WALLET_SALVAGE_H

#include <fs.h>
#include <streams.h>

bool RecoverDatabaseFile(const fs::path& file_path);

#endif // PLACEH_WALLET_SALVAGE_H
