# Copyright (c) 2013-2016 The Placeholders Core developers
# Copyright (c) 2019-2020 Xenios SEZC
# https://www.veriblock.org
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

DIST_SUBDIRS = secp256k1 univalue

AM_LDFLAGS = $(PTHREAD_CFLAGS) $(LIBTOOL_LDFLAGS) $(HARDENED_LDFLAGS) $(GPROF_LDFLAGS) $(SANITIZER_LDFLAGS)
AM_CXXFLAGS = $(DEBUG_CXXFLAGS) $(HARDENED_CXXFLAGS) $(WARN_CXXFLAGS) $(NOWARN_CXXFLAGS) $(ERROR_CXXFLAGS) $(GPROF_CXXFLAGS) $(SANITIZER_CXXFLAGS)
AM_CPPFLAGS = $(DEBUG_CPPFLAGS) $(HARDENED_CPPFLAGS)
AM_LIBTOOLFLAGS = --preserve-dup-deps
EXTRA_LIBRARIES =



if EMBEDDED_UNIVALUE
LIBUNIVALUE = univalue/libunivalue.la

$(LIBUNIVALUE): $(wildcard univalue/lib/*) $(wildcard univalue/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)
else
LIBUNIVALUE = $(UNIVALUE_LIBS)
endif

PLACEH_INCLUDES=-I$(builddir) $(BDB_CPPFLAGS) $(BOOST_CPPFLAGS) $(LEVELDB_CPPFLAGS)

PLACEH_INCLUDES += -I$(srcdir)/secp256k1/include
PLACEH_INCLUDES += $(UNIVALUE_CFLAGS)

LIBPLACEH_SERVER=libplaceh_server.a
LIBPLACEH_COMMON=libplaceh_common.a
LIBPLACEH_CONSENSUS=libplaceh_consensus.a
LIBPLACEH_CLI=libplaceh_cli.a
LIBPLACEH_UTIL=libplaceh_util.a
LIBPLACEH_CRYPTO_BASE=crypto/libplaceh_crypto_base.a
LIBPLACEHQT=qt/libplacehqt.a
LIBSECP256K1=secp256k1/libsecp256k1.la

if ENABLE_ZMQ
LIBPLACEH_ZMQ=libplaceh_zmq.a
endif
if BUILD_PLACEH_LIBS
LIBPLACEHCONSENSUS=libplacehconsensus.la
endif
if ENABLE_WALLET
LIBPLACEH_WALLET=libplaceh_wallet.a
LIBPLACEH_WALLET_TOOL=libplaceh_wallet_tool.a
endif

LIBPLACEH_CRYPTO= $(LIBPLACEH_CRYPTO_BASE)
if ENABLE_SSE41
LIBPLACEH_CRYPTO_SSE41 = crypto/libplaceh_crypto_sse41.a
LIBPLACEH_CRYPTO += $(LIBPLACEH_CRYPTO_SSE41)
endif
if ENABLE_AVX2
LIBPLACEH_CRYPTO_AVX2 = crypto/libplaceh_crypto_avx2.a
LIBPLACEH_CRYPTO += $(LIBPLACEH_CRYPTO_AVX2)
endif
if ENABLE_SHANI
LIBPLACEH_CRYPTO_SHANI = crypto/libplaceh_crypto_shani.a
LIBPLACEH_CRYPTO += $(LIBPLACEH_CRYPTO_SHANI)
endif

$(LIBSECP256K1): $(wildcard secp256k1/src/*.h) $(wildcard secp256k1/src/*.c) $(wildcard secp256k1/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)

# Make is not made aware of per-object dependencies to avoid limiting building parallelization
# But to build the less dependent modules first, we manually select their order here:
EXTRA_LIBRARIES += \
  $(LIBPLACEH_CRYPTO) \
  $(LIBPLACEH_UTIL) \
  $(LIBPLACEH_COMMON) \
  $(LIBPLACEH_CONSENSUS) \
  $(LIBPLACEH_SERVER) \
  $(LIBPLACEH_CLI) \
  $(LIBPLACEH_WALLET) \
  $(LIBPLACEH_WALLET_TOOL) \
  $(LIBPLACEH_ZMQ)

lib_LTLIBRARIES = $(LIBPLACEHCONSENSUS)

bin_PROGRAMS =
noinst_PROGRAMS =
TESTS =
BENCHMARKS =

if BUILD_PLACEHD
  bin_PROGRAMS += placehd
endif

if BUILD_PLACEH_CLI
  bin_PROGRAMS += placeh-cli
endif
if BUILD_PLACEH_TX
  bin_PROGRAMS += placeh-tx
endif
if ENABLE_WALLET
if BUILD_PLACEH_WALLET
  bin_PROGRAMS += placeh-wallet
endif
endif


### VeriBlock section start
VBK_H = \
  vbk/entity/context_info_container.hpp \
  vbk/init.hpp \
  vbk/service_locator.hpp \
  vbk/pop_service.hpp \
  vbk/pop_service_impl.hpp \
  vbk/config.hpp \
  vbk/typed_wrapper.hpp \
  vbk/merkle.hpp \
  vbk/genesis.hpp \
  vbk/altchainparam.hpp \
  vbk/p2p_sync.hpp \
  vbk/util.hpp \
  vbk/adaptors/univalue_json.hpp
### VeriBlock section end


.PHONY: FORCE check-symbols check-security
# placeh core #
PLACEH_CORE_H = \
  $(VBK_H) \
  addrdb.h \
  addrman.h \
  attributes.h \
  banman.h \
  base58.h \
  bech32.h \
  bloom.h \
  blockencodings.h \
  blockfilter.h \
  chain.h \
  bootstraps.h \
  chainparams.h \
  chainparamsbase.h \
  chainparamsseeds.h \
  checkqueue.h \
  clientversion.h \
  coins.h \
  compat.h \
  compat/assumptions.h \
  compat/byteswap.h \
  compat/cpuid.h \
  compat/endian.h \
  compat/sanity.h \
  compressor.h \
  consensus/consensus.h \
  consensus/tx_check.h \
  consensus/tx_verify.h \
  core_io.h \
  core_memusage.h \
  cuckoocache.h \
  flatfile.h \
  fs.h \
  httprpc.h \
  httpserver.h \
  index/base.h \
  index/blockfilterindex.h \
  index/txindex.h \
  indirectmap.h \
  init.h \
  interfaces/chain.h \
  interfaces/handler.h \
  interfaces/node.h \
  interfaces/wallet.h \
  key.h \
  key_io.h \
  dbwrapper.h \
  limitedmap.h \
  logging.h \
  logging/timer.h \
  memusage.h \
  merkleblock.h \
  miner.h \
  net.h \
  net_permissions.h \
  net_processing.h \
  net_types.h \
  netaddress.h \
  netbase.h \
  netmessagemaker.h \
  node/coin.h \
  node/coinstats.h \
  node/context.h \
  node/psbt.h \
  node/transaction.h \
  node/utxo_snapshot.h \
  noui.h \
  optional.h \
  outputtype.h \
  policy/feerate.h \
  policy/fees.h \
  policy/policy.h \
  policy/rbf.h \
  policy/settings.h \
  pow.h \
  protocol.h \
  psbt.h \
  random.h \
  randomenv.h \
  reverse_iterator.h \
  reverselock.h \
  rpc/blockchain.h \
  rpc/client.h \
  rpc/protocol.h \
  rpc/rawtransaction_util.h \
  rpc/register.h \
  rpc/request.h \
  rpc/server.h \
  rpc/util.h \
  scheduler.h \
  script/descriptor.h \
  script/keyorigin.h \
  script/sigcache.h \
  script/sign.h \
  script/signingprovider.h \
  script/standard.h \
  shutdown.h \
  streams.h \
  support/allocators/secure.h \
  support/allocators/zeroafterfree.h \
  support/cleanse.h \
  support/events.h \
  support/lockedpool.h \
  sync.h \
  threadsafety.h \
  threadinterrupt.h \
  timedata.h \
  torcontrol.h \
  txdb.h \
  txmempool.h \
  ui_interface.h \
  undo.h \
  util/bip32.h \
  util/bytevectorhash.h \
  util/check.h \
  util/error.h \
  util/fees.h \
  util/spanparsing.h \
  util/system.h \
  util/macros.h \
  util/memory.h \
  util/moneystr.h \
  util/rbf.h \
  util/settings.h \
  util/string.h \
  util/threadnames.h \
  util/time.h \
  util/translation.h \
  util/url.h \
  util/validation.h \
  util/vector.h \
  validation.h \
  validationinterface.h \
  versionbits.h \
  versionbitsinfo.h \
  walletinitinterface.h \
  wallet/coincontrol.h \
  wallet/crypter.h \
  wallet/db.h \
  wallet/feebumper.h \
  wallet/fees.h \
  wallet/ismine.h \
  wallet/load.h \
  wallet/psbtwallet.h \
  wallet/rpcwallet.h \
  wallet/scriptpubkeyman.h \
  wallet/wallet.h \
  wallet/walletdb.h \
  wallet/wallettool.h \
  wallet/walletutil.h \
  wallet/coinselection.h \
  warnings.h \
  zmq/zmqabstractnotifier.h \
  zmq/zmqconfig.h\
  zmq/zmqnotificationinterface.h \
  zmq/zmqpublishnotifier.h \
  zmq/zmqrpc.h

obj/build.h: FORCE
	@$(MKDIR_P) $(builddir)/obj
	@$(top_srcdir)/share/genbuild.sh "$(abs_top_builddir)/src/obj/build.h" \
	  "$(abs_top_srcdir)"
libplaceh_util_a-clientversion.$(OBJEXT): obj/build.h


# server: shared between placehd and placeh-qt
# Contains code accessing mempool and chain state that is meant to be separated
# from wallet and gui code (see node/README.md). Shared code should go in
# libplaceh_common or libplaceh_util libraries, instead.
libplaceh_server_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES) $(MINIUPNPC_CPPFLAGS) $(EVENT_CFLAGS) $(EVENT_PTHREADS_CFLAGS)
libplaceh_server_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_server_a_SOURCES = \
  vbk/pop_service_impl.cpp \
  vbk/pop_service_impl.hpp \
  addrdb.cpp \
  addrman.cpp \
  banman.cpp \
  blockencodings.cpp \
  blockfilter.cpp \
  chain.cpp \
  consensus/tx_verify.cpp \
  flatfile.cpp \
  httprpc.cpp \
  httpserver.cpp \
  index/base.cpp \
  index/blockfilterindex.cpp \
  index/txindex.cpp \
  interfaces/chain.cpp \
  interfaces/node.cpp \
  init.cpp \
  dbwrapper.cpp \
  miner.cpp \
  net.cpp \
  net_processing.cpp \
  node/coin.cpp \
  node/coinstats.cpp \
  node/context.cpp \
  node/psbt.cpp \
  node/transaction.cpp \
  noui.cpp \
  policy/fees.cpp \
  policy/rbf.cpp \
  policy/settings.cpp \
  pow.cpp \
  rest.cpp \
  vbk/rpc_register.hpp \
  vbk/rpc_register.cpp \
  vbk/p2p_sync.hpp \
  vbk/p2p_sync.cpp \
  rpc/blockchain.cpp \
  rpc/mining.cpp \
  rpc/misc.cpp \
  rpc/net.cpp \
  rpc/rawtransaction.cpp \
  rpc/server.cpp \
  script/sigcache.cpp \
  shutdown.cpp \
  timedata.cpp \
  torcontrol.cpp \
  txdb.cpp \
  txmempool.cpp \
  ui_interface.cpp \
  validation.cpp \
  validationinterface.cpp \
  versionbits.cpp \
  $(PLACEH_CORE_H)

if ENABLE_WALLET
libplaceh_server_a_SOURCES += wallet/init.cpp
endif
if !ENABLE_WALLET
libplaceh_server_a_SOURCES += dummywallet.cpp
endif

if ENABLE_ZMQ
libplaceh_zmq_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES) $(ZMQ_CFLAGS)
libplaceh_zmq_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_zmq_a_SOURCES = \
  zmq/zmqabstractnotifier.cpp \
  zmq/zmqnotificationinterface.cpp \
  zmq/zmqpublishnotifier.cpp \
  zmq/zmqrpc.cpp
endif


# wallet: shared between placehd and placeh-qt, but only linked
# when wallet enabled
libplaceh_wallet_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_wallet_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_wallet_a_SOURCES = \
  interfaces/wallet.cpp \
  wallet/coincontrol.cpp \
  wallet/crypter.cpp \
  wallet/db.cpp \
  wallet/feebumper.cpp \
  wallet/fees.cpp \
  wallet/load.cpp \
  wallet/psbtwallet.cpp \
  wallet/rpcdump.cpp \
  wallet/rpcwallet.cpp \
  wallet/scriptpubkeyman.cpp \
  wallet/wallet.cpp \
  wallet/walletdb.cpp \
  wallet/walletutil.cpp \
  wallet/coinselection.cpp \
  $(PLACEH_CORE_H)

libplaceh_wallet_tool_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_wallet_tool_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_wallet_tool_a_SOURCES = \
  wallet/wallettool.cpp \
  $(PLACEH_CORE_H)

# crypto primitives library
crypto_libplaceh_crypto_base_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libplaceh_crypto_base_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libplaceh_crypto_base_a_SOURCES = \
  crypto/aes.cpp \
  crypto/aes.h \
  crypto/chacha_poly_aead.h \
  crypto/chacha_poly_aead.cpp \
  crypto/chacha20.h \
  crypto/chacha20.cpp \
  crypto/common.h \
  crypto/hkdf_sha256_32.cpp \
  crypto/hkdf_sha256_32.h \
  crypto/hmac_sha256.cpp \
  crypto/hmac_sha256.h \
  crypto/hmac_sha512.cpp \
  crypto/hmac_sha512.h \
  crypto/poly1305.h \
  crypto/poly1305.cpp \
  crypto/ripemd160.cpp \
  crypto/ripemd160.h \
  crypto/sha1.cpp \
  crypto/sha1.h \
  crypto/sha256.cpp \
  crypto/sha256.h \
  crypto/sha512.cpp \
  crypto/sha512.h \
  crypto/siphash.cpp \
  crypto/siphash.h

if USE_ASM
crypto_libplaceh_crypto_base_a_SOURCES += crypto/sha256_sse4.cpp
endif

crypto_libplaceh_crypto_sse41_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libplaceh_crypto_sse41_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libplaceh_crypto_sse41_a_CXXFLAGS += $(SSE41_CXXFLAGS)
crypto_libplaceh_crypto_sse41_a_CPPFLAGS += -DENABLE_SSE41
crypto_libplaceh_crypto_sse41_a_SOURCES = crypto/sha256_sse41.cpp

crypto_libplaceh_crypto_avx2_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libplaceh_crypto_avx2_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libplaceh_crypto_avx2_a_CXXFLAGS += $(AVX2_CXXFLAGS)
crypto_libplaceh_crypto_avx2_a_CPPFLAGS += -DENABLE_AVX2
crypto_libplaceh_crypto_avx2_a_SOURCES = crypto/sha256_avx2.cpp

crypto_libplaceh_crypto_shani_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libplaceh_crypto_shani_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libplaceh_crypto_shani_a_CXXFLAGS += $(SHANI_CXXFLAGS)
crypto_libplaceh_crypto_shani_a_CPPFLAGS += -DENABLE_SHANI
crypto_libplaceh_crypto_shani_a_SOURCES = crypto/sha256_shani.cpp

# consensus: shared between all executables that validate any consensus rules.
libplaceh_consensus_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_consensus_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_consensus_a_SOURCES = \
  amount.h \
  arith_uint256.cpp \
  arith_uint256.h \
  consensus/merkle.cpp \
  consensus/merkle.h \
  consensus/params.h \
  consensus/tx_check.cpp \
  consensus/validation.h \
  hash.cpp \
  hash.h \
  prevector.h \
  primitives/block.cpp \
  primitives/block.h \
  primitives/transaction.cpp \
  primitives/transaction.h \
  pubkey.cpp \
  pubkey.h \
  script/placehconsensus.h \
  script/placehconsensus.cpp \
  script/interpreter.cpp \
  script/interpreter.h \
  script/script.cpp \
  script/script.h \
  script/script_error.cpp \
  script/script_error.h \
  serialize.h \
  span.h \
  tinyformat.h \
  uint256.cpp \
  uint256.h \
  util/strencodings.cpp \
  util/strencodings.h \
  version.h

# common: shared between placehd, and placeh-qt and non-server tools
libplaceh_common_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_common_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_common_a_SOURCES = \
  base58.cpp \
  bech32.cpp \
  bloom.cpp \
  bootstraps.cpp \
  chainparams.cpp \
  coins.cpp \
  compressor.cpp \
  core_read.cpp \
  core_write.cpp \
  key.cpp \
  key_io.cpp \
  merkleblock.cpp \
  netaddress.cpp \
  netbase.cpp \
  net_permissions.cpp \
  outputtype.cpp \
  policy/feerate.cpp \
  policy/policy.cpp \
  protocol.cpp \
  psbt.cpp \
  rpc/rawtransaction_util.cpp \
  rpc/util.cpp \
  scheduler.cpp \
  script/descriptor.cpp \
  script/sign.cpp \
  script/signingprovider.cpp \
  script/standard.cpp \
  versionbitsinfo.cpp \
  warnings.cpp \
  $(PLACEH_CORE_H)

# util: shared between all executables.
# This library *must* be included to make sure that the glibc
# backward-compatibility objects and their sanity checks are linked.
libplaceh_util_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_util_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_util_a_SOURCES = \
  support/lockedpool.cpp \
  chainparamsbase.cpp \
  clientversion.cpp \
  compat/glibc_sanity_fdelt.cpp \
  compat/glibc_sanity.cpp \
  compat/glibcxx_sanity.cpp \
  compat/strnlen.cpp \
  fs.cpp \
  interfaces/handler.cpp \
  logging.cpp \
  random.cpp \
  randomenv.cpp \
  rpc/request.cpp \
  support/cleanse.cpp \
  sync.cpp \
  threadinterrupt.cpp \
  util/bip32.cpp \
  util/bytevectorhash.cpp \
  util/error.cpp \
  util/fees.cpp \
  util/system.cpp \
  util/moneystr.cpp \
  util/rbf.cpp \
  util/settings.cpp \
  util/threadnames.cpp \
  util/spanparsing.cpp \
  util/strencodings.cpp \
  util/string.cpp \
  util/time.cpp \
  util/url.cpp \
  util/validation.cpp \
  $(PLACEH_CORE_H)

if GLIBC_BACK_COMPAT
libplaceh_util_a_SOURCES += compat/glibc_compat.cpp
AM_LDFLAGS += $(COMPAT_LDFLAGS)
endif

# cli: shared between placeh-cli and placeh-qt
libplaceh_cli_a_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
libplaceh_cli_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libplaceh_cli_a_SOURCES = \
  compat/stdin.h \
  compat/stdin.cpp \
  rpc/client.cpp \
  $(PLACEH_CORE_H)

nodist_libplaceh_util_a_SOURCES = $(srcdir)/obj/build.h
#

# placehd binary #
placehd_SOURCES = placehd.cpp
placehd_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
placehd_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
placehd_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
placehd_SOURCES += placehd-res.rc
endif

# Libraries below may be listed more than once to resolve circular dependencies (see
# https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking#circular-dependency)
placehd_LDADD = \
  $(VERIBLOCK_POP_CPP_LIBS) \
  $(LIBPLACEH_SERVER) \
  $(LIBPLACEH_WALLET) \
  $(LIBPLACEH_COMMON) \
  $(LIBUNIVALUE) \
  $(LIBPLACEH_UTIL) \
  $(LIBPLACEH_ZMQ) \
  $(LIBPLACEH_CONSENSUS) \
  $(LIBPLACEH_CRYPTO) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1)

placehd_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(MINIUPNPC_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(ZMQ_LIBS) $(VERIBLOCK_POP_CPP_LIBS)

# placeh-cli binary #
placeh_cli_SOURCES = placeh-cli.cpp
placeh_cli_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES) $(EVENT_CFLAGS)
placeh_cli_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
placeh_cli_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
placeh_cli_SOURCES += placeh-cli-res.rc
endif

placeh_cli_LDADD = \
  $(LIBPLACEH_CLI) \
  $(LIBUNIVALUE) \
  $(LIBPLACEH_UTIL) \
  $(LIBPLACEH_CRYPTO) \
  $(VERIBLOCK_POP_CPP_LIBS)

placeh_cli_LDADD += $(BOOST_LIBS) $(EVENT_LIBS)
#

# placeh-tx binary #
placeh_tx_SOURCES = placeh-tx.cpp
placeh_tx_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
placeh_tx_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
placeh_tx_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
placeh_tx_SOURCES += placeh-tx-res.rc
endif

placeh_tx_LDADD = \
  $(LIBUNIVALUE) \
  $(LIBPLACEH_COMMON) \
  $(LIBPLACEH_UTIL) \
  $(LIBPLACEH_CONSENSUS) \
  $(LIBPLACEH_CRYPTO) \
  $(LIBSECP256K1)

placeh_tx_LDADD += $(BOOST_LIBS) $(VERIBLOCK_POP_CPP_LIBS)
#

# placeh-wallet binary #
placeh_wallet_SOURCES = placeh-wallet.cpp
placeh_wallet_CPPFLAGS = $(AM_CPPFLAGS) $(PLACEH_INCLUDES)
placeh_wallet_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
placeh_wallet_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
placeh_wallet_SOURCES += placeh-wallet-res.rc
endif

placeh_wallet_LDADD = \
  $(LIBPLACEH_WALLET_TOOL) \
  $(LIBPLACEH_WALLET) \
  $(LIBPLACEH_COMMON) \
  $(LIBPLACEH_CONSENSUS) \
  $(LIBPLACEH_UTIL) \
  $(LIBPLACEH_CRYPTO) \
  $(LIBPLACEH_ZMQ) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1) \
  $(LIBUNIVALUE) \
  $(VERIBLOCK_POP_CPP_LIBS)

placeh_wallet_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(MINIUPNPC_LIBS) $(ZMQ_LIBS)
#

# placehconsensus library #
if BUILD_PLACEH_LIBS
include_HEADERS = script/placehconsensus.h
libplacehconsensus_la_SOURCES = support/cleanse.cpp $(crypto_libplaceh_crypto_base_a_SOURCES) $(libplaceh_consensus_a_SOURCES) $(VBK_H)

if GLIBC_BACK_COMPAT
  libplacehconsensus_la_SOURCES += compat/glibc_compat.cpp
endif

libplacehconsensus_la_LDFLAGS = $(AM_LDFLAGS) -no-undefined $(RELDFLAGS)
libplacehconsensus_la_LIBADD = $(LIBSECP256K1)
libplacehconsensus_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(builddir)/obj -I$(srcdir)/secp256k1/include -DBUILD_PLACEH_INTERNAL
libplacehconsensus_la_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)

endif
#

CTAES_DIST =  crypto/ctaes/bench.c
CTAES_DIST += crypto/ctaes/ctaes.c
CTAES_DIST += crypto/ctaes/ctaes.h
CTAES_DIST += crypto/ctaes/README.md
CTAES_DIST += crypto/ctaes/test.c

CLEANFILES = $(EXTRA_LIBRARIES)

CLEANFILES += *.gcda *.gcno
CLEANFILES += compat/*.gcda compat/*.gcno
CLEANFILES += consensus/*.gcda consensus/*.gcno
CLEANFILES += crypto/*.gcda crypto/*.gcno
CLEANFILES += policy/*.gcda policy/*.gcno
CLEANFILES += primitives/*.gcda primitives/*.gcno
CLEANFILES += script/*.gcda script/*.gcno
CLEANFILES += support/*.gcda support/*.gcno
CLEANFILES += univalue/*.gcda univalue/*.gcno
CLEANFILES += wallet/*.gcda wallet/*.gcno
CLEANFILES += wallet/test/*.gcda wallet/test/*.gcno
CLEANFILES += zmq/*.gcda zmq/*.gcno
CLEANFILES += obj/build.h

EXTRA_DIST = $(CTAES_DIST)


config/placeh-config.h: config/stamp-h1
	@$(MAKE) -C $(top_builddir) $(subdir)/$(@)
config/stamp-h1: $(top_srcdir)/$(subdir)/config/placeh-config.h.in $(top_builddir)/config.status
	$(AM_V_at)$(MAKE) -C $(top_builddir) $(subdir)/$(@)
$(top_srcdir)/$(subdir)/config/placeh-config.h.in:  $(am__configure_deps)
	$(AM_V_at)$(MAKE) -C $(top_srcdir) $(subdir)/config/placeh-config.h.in

clean-local:
	-$(MAKE) -C secp256k1 clean
	-$(MAKE) -C univalue clean
	-rm -f leveldb/*/*.gcda leveldb/*/*.gcno leveldb/helpers/memenv/*.gcda leveldb/helpers/memenv/*.gcno
	-rm -f config.h
	-rm -rf test/__pycache__

.rc.o:
	@test -f $(WINDRES)
	## FIXME: How to get the appropriate modulename_CPPFLAGS in here?
	$(AM_V_GEN) $(WINDRES) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(CPPFLAGS) -DWINDRES_PREPROC -i $< -o $@

check-symbols: $(bin_PROGRAMS)
if GLIBC_BACK_COMPAT
	@echo "Checking glibc back compat..."
	$(AM_V_at) READELF=$(READELF) CPPFILT=$(CPPFILT) $(PYTHON) $(top_srcdir)/contrib/devtools/symbol-check.py < $(bin_PROGRAMS)
endif

check-security: $(bin_PROGRAMS)
if HARDEN
	@echo "Checking binary security..."
	$(AM_V_at) READELF=$(READELF) OBJDUMP=$(OBJDUMP) $(PYTHON) $(top_srcdir)/contrib/devtools/security-check.py < $(bin_PROGRAMS)
endif

if EMBEDDED_LEVELDB
include Makefile.leveldb.include
endif

include Makefile.test_util.include

if ENABLE_TESTS
include Makefile.test.include
endif

if ENABLE_BENCH
include Makefile.bench.include
endif

if ENABLE_QT
include Makefile.qt.include
endif

if ENABLE_QT_TESTS
include Makefile.qttest.include
endif
