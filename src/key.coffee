'use strict'


# Key
#
# @copyright Andrew Lawson 2012
# @see http://github.com/adlawson/key
# @see http://npmjs.org/package/key
# @see http://opensource.org/licenses/mit-license.php MIT License


# Dependencies
{isRef, assertRef} = require './ref'


# Namespace
ns = {}


# Keycodes
ns.code =
  special: require './code/special'
  arrow: require './code/arrow'
  alnum: require './code/alnum'
  brand: require './code/brand'


# Get pressed key information
#
# @param [Number] pressed
# @return [Reference]
ns.get = (pressed) =>
  iterator = (context) ->
    for own key, ref of context
      if isRef ref
        return ref if ns.is ref, pressed
      else
        out = iterator ref
        return out if isRef out
  iterator ns.code


# Compare a pressed key against a reference
#
# @param [Reference] ref
# @param [Number] pressed
# @return [Boolean]
ns.is = (ref, pressed) =>
  pressed is assertRef(ref).code


# Exports
window.key = ns if typeof window isnt 'undefined'
module.exports = ns
