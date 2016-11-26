function fac(){
		var proid= facultyview.faculty.value;
		var xmlhttp = new XMLHttpRequest(); 
		
		xmlhttp.onreadystatechange = function(){ 
			if(xmlhttp.readyState==4&&xmlhttp.status==200){
				document.getElementById('faculty').innerHTML = xmlhttp.responseText; 
			}
		}
		xmlhttp.open('GET', 'ProjectNameView?facid='+facid, true); 
		xmlhttp.send();
		labsview.labname.value="";
	}