var fieldIndex = 0;

function addStudent(){
    var request;
    var name = document.getElementById("student_name").value
    if(name != ""){
        request = new XMLHttpRequest();
        request.open("POST", "/add_student" + name, true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("name=" + name);
    }
}