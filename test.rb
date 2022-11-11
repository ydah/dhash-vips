require "minitest/autorun"

require_relative "lib/dhash-vips"

# TODO tests about `fingerprint(4)`

[
  [DHashVips::DHash, :hamming, :calculate, 2, 23, 9, 53, 7],

    # vips-8.9.1-Tue Jan 28 13:05:46 UTC 2020
    # [[0, 14, 26, 27, 31, 27, 32, 28, 43, 43, 34, 37, 37, 34, 35, 42],
    #  [14, 0, 28, 25, 39, 35, 32, 32, 43, 43, 38, 41, 41, 38, 37, 50],
    #  [26, 28, 0, 13, 35, 41, 28, 30, 41, 41, 36, 33, 35, 32, 27, 36],
    #  [27, 25, 13, 0, 36, 36, 31, 35, 40, 40, 33, 32, 42, 35, 26, 33],
    #  [31, 39, 35, 36, 0, 16, 33, 33, 40, 40, 31, 24, 28, 33, 40, 31],
    #  [27, 35, 41, 36, 16, 0, 41, 41, 38, 38, 23, 26, 24, 29, 34, 27],
    #  [32, 32, 28, 31, 33, 41, 0, 10, 27, 25, 38, 35, 37, 32, 23, 34],
    #  [28, 32, 30, 35, 33, 41, 10, 0, 27, 27, 34, 31, 37, 36, 27, 34],
    #  [43, 43, 41, 40, 40, 38, 27, 27, 0, 2, 35, 34, 30, 31, 28, 27],
    #  [43, 43, 41, 40, 40, 38, 25, 27, 2, 0, 35, 34, 30, 31, 28, 27],
    #  [34, 38, 36, 33, 31, 23, 38, 34, 35, 35, 0, 9, 23, 26, 29, 18],
    #  [37, 41, 33, 32, 24, 26, 35, 31, 34, 34, 9, 0, 22, 25, 30, 19],
    #  [37, 41, 35, 42, 28, 24, 37, 37, 30, 30, 23, 22, 0, 19, 26, 23],
    #  [34, 38, 32, 35, 33, 29, 32, 36, 31, 31, 26, 25, 19, 0, 21, 26],
    #  [35, 37, 27, 26, 40, 34, 23, 27, 28, 28, 29, 30, 26, 21, 0, 23],
    #  [42, 50, 36, 33, 31, 27, 34, 34, 27, 27, 18, 19, 23, 26, 23, 0]]

    # vips-8.11.3-Wed Aug 11 09:29:27 UTC 2021
    # [[0, 17, 25, 30, 30, 26, 35, 30, 42, 42, 35, 32, 36, 32, 34, 42],
    #  [17, 0, 28, 27, 39, 35, 32, 29, 43, 43, 38, 39, 43, 37, 37, 49],
    #  [25, 28, 0, 13, 35, 41, 28, 29, 41, 41, 38, 35, 33, 31, 27, 37],
    #  [30, 27, 13, 0, 36, 36, 31, 34, 38, 38, 35, 32, 40, 34, 26, 32],
    #  [30, 39, 35, 36, 0, 16, 35, 34, 40, 40, 31, 26, 28, 34, 40, 30],
    #  [26, 35, 41, 36, 16, 0, 41, 44, 38, 38, 23, 28, 26, 30, 34, 24],
    #  [35, 32, 28, 31, 35, 41, 0, 11, 27, 27, 38, 35, 33, 33, 21, 35],
    #  [30, 29, 29, 34, 34, 44, 11, 0, 28, 28, 37, 32, 36, 40, 30, 38],
    #  [42, 43, 41, 38, 40, 38, 27, 28, 0, 0, 33, 34, 30, 32, 28, 30],
    #  [42, 43, 41, 38, 40, 38, 27, 28, 0, 0, 33, 34, 30, 32, 28, 30],
    #  [35, 38, 38, 35, 31, 23, 38, 37, 33, 33, 0, 11, 23, 27, 31, 17],
    #  [32, 39, 35, 32, 26, 28, 35, 32, 34, 34, 11, 0, 24, 26, 30, 20],
    #  [36, 43, 33, 40, 28, 26, 33, 36, 30, 30, 23, 24, 0, 20, 26, 22],
    #  [32, 37, 31, 34, 34, 30, 33, 40, 32, 32, 27, 26, 20, 0, 20, 26],
    #  [34, 37, 27, 26, 40, 34, 21, 30, 28, 28, 31, 30, 26, 20, 0, 24],
    #  [42, 49, 37, 32, 30, 24, 35, 38, 30, 30, 17, 20, 22, 26, 24, 0]]

    # v0.1.2.0
    # [[0, 18, 25, 27, 28, 25, 33, 31, 39, 40, 33, 35, 32, 28, 36, 47],
    #  [18, 0, 31, 25, 34, 33, 33, 33, 39, 38, 37, 43, 40, 36, 40, 53],
    #  [25, 31, 0, 16, 31, 38, 26, 32, 42, 41, 36, 38, 31, 31, 31, 32],
    #  [27, 25, 16, 0, 35, 36, 26, 32, 38, 37, 34, 34, 41, 37, 27, 34],
    #  [28, 34, 31, 35, 0, 17, 39, 37, 41, 44, 31, 27, 26, 32, 32, 33],
    #  [25, 33, 38, 36, 17, 0, 46, 40, 38, 39, 24, 28, 25, 31, 25, 30],
    #  [33, 33, 26, 26, 39, 46, 0, 10, 26, 25, 34, 32, 31, 35, 33, 30],
    #  [31, 33, 32, 32, 37, 40, 10, 0, 26, 27, 34, 32, 33, 33, 33, 34],
    #  [39, 39, 42, 38, 41, 38, 26, 26, 0, 3, 36, 34, 35, 33, 37, 28],
    #  [40, 38, 41, 37, 44, 39, 25, 27, 3, 0, 35, 35, 36, 36, 36, 27],
    #  [33, 37, 36, 34, 31, 24, 34, 34, 36, 35, 0, 10, 23, 31, 23, 22],
    #  [35, 43, 38, 34, 27, 28, 32, 32, 34, 35, 10, 0, 23, 29, 23, 20],
    #  [32, 40, 31, 41, 26, 25, 31, 33, 35, 36, 23, 23, 0, 20, 24, 21],
    #  [28, 36, 31, 37, 32, 31, 35, 33, 33, 36, 31, 29, 20, 0, 20, 25],
    #  [36, 40, 31, 27, 32, 25, 33, 33, 37, 36, 23, 23, 24, 20, 0, 17],
    #  [47, 53, 32, 34, 33, 30, 30, 34, 28, 27, 22, 20, 21, 25, 17, 0]]

    # v0.2.0.0
    # [[0, 18, 26, 28, 28, 24, 35, 31, 42, 42, 32, 34, 33, 29, 35, 40],
    #  [18, 0, 30, 24, 38, 34, 33, 33, 44, 42, 38, 42, 41, 37, 37, 50],
    #  [26, 30, 0, 16, 34, 38, 29, 35, 42, 40, 36, 38, 31, 31, 31, 36],
    #  [28, 24, 16, 0, 36, 36, 31, 35, 40, 38, 34, 34, 41, 37, 27, 34],
    #  [28, 38, 34, 36, 0, 14, 35, 33, 40, 42, 32, 26, 27, 33, 35, 28],
    #  [24, 34, 38, 36, 14, 0, 43, 39, 38, 40, 24, 28, 25, 31, 29, 28],
    #  [35, 33, 29, 31, 35, 43, 0, 8, 27, 25, 35, 33, 32, 32, 28, 31],
    #  [31, 33, 35, 35, 33, 39, 8, 0, 27, 27, 35, 33, 34, 34, 28, 33],
    #  [42, 44, 42, 40, 40, 38, 27, 27, 0, 2, 34, 32, 31, 33, 31, 28],
    #  [42, 42, 40, 38, 42, 40, 25, 27, 2, 0, 34, 34, 33, 35, 31, 28],
    #  [32, 38, 36, 34, 32, 24, 35, 35, 34, 34, 0, 10, 23, 31, 25, 18],
    #  [34, 42, 38, 34, 26, 28, 33, 33, 32, 34, 10, 0, 23, 29, 25, 16],
    #  [33, 41, 31, 41, 27, 25, 32, 34, 31, 33, 23, 23, 0, 20, 24, 19],
    #  [29, 37, 31, 37, 33, 31, 32, 34, 33, 35, 31, 29, 20, 0, 22, 27],
    #  [35, 37, 31, 27, 35, 29, 28, 28, 31, 31, 25, 25, 24, 22, 0, 23],
    #  [40, 50, 36, 34, 28, 28, 31, 33, 28, 28, 18, 16, 19, 27, 23, 0]]

  [DHashVips::IDHash, :distance, :fingerprint, 8, 21, 23, 72, 0],

    # vips-8.9.1-Tue Jan 28 13:05:46 UTC 2020
    # [[0, 16, 32, 35, 57, 45, 51, 50, 48, 47, 54, 48, 60, 50, 47, 56],
    #  [16, 0, 30, 34, 58, 47, 55, 56, 47, 50, 57, 49, 62, 52, 52, 61],
    #  [32, 30, 0, 9, 47, 54, 45, 41, 65, 62, 42, 37, 51, 44, 49, 49],
    #  [35, 34, 9, 0, 54, 64, 42, 40, 57, 56, 48, 39, 50, 40, 41, 51],
    #  [57, 58, 47, 54, 0, 22, 43, 45, 64, 61, 48, 47, 35, 43, 47, 48],
    #  [45, 47, 54, 64, 22, 0, 53, 54, 55, 54, 40, 46, 39, 42, 43, 42],
    #  [51, 55, 45, 42, 43, 53, 0, 6, 33, 35, 52, 43, 46, 45, 44, 47],
    #  [50, 56, 41, 40, 45, 54, 6, 0, 38, 41, 53, 50, 48, 45, 41, 42],
    #  [48, 47, 65, 57, 64, 55, 33, 38, 0, 9, 51, 53, 47, 47, 41, 46],
    #  [47, 50, 62, 56, 61, 54, 35, 41, 9, 0, 51, 57, 50, 49, 44, 43],
    #  [54, 57, 42, 48, 48, 40, 52, 53, 51, 51, 0, 10, 33, 36, 38, 25],
    #  [48, 49, 37, 39, 47, 46, 43, 50, 53, 57, 10, 0, 27, 30, 37, 27],
    #  [60, 62, 51, 50, 35, 39, 46, 48, 47, 50, 33, 27, 0, 20, 23, 28],
    #  [50, 52, 44, 40, 43, 42, 45, 45, 47, 49, 36, 30, 20, 0, 35, 39],
    #  [47, 52, 49, 41, 47, 43, 44, 41, 41, 44, 38, 37, 23, 35, 0, 19],
    #  [56, 61, 49, 51, 48, 42, 47, 42, 46, 43, 25, 27, 28, 39, 19, 0]]

    # vips-8.11.3-Wed Aug 11 09:29:27 UTC 2021
    # [[0, 17, 30, 35, 55, 46, 51, 54, 48, 46, 57, 48, 59, 52, 49, 54],
    #  [17, 0, 30, 37, 57, 46, 54, 55, 46, 49, 60, 50, 61, 54, 51, 58],
    #  [30, 30, 0, 12, 46, 57, 47, 42, 66, 59, 44, 37, 49, 44, 48, 49],
    #  [35, 37, 12, 0, 54, 67, 44, 41, 58, 53, 48, 41, 56, 42, 46, 48],
    #  [55, 57, 46, 54, 0, 23, 45, 43, 65, 63, 48, 48, 34, 42, 48, 47],
    #  [46, 46, 57, 67, 23, 0, 57, 56, 51, 50, 42, 48, 37, 38, 46, 40],
    #  [51, 54, 47, 44, 45, 57, 0, 6, 33, 34, 49, 43, 49, 41, 45, 47],
    #  [54, 55, 42, 41, 43, 56, 6, 0, 40, 39, 51, 50, 49, 40, 44, 44],
    #  [48, 46, 66, 58, 65, 51, 33, 40, 0, 10, 47, 53, 48, 46, 40, 46],
    #  [46, 49, 59, 53, 63, 50, 34, 39, 10, 0, 50, 57, 50, 49, 40, 43],
    #  [57, 60, 44, 48, 48, 42, 49, 51, 47, 50, 0, 9, 33, 32, 40, 23],
    #  [48, 50, 37, 41, 48, 48, 43, 50, 53, 57, 9, 0, 28, 27, 38, 28],
    #  [59, 61, 49, 56, 34, 37, 49, 49, 48, 50, 33, 28, 0, 21, 24, 27],
    #  [52, 54, 44, 42, 42, 38, 41, 40, 46, 49, 32, 27, 21, 0, 36, 35],
    #  [49, 51, 48, 46, 48, 46, 45, 44, 40, 40, 40, 38, 24, 36, 0, 21],
    #  [54, 58, 49, 48, 47, 40, 47, 44, 46, 43, 23, 28, 27, 35, 21, 0]]

    # v0.1.2.0
    # [[0, 17, 34, 40, 53, 43, 53, 52, 47, 47, 56, 44, 54, 51, 47, 57],
    #  [17, 0, 35, 33, 56, 45, 56, 52, 48, 49, 58, 49, 64, 57, 53, 58],
    #  [34, 35, 0, 8, 51, 57, 45, 40, 57, 54, 47, 40, 49, 47, 47, 48],
    #  [40, 33, 8, 0, 56, 62, 44, 40, 53, 47, 50, 41, 53, 41, 42, 47],
    #  [53, 56, 51, 56, 0, 21, 41, 48, 72, 65, 46, 47, 36, 43, 43, 43],
    #  [43, 45, 57, 62, 21, 0, 54, 56, 61, 60, 41, 47, 38, 39, 43, 39],
    #  [53, 56, 45, 44, 41, 54, 0, 12, 39, 40, 47, 44, 44, 38, 48, 41],
    #  [52, 52, 40, 40, 48, 56, 12, 0, 35, 36, 51, 50, 47, 39, 41, 43],
    #  [47, 48, 57, 53, 72, 61, 39, 35, 0, 11, 53, 53, 57, 48, 42, 51],
    #  [47, 49, 54, 47, 65, 60, 40, 36, 11, 0, 50, 54, 51, 49, 45, 47],
    #  [56, 58, 47, 50, 46, 41, 47, 51, 53, 50, 0, 13, 32, 36, 38, 23],
    #  [44, 49, 40, 41, 47, 47, 44, 50, 53, 54, 13, 0, 28, 30, 35, 27],
    #  [54, 64, 49, 53, 36, 38, 44, 47, 57, 51, 32, 28, 0, 21, 24, 28],
    #  [51, 57, 47, 41, 43, 39, 38, 39, 48, 49, 36, 30, 21, 0, 31, 35],
    #  [47, 53, 47, 42, 43, 43, 48, 41, 42, 45, 38, 35, 24, 31, 0, 19],
    #  [57, 58, 48, 47, 43, 39, 41, 43, 51, 47, 23, 27, 28, 35, 19, 0]]

    # v0.2.0.0
    # [[0, 17, 34, 40, 53, 43, 53, 52, 47, 47, 56, 44, 54, 51, 47, 57],
    #  [17, 0, 35, 33, 56, 45, 56, 52, 48, 49, 58, 49, 64, 57, 53, 58],
    #  [34, 35, 0, 8, 51, 57, 45, 40, 57, 54, 47, 40, 49, 47, 47, 48],
    #  [40, 33, 8, 0, 56, 62, 44, 40, 53, 47, 50, 41, 53, 41, 42, 47],
    #  [53, 56, 51, 56, 0, 21, 41, 48, 72, 65, 46, 47, 36, 43, 43, 43],
    #  [43, 45, 57, 62, 21, 0, 54, 56, 61, 60, 41, 47, 38, 39, 43, 39],
    #  [53, 56, 45, 44, 41, 54, 0, 12, 39, 40, 47, 44, 44, 38, 48, 41],
    #  [52, 52, 40, 40, 48, 56, 12, 0, 35, 36, 51, 50, 47, 39, 41, 43],
    #  [47, 48, 57, 53, 72, 61, 39, 35, 0, 11, 53, 53, 57, 48, 42, 51],
    #  [47, 49, 54, 47, 65, 60, 40, 36, 11, 0, 50, 54, 51, 49, 45, 47],
    #  [56, 58, 47, 50, 46, 41, 47, 51, 53, 50, 0, 13, 32, 36, 38, 23],
    #  [44, 49, 40, 41, 47, 47, 44, 50, 53, 54, 13, 0, 28, 30, 35, 27],
    #  [54, 64, 49, 53, 36, 38, 44, 47, 57, 51, 32, 28, 0, 21, 24, 28],
    #  [51, 57, 47, 41, 43, 39, 38, 39, 48, 49, 36, 30, 21, 0, 31, 35],
    #  [47, 53, 47, 42, 43, 43, 48, 41, 42, 45, 38, 35, 24, 31, 0, 19],
    #  [57, 58, 48, 47, 43, 39, 41, 43, 51, 47, 23, 27, 28, 35, 19, 0]]

].each do |lib, dm, calc, min_similar, max_similar, min_not_similar, max_not_similar, bw_exceptional|

  describe lib do

    # these are false positive by idhash
    # 6d97739b4a08f965dc9239dd24382e96.jpg
    # 1b1d4bde376084011d027bba1c047a4b.jpg
    [
      [ %w{
        1d468d064d2e26b5b5de9a0241ef2d4b.jpg 92d90b8977f813af803c78107e7f698e.jpg
        309666c7b45ecbf8f13e85a0bd6b0a4c.jpg 3f9f3db06db20d1d9f8188cd753f6ef4.jpg
        679634ff89a31279a39f03e278bc9a01.jpg df0a3b93e9412536ee8a11255f974141.jpg
        54192a3f65bd03163b04849e1577a40b.jpg 6d32f57459e5b79b5deca2a361eb8c6e.jpg
        4b62e0eef58bfbc8d0d2fbf2b9d05483.jpg b8eb0ca91855b657f12fb3d627d45c53.jpg
        21cd9a6986d98976b6b4655e1de7baf4.jpg 9b158c0d4953d47171a22ed84917f812.jpg
        9c2c240ec02356472fb532f404d28dde.jpg fc762fa286489d8afc80adc8cdcb125e.jpg
        7a833d873f8d49f12882e86af1cc6b79.jpg ac033cf01a3941dd1baa876082938bc9.jpg
      }, min_similar, max_similar], # slightly silimar images
      [ %w{
        71662d4d4029a3b41d47d5baf681ab9a.jpg ad8a37f872956666c3077a3e9e737984.jpg
      }, bw_exceptional, bw_exceptional], # these are the same photo but of different size and colorspace
    ].each do |_images, min, max|

      require "fileutils"
      require "digest"
      require "mll"

      require_relative "common"
      images = _images.map{ |_| download_if_needed "test_images/#{_}" }

      hashes = images.map &lib.method(calc)
      table = MLL::table[lib.method(dm), [hashes], [hashes]]

      require "pp"
      STDERR.puts ""
      PP.pp table, STDERR
      STDERR.puts ""

      hashes.size.times.to_a.repeated_combination(2) do |i, j|
        it "#{_images[i]} #{_images[j]}" do
          case
          when i == j
            assert_predicate table[i][j], :zero?
          when (j - i).abs == 1 && (i + j - 1) % 4 == 0
            # STDERR.puts [table[i][j], min, max].inspect
            assert_includes min..max, table[i][j]
          else
            # STDERR.puts [table[i][j], min_not_similar, max_not_similar].inspect
            assert_includes min_not_similar..max_not_similar, table[i][j]
          end
        end
      end

    end

    it "accepts Vips::Image" do
      lib.public_send calc, Vips::Image.new_from_buffer("GIF89a\x01\x00\x01\x00\x80\x01\x00\xFF\xFF\xFF\x00\x00\x00,\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02D\x01\x00;", "")
    end

  end

end
