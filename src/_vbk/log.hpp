// Copyright (c) 2019-2020 Xenios SEZC
// https://www.veriblock.org
// Distributed under the MIT software license, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.

#ifndef INTEGRATION_REFERENCE_PHL_LOG_HPP
#define INTEGRATION_REFERENCE_PHL_LOG_HPP

#include <logging.h>
#include <veriblock/logger.hpp>

namespace VeriBlock {

struct VPHLLogger : public altintegration::Logger {
    ~VPHLLogger() override = default;

    void log(altintegration::LogLevel l, const std::string& msg) override
    {
        LogPrint(BCLog::POP, "[alt-cpp] [%s] %s\n", altintegration::LevelToString(l), msg);
    }
};

} // namespace VeriBlock

#endif //INTEGRATION_REFERENCE_PHL_LOG_HPP
