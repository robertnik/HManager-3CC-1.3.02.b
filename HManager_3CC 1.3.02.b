// ==UserScript==
// @name        HManager_3CC
// @namespace   @nas272
// @include     http://192.168.*.1/html/home.html
// @version     1.3.02.b mod 3CC
// @resource     jQueryUI https://code.jquery.com/ui/1.12.1/jquery-ui.js
// @resource    jQueryUICSS https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css
// @grant       GM_addStyle
// @grant       GM_getResourceText
// ==/UserScript==

$ = unsafeWindow.$;
var newCSS = GM_getResourceText ("jQueryUICSS");
GM_addStyle (newCSS);

var script = document.createElement('script');
script.src = '../js/mobilenetworksettings.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

var script1 = document.createElement('script');
script1.type = 'text/javascript';
var jQueryUI = GM_getResourceText('jQueryUI');
script1.innerHTML = jQueryUI;
document.getElementsByTagName('head')[0].appendChild(script1);

var script2 = document.createElement('script');
script2.type = 'text/javascript';
script2.innerHTML = 'var is4G = false;var rscp = 0;'
  + 'function status() {'
	+ '$.get(\'/api/monitoring/status\', function (data) {'
	+	'var xml = data,'
	+	'xmlDoc = $.parseXML(xml),'
	+	'$xml = $(xmlDoc);'
	+	'$(\'#ip\').html($xml.find(\'WanIPAddress\').text());});signal();}'
  + 'function traffic() {$.get(\'/api/monitoring/traffic-statistics\', function (data) { var xml = data,xmlDoc = $.parseXML(xml),$xml = $(xmlDoc);$(\'#CurrentDownloadRate\').html(dataCon($xml.find(\'CurrentDownloadRate\').text(), 0) + " KB/s");$(\'#CurrentUploadRate\').html(dataCon($xml.find(\'CurrentUploadRate\').text(), 0) + " KB/s");});Main();}'
  + 'function signal() {$.get(\'/api/device/signal\', function (data) {var xml = data,xmlDoc = $.parseXML(xml),$xml = $(xmlDoc);$(\'#pci\').html(($xml.find(\'pci\').text() == "" ? $xml.find(\'sc\').text() : $xml.find(\'pci\').text()));$(\'#cell_id\').html($xml.find(\'cell_id\'));    if($xml.find(\'rsrp\').text() == ""){	$(\'#rsrqtr\').hide();	}else{	$(\'#rsrqtr\').show();	$(\'#rsrq\').html($xml.find(\'rsrq\').text());	$(\'#rsrp\').html($xml.find(\'rsrp\').text());	}$(\'#rssi\').html($xml.find(\'rssi\').text());$(\'#sinr\').html($xml.find(\'sinr\').text());    if($xml.find(\'txpower\').text() == ""){	$(\'#txpowertr\').hide();	}else{	$(\'#txpowertr\').show();	$(\'#txpower\').html($xml.find(\'txpower\').text());	}	if($xml.find(\'Rscp\').text() != ""){	$(\'#rscp\').html($xml.find(\'Rscp\').text());	rscp = 1;	}});signalpara();}'
  + 'function signalpara() {$.get(\'/api/net/signal-para\', function (data) {var xml = data,xmlDoc = $.parseXML(xml),$xml = $(xmlDoc);if(rscp == 0){$(\'#rscp\').html($xml.find(\'Rscp\').text());rscp = 0;}$(\'#ecio\').html($xml.find(\'Ecio\').text()); });traffic();}'
  + 'function dataCon(bytes, unit) {if (bytes > -1) {var unites = [1024, 1048576, 1073741824];bytes = bytes / unites[unit];return bytes.toFixed(2);} else {return 0;}}'
  + 'function plmn() {$(\'#netmode\').html(netType(G_MonitoringStatus.response.CurrentNetworkType));netmode();}'
  + 'function netmode() {$.get(\'/api/net/net-mode\', function (data) {var xml = data,xmlDoc = $.parseXML(xml),$xml = $(xmlDoc);$(\'#band\').html(_4GType($xml.find(\'LTEBand\').text()));});status();}'
  + 'function Main() {clearTimeout(g_logoutTimer);setTimeout(plmn, 100);}'
  //+ '	'
  + 'function refresh(val,val2,val3){g_setting_netWork.NetworkMode = val;g_setting_netWork.NetworkBand = val2;g_setting_netWork.LTEBand = val3;setting_dialup_saveVar();}'
  + '$(document).ready(function(){$("#btnAuto").click(function(){refresh("00","3FFFFFFF","7FFFFFFFFFFFFFFF");});$("#btn2G").click(function(){refresh("01","3FFFFFFF","7FFFFFFFFFFFFFFF");});$("#btn3G").click(function(){refresh("02","3FFFFFFF","7FFFFFFFFFFFFFFF");});$("#btn4G").click(function(){refresh("03","3FFFFFFF","7FFFFFFFFFFFFFFF");});$("#3G_2100").click(function(){refresh("02","400000","7FFFFFFFFFFFFFFF");});$("#3G_900").click(function(){refresh("02","2000000000000","7FFFFFFFFFFFFFFF");});$("#3G_1900").click(function(){refresh("02","800000","7FFFFFFFFFFFFFFF");});$("#3G_850").click(function(){refresh("02","4000000","7FFFFFFFFFFFFFFF");});$("#4G_1800").click(function(){refresh("03","3FFFFFFF","4");});$("#4G_2600").click(function(){refresh("03","3FFFFFFF","40");});$("#4G_800").click(function(){refresh("03","3FFFFFFF","80000");});$("#4G_2100").click(function(){refresh("03","3FFFFFFF","1");});$("#4G_8002100").click(function(){refresh("03","3FFFFFFF","80001");});$("#4G_8002600").click(function(){refresh("03","3FFFFFFF","80040");});$("#4G_8001800").click(function(){refresh("03","3FFFFFFF","80004");});$("#4G_18002100").click(function(){refresh("03","3FFFFFFF","5");});$("#4G_18002600").click(function(){refresh("03","3FFFFFFF","44");});$("#4G_21002600").click(function(){refresh("03","3FFFFFFF","41");});$("#4G_180021002600").click(function(){refresh("03","3FFFFFFF","45");});$("#4G_80021002600").click(function(){refresh("03","3FFFFFFF","80041");});$("#4G_80018002600").click(function(){refresh("03","3FFFFFFF","80044");});$("#4G_80018002100").click(function(){refresh("03","3FFFFFFF","80005");});$("#about").click(function(){alert("Nasser Al-Anzi\\nTwitter: @nas272\\nnas272@hotmail.com");});Main();});'
  + 'function netType(value) { is4G = false; var arr1 = ["no service","GSM","GPRS","EDGE","WCDMA","HSDPA","HSUPA","HSPA","TDSCDMA","HSPA +","EVDO rev. 0","EVDO rev. And","EVDO rev. B","1xRTT","UMB","1xEVDV","3xRTT","HSPA + 64QAM","HSPA + MIMO","LTE","IS95","IS95B","CDMA1X","EVDO rev. 0","EVDO rev. And","EVDO rev. B","Hybrid CDMA1X","Hybrid EVDO rev. 0","Hybrid EVDO rev. And","Hybrid EVDO rev. B","EHRPD rev. 0","EHRPD rev. And","EHRPD rev. B","The hybrid EHRPD rev. 0","The hybrid EHRPD rev. And","The hybrid EHRPD rev. B"]; var arr2 = ["WCDMA","HSDPA","HSUPA","HSPA","HSPA +","DC HSPA +"]; if(value == 81){ 	return "802.16"; }else if(value == 101){ 	is4G = true; 	return "4G"; }else if(value<37){ 	return arr1[value]; }else if(value<47 && value>40){ 	return arr2[value - 41]; }else if(value<66 && value>60){ 	return + arr2[value - 61]; }else{ 	return value; } return "";	}'
  + 'function _4GType(value) {	if(is4G == false){ 	return "";	}	if (value == "4") { return " - 1800 FDD";	} else if (value == "8000000004") { return " - 1800 FDD";	} else if (value == "80000") { return " - LTE 800";	} else if (value == "1") { return " - 2100 FDD";	} else if (value == "8000000000") { return " - 2100 TDD";	} else if (value == "40") { return " - LTE 2600";	} else if (value == "1") { return " - LTE 2300";	} else { if (value != "1A000000005" && value != "800C5" && value != "7FFFFFFFFFFFFFFF") { 	return " - " + value; }	}	return "";}';
var css =document.createElement('style');
css.innerHTML = '.draggable{left:151px;top:71px;position:absolute;width:684px;border:1px solid;background:#B0BAFC;font-size: medium;font-family:"Segoe UI"}table,th,td{border:1px solid#737373;border-collapse:collapse;min-width:120px;text-align:center;}.label{background-color:#A378FF;font-family:"Segoe UI";}.btn{background-color:#9361FF;font-family:"Segoe UI";}';
document.getElementsByTagName('head')[0].appendChild(script2);
document.getElementsByTagName('head')[0].appendChild(css);

var dump = '<div class="draggable"><table style="width: 100%;" dir="ltr" border="0"><tr><td colspan="4"  style="height: 23px;"><button id="about" style="position:absolute;left:0;top:0;height: 25px;width: 25px;" >i</button><span id="netmode"></span><span id="band"></span></td></tr><tr><td id="t21" class="label" >Cell ID</td><td><span id="cell_id">0</span></td><td id="t23" class="label">PCI</td><td><span id="pci">0</span></td> 				</tr> 				<tr> 				<td id="t31" class="label">RSSI</td><td><span id="rssi">0</span></td><td id="t33" class="label">SINR</td><td><span id="sinr">0</span></td> 				</tr> 				<tr id="rsrqtr"> 				<td id="t311" class="label">RSRQ</td><td id="rsrq">0</td><td id="t322" class="label">RSRP</td><td><span id="rsrp">0</span></td> 				</tr> 				<tr> 				<td id="t41" class="label">Rscp</td><td><span id="rscp">0</span></td><td id="t33" class="label">Ecio</td><td><span id="ecio">0</span></td> 				</tr> 				<tr id="txpowertr"> 				<td id="t61" class="label">txpower</td><td id="txpower" colspan="3" dir="ltr">0</td> 				</tr> 				<tr> 				<td id="t21" class="label">Current DL Rate</td><td><span id="CurrentDownloadRate" dir="ltr">0</span></td><td id="t23" class="label">Current UL Rate</td><td><span id="CurrentUploadRate" dir="ltr">0</span></td></tr><tr> 				<td id="t61" class="label"> IP</td><td colspan="3" id="ip">-</td></td> 				</tr> 			</table> 			<div style="width: 100%;" dir="ltr" >RAT: <input id="btn2G" class="btn" type="button" value="2G"></input>..<input id="btn3G" class="btn" type="button" value="3G"></input>..<input id="btn4G" class="btn" type="button" value="4G"></input>..<input id="btnAuto" class="btn" type="button" value="Auto"></input></div> 			<div style="width: 100%;" dir="ltr" >Band: </div> 			<div style="width: 100%;" dir="ltr" ><input id="3G_2100" class="btn" type="button" value="3G 2100"></input>..<input id="3G_900" class="btn" type="button" value="3G 900"></input>..<input id="3G_1900" class="btn" type="button" value="3G 1900"></input>..<input id="3G_850" class="btn" type="button" value="3G 850"></input><br><input id="4G_800" class="btn" type="button" value="LTE 800"></input>..<input id="4G_1800" class="btn" type="button" value="LTE 1800"></input>..<input id="4G_2100" class="btn" type="button" value="LTE 2100"></input>..<input id="4G_2600" class="btn" type="button" value="LTE 2600"></input>  </br>	<input id="4G_8001800" class="btn" type="button" value="LTE 800+1800"></input>..<input id="4G_8002100" class="btn" type="button" value="LTE 800+2100"></input>..<input id="4G_8002600" class="btn" type="button" value="LTE 800+2600"></input>..<input id="4G_18002100" class="btn" type="button" value="LTE 1800+2100"></input>..<input id="4G_18002600" class="btn" type="button" value="LTE 1800+2600"></input>..<input id="4G_21002600" class="btn" type="button" value="LTE 2100+2600"></input>  </br>	<input id="4G_80018002600" class="btn" type="button" value="3CC no LTE 2100"></input>..<input id="4G_80018002100" class="btn" type="button" value="3CC no LTE 2600"></input></div> 		</div>';

(function(){
	$('body').append(dump);
	$( ".draggable" ).resizable();
  $( ".draggable" ).draggable();
  
})();







												


