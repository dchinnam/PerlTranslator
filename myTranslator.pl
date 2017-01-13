#Deepank Chinnam
#W1175796

#!/usr/bin/perl
#use String::Util qw(trim);


$android = 0;
$ios = 0;
$windows = 0;

sub  trim {
  my $value = shift;
   $value =~ s/^\s+|\s+$//g;
   return $value;
  }

open ($fh, '<' ,"cell-phones.csv") or die("File Error");
while($line = <$fh>){
  if ($line =~ /^\s*#/ || $line =~ /^$/) {
    next;   #similar to continue command
    }
  @phone = split(',', $line);
  if ( trim($phone[1]) eq 'android') {
    $android += $phone[2];
    }
	if (trim($phone[1]) eq 'ios') {
    $ios += $phone[2];
    }
	if (trim($phone[1]) eq 'windows') {
    $windows += $phone[2];
    }
}
close $fh;

$rectangle_android = $android / 10;
$rectangle_ios = $ios / 10;
$rectangle_windows = $windows / 10;



open($fh,'>' ,"cell-phones_W1175796.html") or die("File Error");
$html = '<!DOCTYPE html>'.
'<head>'.
'<title>Cell-phone Usage</title>'.
'<meta charset="utf-8" />'.
'<link rel="stylesheet" href="grid.css">'.
'<link rel="stylesheet" href="styles.css">'.
'</head>'.
'<body>'.
'<h1 style="text-align:center;color:#FD9C9C">Survey - Usage of cell phones</h1>'.
'<div id="container">'.
  '<div class="row">'.
    '<div class="col-12>">'.
      '<svg height="100%" width="100%" xmlns=http://www.w3.org/2000/svg version="1.1">'.
        '<rect width="'.$rectangle_android.'%" height="100%" style="fill:#99CC00;stroke-width:5;stroke:black"/>'.
        '<animate attributeType="CSS" attributeName="opacity" from="0" to="1" dur="8s" repeatCount="definite" />'.
      '</svg>'.
      '<svg height="100%" width="100%">'.
        '<text style="font-size:20;font-weight:bold;" x="0" y="15" fill="#99CC00">Android</text>'.
      '</svg>'.
    '</div>'.
  '</div>'.
  '<div class="row">'.
    '<div class="col-12>">'.
      '<svg height="100%" width="100%" xmlns=http://www.w3.org/2000/svg version="1.1">'.
          '<rect width="'.$rectangle_ios.'%" height="100%" style="fill:#C1C1C1;stroke-width:5;stroke:black"/>'.
          '<animate attributeType="CSS" attributeName="opacity" from="0" to="1" dur="8s" repeatCount="definite" />'.
      '</svg>'.
      '<svg height="100%" width="100%">'.
        '<text style="font-size:20;font-weight:bold;" x="0" y="15" fill="#C1C1C1">iOS</text>'.
      '</svg>'.
    '</div>'.
  '</div>'.
  '<div class="row">'.
    '<div class="col-12>">'.
    '<svg height="100%" width="100%" xmlns=http://www.w3.org/2000/svg version="1.1">'.
      '<rect width="'.$rectangle_windows.'%" height="100%" style="fill:#0078D7;stroke-width:5;stroke:black"/>'.
      '<animate attributeType="CSS" attributeName="opacity" from="0" to="1" dur="8s" repeatCount="definite" />'.
    '</svg>'.
      '<svg height="30" width="100%" >'.
        '<text style="font-size:20;font-weight:bold;" x="0" y="15" fill="#0078D7">Windows</text>'.
      '</svg>'.
    '</div>'.
  '</div>'.
'</div>'.
'</body>'.
'</html>';

print $fh $html;
close $fh;
