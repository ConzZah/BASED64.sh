#!/bin/bash
# ============================================
# based64 [en/decoder] v0.1 | Author: Conzzah
# ============================================
clear; cd /; cd /home/$USER/Documents  #<-- standard savepath for files
# begin setting functions
function logo {
echo "LAST CHANGE TO CODE @ [ 26.03.2024 / 02:42 ]"
echo "==============================================="
echo "[ ~~~ BASE(D) 64 ENCODER / DECODER [v0.1] ~~~ ]"
echo "==============================================="
echo ""
}

# menu stage 2 start
#~~~~~~~~~~~~~~~~~~~~
#text-menu
function _text-menu {
select ed in "encode text" "decode text"; do
	case $ed in 
	"encode text" ) encode64_text; break;; 
	"decode text" ) decode64_text; break;; 
	esac
done
}

#file-menu
function _file-menu {
select ed in "encode file" "decode file"; do
	case $ed in 
	"encode file" ) encode64_file; break;; 
	"decode file" ) decode64_file; break;; 
	esac
done
}

# menu stage 2 end
#~~~~~~~~~~~~~~~~~~~~
#main functions start
#~~~~~~~~~~~~~~~~~~~~
#text_encode
function encode64_text {
clear
logo; echo ""
echo "// ENCODE TEXT"
echo "~~~~~~~~~~~~~~~~~"
echo "paste or type text to encode:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; echo ""
read encode_text
echo ""
echo "RESULT:"
echo "~~~~~~~"
echo $encode_text | base64;
echo ""
}

#text_decode
function decode64_text {
clear
logo; echo ""
echo "// DECODE TEXT"
echo "~~~~~~~~~~~~~~~~~"
echo "paste or type text to decode:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; echo ""
read decode_text
echo ""
echo "RESULT:"
echo "~~~~~~~"
echo $decode_text | base64 -d
echo ""
}

#file_encode
function encode64_file {
clear
logo; echo ""
echo "// ENCODE FILE"
echo "~~~~~~~~~~~~~~~"
echo "paste path to file:"; echo ""
read encode_file
echo "choose name for output file ( format set to .txt by default )"
read output_filename
base64 $encode_file > encoded64_$output_filename.txt
echo ""; echo "file saved as: encoded64_$output_filename.txt"
unset $output_filename
}

#file_decode
function decode64_file {
clear
logo; echo ""
echo "// DECODE FILE"
echo "~~~~~~~~~~~~~~~"
echo "paste path to file:"; echo ""
read decode_file
echo "input filename & filetype ( any name & format of the original file )"; echo "" 
read output_filename_filetype
base64 -d $decode_file > $output_filename_filetype
echo "file saved as: $output_filename_filetype"
unset $output_filename_filetype
}

# main functions end
#~~~~~~~~~~~~~~~~~~~~
# menu stage 1 start
#~~~~~~~~~~~~~~~~~~~~
# lets user choose between encoding/decoding either text or file
logo; echo "ENCODE / DECODE TEXT OR FILE?"; echo ""
select sf in "text" "file"; do
	case $sf in 
	"text" ) _text-menu; continue;;
	"file" ) _file-menu; continue;; 
	esac
done
#menu stage 1 end