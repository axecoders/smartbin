function getTruckIds(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
        // alert("xhttp.responseText"+xhttp.responseText);
        // alert("xhttp.responseText"+xhttp.responseText);
    }
    };
    xhttp.open("GET", "/truck", true);
    xhttp.send();
    // alert("sent");
}

function UnAssignRoute(routeId,truckId){
    //alert("hi");
    if(truckId != "undefined"){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            //alert("xhttp.responseText"+xhttp.responseText);
        }
        };
        xhttp.open("GET", "/unassign?routeid="+routeId+"&truckid="+truckId, true);
        xhttp.send();
        //alert("ok");
        var x = document.getElementById("truckl_"+routeId);
        if(x != null){
            x.style.display = 'none';
        }
        var y = document.getElementById("unassign_"+routeId);
        if(y != null){
            y.style.display = 'none';
        }
        document.getElementById("assign_"+routeId).disabled=false;
        document.getElementById("assign_"+routeId).style.color ="";
        document.getElementById("select_"+routeId).disabled=false;
        document.getElementById("select_"+routeId).style.backgroundColor ="";
        //getTruckIds();
        //alert("sent");
    }
}

function assignRoute(routeId) {
    //alert("routeId:"+routeId);
    //alert("truckIdSelected:"+truckIdSelected);
    var truckIdSelected;
    truckIdSelected = document.getElementById("select_"+routeId).value;
    //alert("assign:"+truckIdSelected);
    if(truckIdSelected != "undefined"){
        if(truckIdSelected != undefined){
            if(truckIdSelected != "Select"){
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    //alert("xhttp.responseText"+xhttp.responseText);
                }
                };
                xhttp.open("GET", "/assign?routeid="+routeId+"&truckid="+truckIdSelected, true);
                xhttp.send();
                var x = document.getElementById("truckl_"+routeId);
                x.style.display = 'block';
                document.getElementById("truckl_"+routeId).innerHTML = "Route "+routeId+" assigned to "+truckIdSelected+" <input id='unassign' class='button' type='submit' value='Un-assign' onClick=UnAssignRoute("+routeId+",'"+truckIdSelected+"');//>";
                document.getElementById("assign_"+routeId).disabled=true;
                document.getElementById("assign_"+routeId).style.color ="LightGrey";
                document.getElementById("select_"+routeId).disabled=true;
                document.getElementById("select_"+routeId).style.backgroundColor ="LightGrey";
                document.getElementById("truck2_"+routeId).innerHTML = "";
            }
            else{
            //alert("hi");
                document.getElementById("truck2_"+routeId).innerHTML = "Please select Truck no.";
            }
        }
        else{
            document.getElementById("truck2_"+routeId).innerHTML = "Please select Truck no.";
        }
        //getTruckIds();
        //alert("sent");
    }
}