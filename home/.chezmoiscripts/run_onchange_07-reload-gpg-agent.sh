#!/usr/bin/env bash
# shellcheck shell=bash

set -eufo pipefail

gpg-connect-agent reloadagent /bye >/dev/null 2>&1 || true
gpgconf --kill gpg-agent >/dev/null 2>&1 || true
