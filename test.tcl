lappend auto_path .
package require tooltip
package require tooltip4

button .b -text Hello -command {
  ::tooltip4 hide .b
  ::tooltip4 update
  if {[incr ::ttt]%2} {
    puts "button's tooltip disabled"; bell
    ::tooltip4 too .b ""
    ::tooltip4 too .l "      Danger!\n\nDon't trespass!" \
      -fg white -bg red -font "-weight bold" -padx 20 -pady 15
  } else {
    puts "button's tooltip enabled"; bell
    ::tooltip4 config -fg black -bg #FBFB95 -padx 4 -pady 3 \
      -font "-size [expr {max(3,11-$::ttt/2)}] -weight normal"
    ::tooltip4 too .b "Hi again, world! \
      \nI feel [if $::ttt<2 {set _ great!} {set _ {smaller and smaller...}}]" \
      -force yes
    ::tooltip4 too .l "It's okay. Come on!" \
      {*}[::tooltip4 cget -fg -bg -font -padx -pady]
  }
  if {$::ttt>11} {set ::ttt -2}
}

set geo +999999+30  ;# 999999 to get it the most right
set alpha 0.8
button .b2 -text "Balloon at $geo" -command {::tooltip4 too "" \
  "It's a stand-alone balloon\nto view in black & white \
  \nbold font and $alpha opacity." -alpha $alpha -fg white -bg black \
  -font {-weight bold -size 11} -per10 3000 -pause 1500 -fade 1500 -geometry $geo}

label .l -text "Click me (tearoff popup)"

set m [menu .popupMenu]
$m add command -label "Popup menu item 1" -command bell
$m add command -label "Popup menu item 2" -command bell
bind .l <Button-3> {tk_popup .popupMenu %X %Y}

menu .menu -tearoff 0

set m .menu.file
menu $m -tearoff 0
.menu add cascade -label "File" -menu $m -underline 0
$m add command -label "Open..." -command {puts "\"Open...\" entry"}
$m add command -label "New" -command {puts "\"New\" entry"}
$m add command -label "Save" -command {puts "\"Save\" entry"}
$m add separator
$m add command -label "Exit" -command {exit}
set m .menu.help
menu $m -tearoff 0
.menu add cascade -label "Help" -menu $m -underline 0
$m add command -label "About" -command {puts "tooltip4 v[package require tooltip4]"}

text .t -width 24 -height 4
.t insert 1.0 "1st line: tag1\n2nd line: tag2\n3rd line: no tags"
.t tag configure UnderLine1 -font "-underline 1"
.t tag configure UnderLine2 -font "-weight bold"
.t tag add UnderLine1 1.10 1.15
.t tag add UnderLine2 2.10 2.15

pack .b .l .b2 .t
. configure -menu .menu

::tooltip4::configure -per10 1200 -fade 300 -font {-size 11}
::tooltip4::tooltip .b "Hello, world!\nIt's me o Lord!"
::tooltip4::tooltip .b2 "Displays a message at top right corner, having\
  \ncoordinates set with \"-geometry $geo\" option."
::tooltip4::tooltip .popupMenu "First" -index 1
::tooltip4::tooltip .popupMenu "2nd" -index 2
::tooltip4::tooltip .menu "File actions" -index 0
::tooltip4::tooltip .menu "Help actions" -index 1
::tooltip4::tooltip .menu.file "Opens a file\n(stub)" -index 0
::tooltip4::tooltip .menu.file "Creates a file\n(stub)" -index 1
::tooltip4::tooltip .menu.file "Saves a file\n(stub)" -index 2
::tooltip4::tooltip .menu.file "Closes the test" -index 4
::tooltip4::tooltip .menu.help "About the package" -index 0
::tooltip4::tooltip .t "There are two tags\nwith their own tips."
::tooltip4::tooltip .t "1st tag's tooltip!" -tag UnderLine1
::tooltip4::tooltip .t "2nd tag's tooltip!" -tag UnderLine2

puts "1 : [::tooltip4::cget]"
puts "2 : [::tooltip4::cget -fade -font]"
after 5000 {::tooltip4 config -on 0; puts "ALL disabled"; bell}
after 10000 {::tooltip4 config -on 1 -font {-weight bold}; puts "ALL enabled"; bell}
