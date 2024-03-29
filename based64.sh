#!/bin/bash
# =============================================
# based64 [en/decoder] v0.1x | Author: Conzzah
# =============================================
clear; cd /; cd /home/$USER/Documents  #<-- standard savepath for files
# /// main functions start
function logo {
#echo "LAST CHANGE TO CODE @ [ 29.03.2024 / 21:01 ]"
echo "================================================"
echo "[ ~~~ BASE(D) 64 ENCODER / DECODER [v0.1x] ~~~ ]"
echo "================================================"
echo ""
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# menu stage 1 start (Main Menu)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main_menu {
clear; logo
echo "/ TEXT or FILE ?" # lets user choose between encoding/decoding either text or file
echo "~~~~~~~~~~~~~~~~~"
select tf in "text" "file"; do
	case $tf in 
	"text" ) text-menu; continue;;
	"file" ) file-menu; continue;; 
	esac
done
}
#~~~~~~~~~~~~~~~~~~~~
# menu stage 1 end
#~~~~~~~~~~~~~~~~~~~~
# menu stage 2 start
#~~~~~~~~~~~~~~~~~~~~
#text-menu
function text-menu {
clear; logo
echo "/ ENCODE or DECODE TEXT ?"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
select ed in "encode text" "decode text"; do
	case $ed in 
	"encode text" ) encode64_text; break;; 
	"decode text" ) decode64_text; break;; 
	esac
done
}
#file-menu
function file-menu {
clear; logo
echo "/ ENCODE or DECODE FILE ?"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
select ed in "encode file" "decode file"; do
	case $ed in 
	"encode file" ) encode64_file; break;; 
	"decode file" ) decode64_file; break;; 
	esac
done
}
#~~~~~~~~~~~~~~~~~~~~
# menu stage 2 end
#~~~~~~~~~~~~~~~~~~~~
#main functions start
#~~~~~~~~~~~~~~~~~~~~
#text_encode
function encode64_text {
clear; logo
echo "// ENCODE TEXT"
echo "~~~~~~~~~~~~~~~~~"
echo "paste or type text to encode:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; echo ""
read encode_text
echo ""
echo "RESULT:"
echo "~~~~~~~~"
echo $encode_text | base64;
echo ""
return2main_menu
}
#text_decode
function decode64_text {
clear; logo
echo "// DECODE TEXT"
echo "~~~~~~~~~~~~~~~~~"
echo "paste or type text to decode:"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; echo ""
read decode_text
echo ""
echo "RESULT:"
echo "~~~~~~~~"
echo $decode_text | base64 -d
echo ""
return2main_menu
}
#file_encode
function encode64_file {
clear; logo
echo "// ENCODE FILE"
echo "~~~~~~~~~~~~~~~"
echo "paste path to file:"
echo "~~~~~~~~~~~~~~~~~~~~~"; echo
read encode_file
echo "choose name for output file ( extension will be .txt by default )"; echo ""
read output_filename
base64 $encode_file > encoded64_$output_filename.txt
echo "file saved as: encoded64_$output_filename.txt"
unset $output_filename
return2main_menu
}
#file_decode
function decode64_file {
clear; logo
echo "// DECODE FILE"
echo "~~~~~~~~~~~~~~~"
echo "paste path to file:"
echo "~~~~~~~~~~~~~~~~~~~~~"; echo
read decode_file
echo "input filename & filetype ( name & format of the original file )"; echo "" 
read output_filename_filetype
base64 -d $decode_file > $output_filename_filetype
echo "file saved as: $output_filename_filetype"
unset $output_filename_filetype
return2main_menu
}
# return2main_menu
function return2main_menu {
echo "[ ~~~ PRESS ENTER FOR MAIN MENU ~~~ ]"
read -n 1 -s
main_menu
}
# main functions end \\\
# calls main_menu at the end to ensure all functions are set.
main_menu
