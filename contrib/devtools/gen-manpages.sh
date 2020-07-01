#!/usr/bin/env bash
# Copyright (c) 2016-2019 The Placeholders Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PHLD=${PHLD:-$BINDIR/placehd}
PHLCLI=${PHLCLI:-$BINDIR/placeh-cli}
PHLTX=${PHLTX:-$BINDIR/placeh-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/placeh-wallet}
PHLQT=${PHLQT:-$BINDIR/qt/placeh-qt}

[ ! -x $PHLD ] && echo "$PHLD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a PHLVER <<< "$($PHLCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for placehd if --version-string is not set,
# but has different outcomes for placeh-qt and placeh-cli.
echo "[COPYRIGHT]" > footer.h2m
$PHLD --version | sed -n '1!p' >> footer.h2m

for cmd in $PHLD $PHLCLI $PHLTX $WALLET_TOOL $PHLQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PHLVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PHLVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
