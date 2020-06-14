<?php
error_reporting(0);
require_once './script/pdocrud.php'; 
include './includes/header.php';



$conn = mysqli_connect($config["hostname"],$config["username"],$config["password"],$config["database"]);

function dateFormat($string){//MOST IMPORTANT FUNCTION
		
		$string = str_replace("-","/", $string);
		$trydate = date("d-M-Y", strtotime($string));
		return $trydate;
	}

function getPercentOfNumber($number, $percent){
    return ($percent / 100) * $number;
}



function numberTowords($num)
{ 
			$ones = array( 
			1 => "one", 
			2 => "two", 
			3 => "three", 
			4 => "four", 
			5 => "five", 
			6 => "six", 
			7 => "seven", 
			8 => "eight", 
			9 => "nine", 
			10 => "ten", 
			11 => "eleven", 
			12 => "twelve", 
			13 => "thirteen", 
			14 => "fourteen", 
			15 => "fifteen", 
			16 => "sixteen", 
			17 => "seventeen", 
			18 => "eighteen", 
			19 => "nineteen" 
			); 
			$tens = array( 
			1 => "ten",
			2 => "twenty", 
			3 => "thirty", 
			4 => "forty", 
			5 => "fifty", 
			6 => "sixty", 
			7 => "seventy", 
			8 => "eighty", 
			9 => "ninety" 
			); 
			$hundreds = array( 
			"hundred", 
			"thousand", 
			"million", 
			"billion", 
			"trillion", 
			"quadrillion" 
			); //limit t quadrillion 
			
			
			$num = number_format($num,2,".",","); 
			$num_arr = explode(".",$num); 
			$wholenum = $num_arr[0]; 
			$decnum = $num_arr[1]; 
			$whole_arr = array_reverse(explode(",",$wholenum)); 
			krsort($whole_arr); 
			$rettxt = ""; 
			foreach($whole_arr as $key => $i){ 
			if($i < 20){ 
			$rettxt .= $ones[$i]; 
			}elseif($i < 100){ 
			$rettxt .= $tens[@substr($i,0,1)]; 
			$rettxt .= " ".$ones[@substr($i,1,1)]; 
			}else{ 
			$rettxt .= $ones[@substr($i,0,1)]." ".$hundreds[0]; 
			$rettxt .= " ".$tens[@substr($i,1,1)]; 
			$rettxt .= " ".$ones[@substr($i,2,1)]; 
			} 
			if($key > 0){ 
				$rettxt .= " ".$hundreds[$key]." "; 
			} 
			} 
			if($decnum > 0){ 
				$rettxt .= " and "; 
			if($decnum < 20){ 
					$rettxt .= $ones[$decnum]; 
			}elseif($decnum < 100){ 
					$rettxt .= $tens[substr($decnum,0,1)]; 
					$rettxt .= " ".$ones[substr($decnum,1,1)]; 
			} 
		} 
return $rettxt; 
} 




if((isset($_GET["id"]))  && (is_numeric($_GET["id"])) && ($_GET["id"] != '')){

	$id = $_GET["id"];
	$sqlSelect = 'select * from orders where ID="'.$id.'"';
	
    $result = mysqli_query($conn, $sqlSelect);
	

}else{
		echo 'Something went wrong Please try later';
		//exit(0);
}



if($result){

	$row = mysqli_fetch_array($result);
	$seller=$row["seller"];

$sellerstatecode='';
$sellerstate='';
//Seller Details
if($seller){

		$sellerqry="select * from profile where id=".$seller;
        $res_seller = mysqli_query($conn, $sellerqry);
		$row_seller = mysqli_fetch_array($res_seller);
		
		$sellername=$row_seller['name'];
		$selleremail=$row_seller['email'];
		$selleraddress=$row_seller['address'];
		$sellergstno=$row_seller['gstno'];
        $sellerpanno=$row_seller['panno'];
		$sellerlogo=$row_seller['logo'];
		$sellerstatecode=$row_seller['state'];
        $sellerbankdetails=$row_seller['bankdetails'];
		if($sellerstatecode != ''){
				$sellerstqry="select * from state where code='".$sellerstatecode."'";

				$res_sellerst = mysqli_query($conn, $sellerstqry);
				$rowst = mysqli_fetch_array($res_sellerst);
				$sellerstate=$rowst['name'];
				

		}else{
			$sellerstatecode='';
			$sellerstate='';
		}


	}else{

		$sellername='';
		$sellername='';
		$selleremail='';
		$selleraddress='';
		$sellergstno='';
        $sellerpanno='';
		$sellerlogo='';
		$sellerbankdetails='';
		
		
	}

//Order Details
$orderid=$_GET["id"];
$ordersuffix=$row["order_suffix"];
if($ordersuffix == ''){
		$ordersuffix='';
}	
$orderno=$ordersuffix.'/'.$orderid;
$orderdate=dateFormat($row["order_date"]);
$po=$row["PO"];
if($po == ''){
	$po='';
}

//Customer details
$custaddr='';
$custname='';
$custname=$row["customer_name"];
$custaddr=$row["customer_address"];
$qty=$row["qty"];

if($custname != ''){
				$custqry="select * from customers where customer_name='".$custname."'";

				$res_cust = mysqli_query($conn, $custqry);
				$rowcust = mysqli_fetch_array($res_cust);
				$custstatecode=$rowcust['customer_state'];

				if($custstatecode !=''){
						$custstateqry="select * from state where code='".$custstatecode."'";
						$res_custst = mysqli_query($conn, $custstateqry);
						$rowcustst = mysqli_fetch_array($res_custst);
						$custstate=$rowcustst['name'];
				}else{
						$custstate='';
				}

				$custgst=$rowcust['gstno'];

		}else{
			
			$custgst='';
		}

//Invoice Product Description

$categoryid=$row["category"];
				if($categoryid != ''){
	
						$catqry="select * from category where category_id='".$categoryid."'";
						$res_cat = mysqli_query($conn, $catqry);
						$rowcat = mysqli_fetch_array($res_cat);
						$catname=$rowcat['name'];
						$cathsn=$rowcat['HSN'];
				}else{
						$catname='';
						$cathsn='';
				}
//Amount
$amt=$row["order_amount"];
$cgstrate=$row["CGST"];
$sgstrate=$row["SGST"];

$cgst=ceil(getPercentOfNumber($amt*$qty ,$cgstrate));
$sgst=ceil(getPercentOfNumber($amt*$qty,$sgstrate));
$totalAmt=($qty*$amt)+$cgst+$sgst;
?>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title></title>
	<meta name="generator" content="LibreOffice 6.0.7.3 (Linux)"/>
	<meta name="author" content="Dell"/>
	<meta name="created" content="2017-06-23T08:43:34"/>
	<meta name="changedby" content="Abhishek"/>
	<meta name="changed" content="2019-04-12T11:42:28"/>
	<meta name="AppVersion" content="16.0300"/>
	<meta name="DocSecurity" content="0"/>
	<meta name="HyperlinksChanged" content="false"/>
	<meta name="LinksUpToDate" content="false"/>
	<meta name="ScaleCrop" content="false"/>
	<meta name="ShareDoc" content="false"/>
	
	<style type="text/css">
		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:"Calibri"; font-size:x-small }
		a.comment-indicator:hover + comment { background:#ffd; position:absolute; display:block; border:1px solid black; padding:0.5em;  } 
		a.comment-indicator { background:red; display:inline-block; border:1px solid black; width:0.5em; height:0.5em;  } 
		comment { display:none;  } 
	</style>
	
</head>

<body>
<table cellspacing="0" border="0">
	<colgroup width="24"></colgroup>
	<colgroup width="102"></colgroup>
	<colgroup width="35"></colgroup>
	<colgroup span="2" width="31"></colgroup>
	<colgroup width="39"></colgroup>
	<colgroup width="57"></colgroup>
	<colgroup width="50"></colgroup>
	<colgroup width="65"></colgroup>
	<colgroup span="2" width="37"></colgroup>
	<colgroup width="18"></colgroup>
	<colgroup width="37"></colgroup>
	<colgroup width="50"></colgroup>
	<colgroup width="46"></colgroup>
	<colgroup width="42"></colgroup>
	<tr>

		<td style="border-top: 2px solid #000000; border-left: 2px solid #000000" height="27" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000" align="left" valign=middle><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000" colspan=10 align="center" valign=bottom><b><font face="Bookman Old Style" size=4 color="#000000"><?php echo $sellername;?></font></b></td>
		<td style="border-top: 2px solid #000000" align="left" valign=top><b><font color="#000000"><br></font></b></td>
		<td style="border-top: 2px solid #000000" align="left" valign=top><b><font color="#000000"><br></font></b></td>
		<td style="border-top: 2px solid #000000; border-right: 2px solid #000000" align="left" valign=top><b><font color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td style="border-left: 2px solid #000000" colspan=2 rowspan=3 height="82" align="center" valign=middle><b><font color="#000000"><br><img src="<?php echo $sellerlogo;?>" width=85 height=66 hspace=21 vspace=9>
		</font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td colspan=9 align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><?php echo $selleraddress;?></font></b></td>
		<td style="border-right: 2px solid #000000" colspan=3 rowspan=2 align="center" valign=middle><b><font color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000">Email:<?php echo $selleremail;?></font></b></td>
		<td align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td style="border-bottom: 2px solid #000000" align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="left" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" colspan=6 align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"> <?php echo 'GSTIN:'.$sellergstno .'| PAN:'.$sellerpanno;?></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="center" valign=bottom><b><font face="Bookman Old Style" size=3 color="#000000"><br></font></b></td>
		<td style="border-bottom: 2px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-bottom: 2px solid #000000; border-right: 2px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
	</tr>


	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=16 height="15" align="center" valign=bottom><font color="#000000"><br></font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=16 rowspan=2 height="42" align="center" valign=middle bgcolor="#BDD7EE"><b><font face="Bookman Old Style" size=6 color="#000000">Invoice</font></b></td>
		</tr>
	<tr>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 height="19" align="left" valign=top><b><font color="#000000">Document No:<?php echo $orderno;?></font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="left" valign=bottom><b><font color="#000000">Against invoice: <?php echo $po;?></font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 height="20" align="left" valign=top><b><font color="#000000">Date of Issue: <?php echo $orderdate; ?></font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="left" valign=bottom><b><font color="#000000">Date of Invoice:<?php echo $orderdate; ?></font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=6 height="20" align="left" valign=top><b><font color="#000000">State:<?php echo $sellerstate;?></font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><b><font color="#000000">Code</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=bottom><b><font color="#000000"><?php echo $sellerstatecode;?></font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="left" valign=bottom><b><font color="#000000"><br></font></b></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=16 height="15" align="center" valign=bottom><b><font color="#000000"><br></font></b></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 height="20" align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">Bill to Party</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">Ship to Party</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 height="19" align="left" valign=bottom><b><font color="#000000">Name:<?php echo $custname;?> </font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="left" valign=bottom><b><font color="#000000">Name:</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 rowspan=2 height="39" align="left" valign=top><b><font color="#000000">Address:<?php echo $custaddr;?><br></font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 rowspan=2 align="left" valign=top><b><font color="#000000">Address:</font></b></td>
		</tr>
	<tr>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 height="20" align="left" valign=top><b><font color="#000000">GSTIN: <?php echo $custgst; ?><br></font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=8 align="left" valign=top><b><font color="#000000">GSTIN:</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=6 height="20" align="left" valign=bottom><b><font color="#000000">State:<?php echo $custstate; ?></font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><b><font color="#000000">Code</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=bottom><b><font color="#000000"><?php echo $custstatecode; ?></font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=6 align="left" valign=bottom><b><font color="#000000">State:</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><b><font color="#000000">Code</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=bottom><b><font color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td style="border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=16 height="15" align="center" valign=bottom><font color="#000000"><br></font></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" rowspan=2 height="39" align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">S. No.</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Product Description</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">HSN code</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">UOM</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Qty</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Rate</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Amount</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Discount</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=1 color="#000000">Taxable Value</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=3 align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">CGST</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">SGST</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 rowspan=2 align="center" valign=middle bgcolor="#BDD7EE"><b><font size=3 color="#000000">Total</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom bgcolor="#BDD7EE"><b><font size=1 color="#000000">Rate</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom bgcolor="#BDD7EE"><b><font size=1 color="#000000">Amount</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom bgcolor="#BDD7EE"><b><font size=1 color="#000000">Rate</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom bgcolor="#BDD7EE"><b><font size=1 color="#000000">Amount</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="right" valign=bottom ><font color="#000000">1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><?php echo $catname;?> </font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"><?php echo $qty;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br><?php echo $amt;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"><?php echo $amt*$qty;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"><?php echo $amt*$qty;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"><?php echo $cgstrate;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom "><font color="#000000"><?php echo $cgst;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"><?php echo $sgstrate;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom "><font color="#000000"><?php echo $cgst;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000"><?php echo $totalAmt;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000">HSN:<?php echo $cathsn;?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000"></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="19" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="20" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=bottom ><font color="#000000">0</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000">0</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" colspan=4 height="40" align="center" valign=middle bgcolor="#DEEBF7"><b><font face="Bookman Old Style" size=5 color="#000000">Total</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=middle ><font color="#000000">1</font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=middle ><font color="#000000"><?php echo $amt;?></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=middle ><font color="#000000">0</font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign=middle ><font color="#000000"><?php echo $amt;?></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="center" valign=middle "><font color="#000000"><?php echo $cgst;?></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000" align="left" valign=middle><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-right: 1px solid #000000" align="right" valign=middle "><font color="#000000"><?php echo $sgst;?></font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=middle ><font color="#000000"><?php echo $totalAmt;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=9 height="20" align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">Total amount in words</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" colspan=5 align="left" valign=bottom><b><font color="#000000">Total Amount before Tax</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000"><?php echo $amt;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=9 rowspan=4 height="78" align="center" valign=bottom><font color="#000000"><?php echo @numberTowords("$totalAmt").'only'; ?></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" colspan=5 align="left" valign=bottom><b><font color="#000000">Add: CGST</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom "><font color="#000000"><?php echo $cgst;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" colspan=5 align="left" valign=bottom><b><font color="#000000">Add: SGST</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom "><font color="#000000"><?php echo $sgst;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" colspan=5 align="left" valign=bottom><b><font color="#000000">Total Tax Amount</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000"><?php echo $cgst+$sgst;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=5 align="left" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">Total Amount after Tax:</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=2 align="center" valign=bottom ><font color="#000000"><?php echo $totalAmt;?></font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-left: 2px solid #000000" colspan=6 height="20" align="center" valign=bottom bgcolor="#BDD7EE"><b><font color="#000000">Bank Details</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=3 rowspan=5 align="center" valign=bottom><font color="#000000"><br></font></td>
		<td style="border-top: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 align="center" valign=middle><font face="Bookman Old Style" size=1 color="#000000">Certified that the particulars given above are true and correct</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" colspan=6 height="19" align="left" valign=bottom><b><font color="#000000"><?php echo $sellerbankdetails; ?></font></b></td>
		<td style="border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 align="center" valign=bottom><b><font color="#000000"></font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=6 height="20" align="left" valign=bottom><b><font color="#000000"></font></b></td>
		<td style="border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 rowspan=3 align="center" valign=bottom><b><font color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td style="border-bottom: 2px solid #000000; border-left: 2px solid #000000" colspan=6 rowspan=3 height="59" align="center" valign=top><b><font color="#000000">Terms &amp; conditions</font></b></td>
		</tr>
	<tr>
		</tr>
	<tr>
		<td style="border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=bottom><b><font color="#000000">Common Seal</font></b></td>
		<td style="border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 align="center" valign=bottom><b><font color="#000000">Authorised signatory</font></b></td>
		</tr>
</table>

</body>

</html>

<?php }else{
	
		echo 'Something went wrong please try later !';	
}?>
