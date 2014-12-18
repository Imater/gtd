#config installer and base config
_ = require "lodash"

baseConfig =
  env:
    process.env.NODE_ENV or "development"

module.exports = _.merge baseConfig,
  (require "./#{process.env.NODE_ENV || "development"}.coffee") or {}
