angular.module "dStorage"
.service "CompressService", () ->
  class CompressService
    constructor: () ->
    compress: (blob) ->
      LZString.compressToUTF16 blob
    decompress: (compressedString) ->
      LZString.decompressFromUTF16 compressedString
