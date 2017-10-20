require 'benchmark/ips'
require 'base64'
require_relative '../lib/fb64'

str = "aなbcdef漢字ghijklmnopqrstuvwxyz!@#$%^&*()0987654321-=[];'/.,><な?\1" * 50_000

Benchmark.ips do |b|
  b.time = 30
  b.report("FB64 encode large string") { FB64.encode64(str) }
  b.report("Base64 encode large string") { Base64.encode64(str) }
  b.compare!
end

encoded = FB64.encode64(str)

Benchmark.ips do |b|
  b.time = 30
  b.report("FB64 decode large string") { FB64.encode64(encoded) }
  b.report("Base64 decode large string") { Base64.encode64(encoded) }
  b.compare!
end

str = "Hello world" * 10

Benchmark.ips do |b|
  b.time = 30
  b.report("FB64 encode small string") { FB64.encode64(str) }
  b.report("Base64 encode small string") { Base64.encode64(str) }
  b.compare!
end

encoded = FB64.encode64(str)

Benchmark.ips do |b|
  b.time = 30
  b.report("FB64 decode small string") { FB64.encode64(encoded) }
  b.report("Base64 decode small string") { Base64.encode64(encoded) }
  b.compare!
end
