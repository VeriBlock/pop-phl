// Copyright (c) 2015-2018 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

/**
 * Functionality for communicating with Tor.
 */
#ifndef PLACEH_TORCONTROL_H
#define PLACEH_TORCONTROL_H


extern const std::string DEFAULT_TOR_CONTROL;
static const bool DEFAULT_LISTEN_ONION = true;

void StartTorControl();
void InterruptTorControl();
void StopTorControl();

#endif /* PLACEH_TORCONTROL_H */
