#!/usr/bin/env bash

# Current running process belongs to user `node`, so need to update corresponding owner/group to WRITE to `uploads` dir
sudo chown node.node /hedgedoc/public/uploads

# Start server
# https://docs.hedgedoc.org/setup/manual-setup/
NODE_ENV=production yarn start
