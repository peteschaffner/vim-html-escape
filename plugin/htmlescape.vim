" via: http://vim.wikia.com/wiki/HTML_entities
function! HTMLEncode()
ruby << EOF
  @str=VIM::Buffer.current.line
  VIM::Buffer.current.line=@str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
EOF
endfunction

map <silent> <Leader>he :call HTMLEncode()<CR>
