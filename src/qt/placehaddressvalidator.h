// Copyright (c) 2011-2014 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PLACEH_QT_PLACEHADDRESSVALIDATOR_H
#define PLACEH_QT_PLACEHADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class PlaceholdersAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PlaceholdersAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

/** Placeholders address widget validator, checks for a valid placeh address.
 */
class PlaceholdersAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PlaceholdersAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

#endif // PLACEH_QT_PLACEHADDRESSVALIDATOR_H
