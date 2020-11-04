// Copyright (c) 2016-2018 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PLACEH_QT_TEST_RPCNESTEDTESTS_H
#define PLACEH_QT_TEST_RPCNESTEDTESTS_H

#include <QObject>
#include <QTest>

namespace interfaces {
class Node;
} // namespace interfaces

class RPCNestedTests : public QObject
{
public:
    RPCNestedTests(interfaces::Node& node) : m_node(node) {}
    interfaces::Node& m_node;

    Q_OBJECT

    private Q_SLOTS:
    void rpcNestedTests();
};

#endif // PLACEH_QT_TEST_RPCNESTEDTESTS_H
