#!/usr/bin/env bash
# Copyright (c) 2016-2019 The Placeholders Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PLACEHD=${PLACEHD:-$BINDIR/placehd}
PLACEHCLI=${PLACEHCLI:-$BINDIR/placeh-cli}
PLACEHTX=${PLACEHTX:-$BINDIR/placeh-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/placeh-wallet}
PLACEHQT=${PLACEHQT:-$BINDIR/qt/placeh-qt}

[ ! -x $PLACEHD ] && echo "$PLACEHD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a PLACEHVER <<< "$($PLACEHCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for placehd if --version-string is not set,
# but has different outcomes for placeh-qt and placeh-cli.
echo "[COPYRIGHT]" > footer.h2m
$PLACEHD --version | sed -n '1!p' >> footer.h2m

for cmd in $PLACEHD $PLACEHCLI $PLACEHTX $WALLET_TOOL $PLACEHQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PLACEHVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PLACEHVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
