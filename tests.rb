# Test rcat against cat

working_dir = File.dirname(__FILE__)
data_dir    = "#{working_dir}/data"

text_file   = "#{data_dir}/sample.txt"
spaces_file = "#{data_dir}/sample_spaces.txt"

# Test simple output (no flags)
cat_output  = `cat #{text_file}`
rcat_output = `rcat #{text_file}`

fail "Failed 'cat == rcat'" unless cat_output == rcat_output

#multiple files
cat_output  = `cat #{text_file} #{spaces_file}`
rcat_output = `rcat #{text_file} #{spaces_file}`

fail "Failed 'cat file1 file2 == rcat file1 file2'" unless cat_output == rcat_output

# -n basic test
cat_output  = `cat -n #{text_file}`
rcat_output = `rcat -n #{text_file}`

fail "Failed 'cat -n == rcat -n (basic)'" unless cat_output == rcat_output

# -n mixed
cat_output  = `cat -n #{spaces_file}`
rcat_output = `rcat -n #{spaces_file}`

fail "Failed 'cat == rcat (mixed file)'" unless cat_output == rcat_output

# -b basic
cat_output  = `cat -b #{text_file} #{spaces_file}`
rcat_output = `rcat -b #{text_file} #{spaces_file}`

fail "Failed 'cat -b == rcat -b'" unless cat_output == rcat_output

# -E 
cat_output  = `cat -E #{text_file} #{spaces_file}`
rcat_output = `rcat -E #{text_file} #{spaces_file}`

fail "Failed 'cat -E == rcat -E'" unless cat_output == rcat_output

# -T
cat_output  = `cat -T #{spaces_file} #{spaces_file}`
rcat_output = `rcat -T #{spaces_file} #{spaces_file}`

fail "Failed 'cat -T == rcat -T'" unless cat_output == rcat_output

# -s
cat_output  = `cat -s #{spaces_file} #{spaces_file}`
rcat_output = `rcat -s #{spaces_file} #{spaces_file}`

fail "Failed 'cat -s == rcat -s'" unless cat_output == rcat_output

# all tags
cat_output  = `cat -nbET #{text_file} #{spaces_file}`
rcat_output = `rcat -nbET #{text_file} #{spaces_file}`

fail "Failed 'cat -nbET == rcat -nbET'" unless cat_output == rcat_output

# piped input
cat_output  = `ls -al #{data_dir} | cat`
rcat_output = `ls -al #{data_dir} | rcat`

fail "Failed 'cat/rcat piped in test'" unless cat_output == rcat_output

# piped output
cat_output  = `cat #{text_file} | grep d`
rcat_output = `rcat #{text_file} | grep d`

fail "Failed 'cat/rcat piped out test'" unless cat_output == rcat_output

# 
cat_output  = `cat < #{text_file}`
rcat_output = `rcat < #{text_file}`

fail "Failed 'cat < == rcat <' test" unless cat_output == rcat_output

# Final
puts "rcat: All tests passed"
