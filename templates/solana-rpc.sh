#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Remove empty snapshots
find "{{ solana_ledger_location }}" -name 'snapshot-*' -size 0 -print -exec rm {} \; || true

# Start solana rpc node, intended to be used with journalctl/systemctl. Logs will go to journalctl.
exec /home/solana/.local/share/solana/install/active_release/bin/agave-validator \
    --identity /home/solana/identity.json \
    --known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --known-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
    --known-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
    --known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
    --account-index program-id \
    --account-index spl-token-owner \
    --account-index spl-token-mint \
    --only-known-rpc \
    --full-rpc-api \
    --rpc-pubsub-enable-block-subscription \
    --no-genesis-fetch \
    --no-snapshot-fetch \
    --enable-rpc-transaction-history \
    --enable-extended-tx-metadata-storage \
    --no-voting \
    --ledger /solana/ledger \
    --accounts /solana/accounts \
    --log /home/solana/solana-rpc.log \
    --rpc-port 8899 \
    --rpc-bind-address 0.0.0.0 \
    --private-rpc \
    --dynamic-port-range 8000-8020 \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --wal-recovery-mode skip_any_corrupted_record \
    --limit-ledger-size 100000000


